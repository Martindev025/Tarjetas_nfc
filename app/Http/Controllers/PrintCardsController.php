<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Log;
use App\Models\NfcCard;
use Illuminate\Support\Str;
use App\Models\Event;

class PrintCardsController extends Controller
{
    public function generateAndDownload(NfcCard $nfcCard)
    {
        try {
            // Obtener el evento asociado al NFC card
            $event = Event::find($nfcCard->event_id);

            // Verificar si se encontró el evento
            if (!$event) {
                return back()->with('error', 'No se encontró el evento asociado al NFC card.');
            }

            Log::info('Inicio del proceso de generación del HTML para: ' . $nfcCard->nombre);

            // Generar el contenido HTML del segundo archivo
            $htmlContent = view('printcards', compact('nfcCard', 'event'))->render();
            Log::info('HTML generado');

            // Definir la ubicación donde se guardará el archivo
            $fileName = str_replace(' ', '_', strtolower($nfcCard->nombre)) . '.html';
            $filePath = storage_path('app/public/printcards/' . $fileName);
            Log::info('Ruta del archivo: ' . $filePath);

            // Guardar el contenido HTML en el archivo
            File::put($filePath, $htmlContent);
            Log::info('Archivo supuestamente guardado');

            // Verificar si el archivo se ha guardado correctamente
            if (File::exists($filePath)) {
                Log::info('El archivo existe, procediendo a la descarga');
                // Descargar el archivo
                return response()->download($filePath, $fileName);
            } else {
                // Si hay algún error, devolver un mensaje de error
                Log::error('El archivo no existe después de intentar guardarlo');
                return response()->json(['error' => 'Error al generar y descargar el segundo HTML'], 500);
            }
        } catch (\Exception $e) {
            // Capturar la excepción y registrarla
            Log::error('Error al generar el segundo archivo HTML: ' . $e->getMessage());
            return back()->with('error', 'Error al generar el segundo HTML.');
        }
    }

    public function serveFile($fileName)
    {
        $filePath = storage_path('app/public/printcards/' . $fileName);

        if (!File::exists($filePath)) {
            abort(404);
        }

        // Aquí puedes añadir cualquier lógica adicional para verificar
        // si el usuario tiene permiso para acceder al archivo.

        return response()->file($filePath);
    }
}


