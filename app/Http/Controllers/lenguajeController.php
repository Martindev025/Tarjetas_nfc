<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class lenguajeController extends Controller
{
    public function setLocale(Request $request, $locale)
{
    if (!in_array($locale, ['en', 'es'])) {
        $locale = 'es';
    }

    $request->session()->put('locale', $locale);

    return redirect()->back();
}
}