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
        'name' => 'required|string|max:255',
    ]);

    Company::create(['name' => $request->input('name')]);

    return redirect()->route('products.indexProdCom')->with('success', 'Empresa creada con éxito.');
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
        'name' => 'required|string|max:255',
    ]);

    $company->update(['name' => $request->name]);

    return redirect()->back()->with('success', 'Empresa actualizada correctamente.');
}

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Company $company)
{
    // Verificar si tiene productos asociados
    if ($company->products()->count() > 0) {
        return redirect()->back()->with('error', 'No puedes eliminar la empresa porque tiene productos asociados.');
    }

    // Verificar si tiene eventos asociados
    if ($company->events()->exists()) {
        return redirect()->back()->with('error', 'No se puede eliminar la empresa porque está asociada a uno o más eventos.');
    }

    // Eliminar la empresa si no tiene productos ni eventos
    $company->delete();

    return redirect()->route('products.indexProdCom')->with('success', 'Empresa eliminada con éxito');
}

}
