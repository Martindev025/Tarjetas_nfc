<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Company;
use App\Models\ProductImage;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // Traer todos los productos y empresas
        $products = Product::all();
        $companies = Company::all();

        // Retornar la vista con los datos
        return view('products.indexProdCom', compact('products', 'companies'));
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:products,name',
            'company_id' => 'required|exists:companies,id',
            'images.*' => 'image|mimes:jpg,jpeg,png,webp|max:2048'
        ]);

        $product = Product::create([
            'name' => $request->name,
            'company_id' => $request->company_id
        ]);

        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $image) {
                $path = $image->store('products', 'public');
                ProductImage::create([
                    'product_id' => $product->id,
                    'image_path' => $path,
                ]);
            }
        }

        return redirect()->route('products.indexProdCom')->with('success', 'Producto creado con éxito');
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
    public function update(Request $request, Product $product)
    {
        $request->validate([
            'name' => 'required|unique:products,name,' . $product->id,
            'company_id' => 'required|exists:companies,id'
        ]);

        $product->update([
            'name' => $request->name,
            'company_id' => $request->company_id
        ]);

        return redirect()->route('products.indexProdCom')->with('success', 'Producto actualizado con éxito');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Product $product)
    {
        $product->delete();

        return redirect()->route('products.indexProdCom')->with('success', 'Producto eliminado con éxito');
    }

    public function showByCompany($empresaId)
    {
        $empresa = Company::with('products')->findOrFail($empresaId);

        // Agrega esto:
        $companies = Company::all();

        return view('products.byCompany', [
            'empresa' => $empresa,
            'companies' => $companies, // ← Asegúrate de pasar esta variable
        ]);
    }
}
