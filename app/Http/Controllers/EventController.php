<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Event;
use App\Models\Company;
use App\Models\Product;



class EventController extends Controller
{
    // Método para mostrar el formulario de creación de eventos
    public function create()
{
    $companies = Company::all(); 
    return view('events.create', compact('companies'));
}
    
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'fecha' => 'required|date',
            'template' => 'required|string|max:255', 
            'companies' => 'required|array', 
            'companies.*' => 'exists:companies,id',
        ]);

        $event = new Event();
        $event->name = $request->input('name');
        $event->fecha = $request->input('fecha');
        $event->template = $request->input('template'); 
        $event->save();

        $event->companies()->attach($request->companies);
    
        return redirect()->route('events.index')->with('success', 'Evento creado correctamente.');
    }

    // Método para mostrar la lista de eventos
 public function index(Request $request)
{
    $events = Event::query();

    if ($request->filled('name')) {
        $events->where('name', 'like', '%' . $request->input('name') . '%');
    }

    if ($request->filled('date')) {
        $events->whereDate('fecha', $request->input('date'));
    }

    $events = $events->get();
    $companies = Company::all(); // ✅ Añadido aquí

    return view('events.index', compact('events', 'companies'));
}


    // Método para mostrar un solo evento
    public function show(Event $event)
    {
        $event->load('companies.products'); 
        return view('events.show', compact('event'));
    }

    // Método para mostrar el formulario de edición de eventos
    public function edit(Event $event)
    {
        return view('events.edit', compact('event'));
    }

    // Método para actualizar un evento en la base de datos
    public function update(Request $request, Event $event)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'fecha' => 'required|date',
        ]);
        $event->name = $request->name;
        $event->fecha = $request->input('fecha');
        $event->save();
        return redirect()->route('events.index')->with('success', 'Evento actualizado correctamente.');
    }

    // Método para eliminar un evento
   public function destroy(Event $event)
{
    if ($event->nfcCards()->exists()) {
        return back()->with('alert_message', '⚠️ No se puede eliminar el evento porque tiene tarjetas asociadas.');
    }

    $event->delete();
    return back()->with('alert_message', '✅ Evento eliminado correctamente.');
}
    public function createNfcCard(Event $event)
{
    return view('nfc-cards.create', compact('event'));
}

//Metodo para filtrar las cards
public function showNfcCards(Request $request, Event $event)
{
    $query = $event->nfcCards();

    if ($request->filled('search')) {
        $query->where('nombre', 'like', '%' . $request->input('search') . '%');
    }

    $nfcCards = $query->paginate(50);

    // ✅ Solo los productos de las empresas del evento
    $event->load('companies.products');
    $products = $event->companies->flatMap->products;

    return view('events.nfc-cards', compact('nfcCards', 'event', 'products'));
}

}
