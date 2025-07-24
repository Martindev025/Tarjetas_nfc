<?php

namespace App\Http\Controllers;

use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\NfcCard;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\PrintCardsController;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\NfcCardsExport;
use App\Models\Event;
use App\Models\Company;



class NfcCardController extends Controller
{
    //mostrar listado de tarjetas NFC
    public function index()
    {
        $nfcCards = NfcCard::paginate(50);

        return view('nfc-cards.index', compact('nfcCards'));
    }

    //creacion de tarjeta relacionada por event_id
    public function create(Request $request)
    {
        $event_id = $request->query('event_id');

        $event = null;

        if (!is_null($event_id)) {
            $event = Event::findOrFail($event_id);
            // Obtener productos relacionados con las empresas del evento
            $products = $event->companies->flatMap->products;
        } else {
            $products = collect();
        }

        return view('nfc-cards.create', compact('event', 'products'));
    }

    // Almacenamiento de datos y solicitudes
    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required|string|max:255|unique:nfc_cards,nombre',
            'ciudad' => 'required|string',
            'celular' => 'required|string|max:255',
            'telefono_opc' => 'nullable|max:255',
            'telefono_opci' => 'nullable|max:255',
            'cargo' => 'required|string|max:255',
            'correo' => 'required|email|max:255',
            'correo_opc' => 'nullable|max:255',
            'pagina' => 'nullable|max:255',
            'pagina_opc' => 'nullable|max:255',
            'pagina_opcional' => 'nullable|max:255',
            'empresa' => 'required|string|max:255',
            'feature' => 'nullable|max:1024',
            'event_id' => 'required|exists:events,id',
            'product_ids' => 'required|array',
            'product_ids.*' => 'exists:products,id',
        ], [
            'nombre.unique' => 'El nombre ya está registrado. Por favor, elige otro nombre.'
        ]);

        $nfcCard = new NfcCard();
        $nfcCard->nombre = $request->nombre;
        $nfcCard->ciudad = $request->ciudad;
        $nfcCard->celular = $request->celular;
        $nfcCard->telefono_opc = $request->telefono_opc;
        $nfcCard->telefono_opci = $request->telefono_opci;
        $nfcCard->cargo = $request->cargo;
        $nfcCard->correo = $request->correo;
        $nfcCard->correo_opc = $request->correo_opc;
        $nfcCard->pagina = $request->pagina;
        $nfcCard->pagina_opc = $request->pagina_opc;
        $nfcCard->pagina_opcional = $request->pagina_opcional;
        $nfcCard->empresa = $request->empresa;
        $nfcCard->feature = $request->feature;
        $nfcCard->event_id = $request->event_id;

        if ($request->hasFile('feature')) {
            $destinationPath = 'storage/featureds';
            $filename = str_replace(' ', '_', $nfcCard->nombre) . '.png';
            $request->file('feature')->move($destinationPath, $filename);
            $nfcCard->feature = Str::finish($destinationPath, '/') . $filename;
        }

        $nfcCard->save();

        // Adjuntar productos
        $nfcCard->products()->attach($request->product_ids);

        // Generar QR
        $qrCodeController = new QRCodeController();
        $qrCodeController->generateQRCode($nfcCard->id, $nfcCard->nombre);

        // Crear HTML
        $html = view('plantilla', [
            'nfcCard' => $nfcCard,
            'products' => $nfcCard->products,
        ])->render();

        $nombre_archivo = str_replace(' ', '_', strtolower($nfcCard->nombre)) . '.html';
        $carpeta = public_path('storage/users');

        // ✅ Crear carpeta si no existe
        if (!file_exists($carpeta)) {
            mkdir($carpeta, 0777, true);
        }

        $ruta_archivo = $carpeta . DIRECTORY_SEPARATOR . $nombre_archivo;
        file_put_contents($ruta_archivo, $html);

        // Generar segunda plantilla (PDF o similar)
        $printCardsController = new PrintCardsController();
        $printCardsController->generateAndDownload($nfcCard);

        // Crear archivo VCF
        $vcfFilename = $nfcCard->nombre . '.vcf';
        $vcfContent = "BEGIN:VCARD\nVERSION:3.0\nFN:{$nfcCard->nombre}\nTEL:{$nfcCard->celular}\nEMAIL:{$nfcCard->correo}\nEND:VCARD";
        $vcfFolder = public_path('storage/contacts');

        if (!file_exists($vcfFolder)) {
            mkdir($vcfFolder, 0777, true);
        }

        file_put_contents($vcfFolder . DIRECTORY_SEPARATOR . $vcfFilename, $vcfContent);

       
        session()->flash('success', __('messages.nfc_cards.created_successfully'));
        return redirect()->route('events.nfc-cards', ['event' => $nfcCard->event_id]);
    }


    //Generacion y Almacenamineto print_card
    public function generateSecondHtml(NfcCard $nfcCard)
    {
        try {
            dd($nfcCard);

            Log::info('Generando segundo HTML para el usuario: ' . $nfcCard->nombre);

            $html = view('printcard')->with('nfcCard', $nfcCard)->render();

            $nombre_archivo = str_replace(' ', '_', strtolower($nfcCard->nombre)) . '_print.html';
            $carpeta = public_path('cards');
            $ruta_archivo = $carpeta . DIRECTORY_SEPARATOR . $nombre_archivo;

            file_put_contents($ruta_archivo, $html);

            return redirect()->route('nfc-cards.show', $nfcCard)->with('success', 'Segundo HTML generado exitosamente.');
        } catch (\Exception $e) {
            // Capturar la excepción y registrarla
            Log::error('Error al generar el segundo archivo HTML: ' . $e->getMessage());
            return back()->with('error', 'Error al generar el segundo HTML.');
        }
    }

    //Visualizacion de datos Card
    public function show(NfcCard $nfcCard)
    {
        $products = $nfcCard->products;

        return view('nfc-cards.show', compact('nfcCard', 'products'));
    }

    //Metodo para editar Nfc
    public function edit(NfcCard $nfc_card)
    {
        return view('events.nfc-cards', compact('nfc_card'));
    }

    //Metodo para actualizar NFC
    public function update(Request $request, NfcCard $nfc_card)
    {
        $request->validate([
            'nombre' => '|string|max:255',
            'ciudad' => '|string',
            'telefono_opc' => '||max:255',
            'telefono_opci' => '||max:255',
            'cargo' => '|string|max:255',
            'correo' => '|email|max:255',
            'correo_opc' => '||max:255',
            'pagina' => '||max:255',
            'feature' => 'nullable|max:1024',
            'pagina_opc' => '||max:255',
            'pagina_opcional' => '||max:255',
            'empresa' => '|string|max:255',
        ]);

        $this->deleteHtmlFile($nfc_card);

        $nfc_card->nombre = $request->nombre;
        $nfc_card->ciudad = $request->ciudad;
        $nfc_card->celular = $request->celular;
        $nfc_card->telefono_opc = $request->telefono_opc;
        $nfc_card->telefono_opci = $request->telefono_opci;
        $nfc_card->cargo = $request->cargo;
        $nfc_card->correo = $request->correo;
        $nfc_card->correo_opc = $request->correo_opc;
        $nfc_card->pagina = $request->pagina;
        $nfc_card->feature = $request->feature;
        $nfc_card->pagina_opc = $request->pagina_opc;
        $nfc_card->pagina_opcional = $request->pagina_opcional;

        if ($request->hasFile('feature')) {
            $request->file('featureds');
            $destinationPath = ('storage/featureds');
            $filename = str_replace(' ', '_', ($nfc_card->nombre)) . '.png';
            $uploadSuccess = $request->file('feature')->move($destinationPath, $filename);
            $nfc_card->feature = Str::finish($destinationPath, '/') . $filename;

            $carpeta = public_path('storage/featureds/');
            $ruta_archivo = $carpeta . DIRECTORY_SEPARATOR . $filename;
        }

        $nfc_card->save();


        $this->generateHtmlFile($nfc_card);

        return redirect()->route('nfc-cards.show', $nfc_card)->with('success', 'Datos actualizados y archivo HTML regenerado correctamente.');
    }

    //Metodo para eliminar Card y relacionado
    public function destroy(NfcCard $nfcCard)
    {
        // Guarda el ID del evento antes de eliminar la tarjeta
        $eventId = $nfcCard->event_id;

        // Ruta del archivo QR
        $qrCodePath = storage_path('app/public/qrcodes/' . $nfcCard->id . '.png');

        // Ruta del primer archivo HTML
        $htmlFilePath = public_path('storage/users/' . str_replace(' ', '_', strtolower($nfcCard->nombre)) . '.html');

        // Ruta del segundo archivo HTML generado por PrintCardsController
        $printCardHtmlPath = storage_path('app/public/printcards/' . str_replace(' ', '_', strtolower($nfcCard->nombre)) . '.html');

        // Ruta de la imagen si existe
        $imagePath = $nfcCard->feature;

        // Elimina el archivo QR si existe
        if (file_exists($qrCodePath)) {
            unlink($qrCodePath);
        }

        // Elimina el archivo HTML principal si existe
        if (file_exists($htmlFilePath)) {
            unlink($htmlFilePath);
        }

        // Elimina el segundo archivo HTML si existe
        if (file_exists($printCardHtmlPath)) {
            unlink($printCardHtmlPath);
        }

        // Elimina la imagen si existe
        if ($imagePath && file_exists(public_path($imagePath))) {
            unlink(public_path($imagePath));
        }

        // Elimina la tarjeta
        $nfcCard->delete();

        // Redirecciona a la ruta de eventos con el ID del evento guardado
        return redirect()->route('events.nfc-cards', ['event' => $eventId]);
    }

    // Devuelve informacion para el link
    public function getHtmlFileName($usuarioId)
    {
        $usuario = Usuario::find($usuarioId);
        return str_replace(' ', '_', strtolower($usuario->nombre)) . '.html';
    }

    protected function deleteHtmlFile(NfcCard $nfcCard)
    {
        $nombreArchivo = str_replace(' ', '_', strtolower($nfcCard->nombre)) . '.html';
        $carpeta = public_path('storage/users'); // Asegúrate de que esta sea la ruta correcta
        $rutaArchivo = $carpeta . DIRECTORY_SEPARATOR . $nombreArchivo;

        if (file_exists($rutaArchivo)) {
            unlink($rutaArchivo);
        }
    }

    public function generateHtmlFile(NfcCard $nfcCard)
    {
        // Genera la plantilla HTML con los datos actualizados
        $html = view('plantilla', ['nfcCard' => $nfcCard])->render();

        // Define el nombre del archivo y la ruta de almacenamiento
        $nombre_archivo = str_replace(' ', '_', strtolower($nfcCard->nombre)) . '.html';
        $carpeta = public_path('storage/users');
        $ruta_archivo = $carpeta . DIRECTORY_SEPARATOR . $nombre_archivo;

        // Asegúrate de que el directorio exista
        if (!file_exists($carpeta)) {
            mkdir($carpeta, 0777, true);
        }

        // Guarda el archivo HTML en la ruta especificada
        file_put_contents($ruta_archivo, $html);
    }


    //Logica de exportacion excel
    public function exportarExcel($eventId)
    {
        // Asegúrate de que estás obteniendo los modelos de NfcCard
        $nfcCards = NfcCard::where('event_id', $eventId)->get();



        return Excel::download(new NfcCardsExport($nfcCards), 'nfc_cards.xlsx');
    }
}
