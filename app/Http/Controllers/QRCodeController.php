<?php
 
namespace App\Http\Controllers;
 
use Illuminate\Http\Request;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Illuminate\Support\Facades\Storage;
use App\Models\NfcCard; // Asegúrate de importar el modelo NfcCard si es necesario
 
class QRCodeController extends Controller
{
    public function generateQRCode($userId, $nombreUsuario)
    {
        try {
            // Reemplaza los espacios por guiones bajos o realiza cualquier otra normalización requerida
            $nombreArchivoUsuario = str_replace(' ', '_', $nombreUsuario);
 
            // URL que deseas codificar en el código QR
            $url = 'https://tecsersas.com/cards/public/storage/users/' . $nombreArchivoUsuario . '.html';
 
            // Generar el código QR y guardar la imagen en un archivo temporal
            $path = storage_path('app/public/qrcodes/');
            $filename = $userId . '.png'; // Usar el nombre del usuario para el archivo
            QrCode::format('png')
            ->size(275) // Tamaño del código QR
            ->margin(2) // Margen del código QR
            ->errorCorrection('H') // Nivel de corrección de errores
            ->backgroundColor(255, 255, 255, 0) // Fondo transparente (RGBA)
            ->generate($url, $path . $filename);
 
            // Devolver la ruta de la imagen del código QR
            $qrCodeUrl = asset('storage/qrcodes/' . $filename);
 
            // Retornar la ruta del código QR generado
            return $qrCodeUrl;
        } catch (\Exception $e) {
            // Capturar la excepción y registrar el error en los logs si es necesario
            return null; // o devuelve un mensaje de error, dependiendo de tus necesidades
        }
    }
}