<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\lenguajeController;
use App\Http\Controllers\EventController;
use App\Http\Controllers\QRCodeController;
use App\Http\Controllers\PrintCardsController;
use App\Http\Controllers\HTMLController;
use App\Http\Controllers\NfcCardController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CompanyController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

/* Languaje */
Route::get('lang/{locale}', [lenguajeController::class, 'setLocale'])->name('setLocale');
/* Fin Languaje */

Route::get('/preview-template', [NfcCardController::class, 'previewTemplate']);

Route::get('/products/{empresa}/products', [ProductController::class, 'showByCompany'])->name('products.byCompany');
Route::get('/', function () {
    return view('dashboard');
})->middleware('auth')->name('dashboard');

Route::get('/productos-y-empresas', [ProductController::class, 'index'])
     ->name('products.index');

Route::get('/companies/create', [ProductController::class, 'create'])->name('companies.create');
Route::put('/companies/{company}', [CompanyController::class, 'update'])->name('companies.update');
Route::post('/companies', [CompanyController::class, 'store'])->name('companies.store');
Route::delete('/companies/{company}', [CompanyController::class, 'destroy'])->name('companies.destroy');
Route::get('/companies', [CompanyController::class, 'index'])->name('companies.index');


Route::post('/products', [ProductController::class, 'store'])->name('products.store');
// O si necesitas mantener 'indexProdCom' en el nombre de ruta
Route::get('/products', [ProductController::class, 'index'])
     ->name('products.indexProdCom');

// Actualizar producto
Route::put('/products/{product}', [ProductController::class, 'update'])->name('products.update');

// Eliminar producto
Route::delete('/products/{product}', [ProductController::class, 'destroy'])->name('products.destroy');

 //use NfcCardController
Route::get('/nfc-cards', [NfcCardController::class, 'index'])->name('nfc-cards.index')->middleware('auth');
Route::get('/nfc-cards/create', [NfcCardController::class, 'create'])->name('nfc-cards.create')->middleware('auth');
Route::post('/nfc-cards', [NfcCardController::class, 'store'])->name('nfc-cards.store')->middleware('auth');
Route::get('/nfc-cards/{nfc_card}', [NfcCardController::class, 'show'])->name('nfc-cards.show')->middleware('auth');
Route::get('/nfc-cards/{nfc_card}/edit', [NfcCardController::class, 'edit'])->name('nfc-cards.edit')->middleware('auth');
Route::put('/nfc-cards/{nfc_card}', [NfcCardController::class, 'update'])->name('nfc-cards.update')->middleware('auth');
Route::delete('/nfc-cards/{nfc_card}', [NfcCardController::class, 'destroy'])->name('nfc-cards.destroy')->middleware('auth');
Route::get('/filtro-nombre', [NfcCardController::class, 'filtroNombre'])->name('filtro.nombre');
Route::get('/exportar-excel/{eventId}', [NfcCardController::class, 'exportarExcel'])->name('exportar.excel');


 //use HTMLController
Route::get('/plantilla/{id}', [HTMLController::class, 'showTemplate'])->name('template.show')->middleware('auth');
 

 //printcardsController
Route::get('/print-cards', [PrintCardsController::class, 'generateAndDownload'])->name('print-cards.generate');
Route::get('/printcards/{fileName}', [PrintCardsController::class, 'serveFile'])->name('printcards.serve')->middleware('auth');


 //use QRcodeController
Route::get('/generate-qr-code/{nombreUsuario}', [QRCodeController::class, 'generateQRCode']);


Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
// Use eventcontroller
Route::get('/events/create', [EventController::class, 'create'])->name('events.create')->middleware('auth');
Route::post('/events', [EventController::class, 'store'])->name('events.store')->middleware('auth');
Route::get('/events', [EventController::class, 'index'])->name('events.index')->middleware('auth');
Route::get('/events/{event}', [EventController::class, 'show'])->name('events.show')->middleware('auth');
Route::get('/events/{event}/edit', [EventController::class, 'edit'])->name('events.edit')->middleware('auth');
Route::put('/events/{event}', [EventController::class, 'update'])->name('events.update')->middleware('auth');
Route::delete('/events/{event}', [EventController::class, 'destroy'])->name('events.destroy')->middleware('auth');
Route::get('/events/{event}/create-nfc-card', [EventController::class, 'createNfcCard'])->name('events.createNfcCard')->middleware('auth');
Route::get('/events/{event}/nfc-cards', [EventController::class, 'showNfcCards'])->name('events.nfc-cards')->middleware('auth');
Route::get('/events', [EventController::class, 'index'])->name('events.index')->middleware('auth');

// Eventos
Route::resource('events', EventController::class);

