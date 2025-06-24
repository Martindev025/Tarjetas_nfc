<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;


class HTMLController extends Controller
{
    // Mostrar el Html dinamico
    public function showTemplate()
    {
        $filePath = storage_path('app/public/template.html');

        if (File::exists($filePath)) {
            $htmlContent = File::get($filePath);

            return response($htmlContent)
                ->header('Content-Type', 'text/html');
        } else {
            return response('Archivo HTML no encontrado', 404);
        }
    }
    
}
