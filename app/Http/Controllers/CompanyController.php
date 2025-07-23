<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Company;


class CompanyController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        //
        $request->validate([
            'name' => 'required|string|max:255',
            // otras validaciones...
        ]);

        Company::create($request->all());

        return redirect()->route('products.indexProdCom')->with('success', 'Empresa creada con éxito');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
        return view('products.createCompany');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255|unique:companies,name',
        ]);

        Company::create(['name' => $request->input('name')]);

        return redirect()->route('products.indexProdCom')->with('success', __('messages.companies.created_successfully'));
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Company $company)
    {
        $request->validate([
            'name' => 'required|string|max:255|unique:companies,name,' . $company->id,
        ]);

        $company->update(['name' => $request->name]);

        return redirect()->back()->with('success', __('messages.companies.updated_successfully'));
    }

    /**
     * Remove the specified resource from storage.
     */

    public function destroy(Company $company)
    {
        // Verificar si tiene productos asociados
        if ($company->products()->count() > 0) {
            return redirect()->back()->with('error', __('messages.companies.cannot_delete_with_products'));
        }

        // Verificar si tiene eventos asociados
        if ($company->events()->exists()) {
            return redirect()->back()->with('error', __('messages.companies.cannot_delete_with_events'));
        }

        // Eliminar la empresa si no tiene productos ni eventos
        $company->delete();

        return redirect()->route('products.indexProdCom')->with('success', __('messages.companies.deleted_successfully'));
    }
}
