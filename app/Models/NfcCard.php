<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NfcCard extends Model
{
    use HasFactory;

    // Definir los campos fillable
    protected $fillable = [
        'nombre',
        'ciudad',
        'celular',
        'telefono_opc',
        'telefono_opci',
        'cargo',
        'correo',
        'correo_opc',
        'pagina',
        'pagina_opc',
        'empresa',
        'feature',
        'event_id', // Agregar el campo event_id
    ];

    // Definir la relación con el modelo Event
    public function event()
    {
        return $this->belongsTo(Event::class);
    }
  public function getFotoUrlAttribute()
{
    logger('FEATURE:', [$this->feature]);

    if ($this->feature && file_exists(public_path($this->feature))) {
        return asset($this->feature);
    }

    return asset('img/user.png');
}


    //método getHtmlFileName()
    public function getHtmlFileName()
    {
        return str_replace(' ', '_', strtolower($this->nombre)) . '.html';
    }

    public function products()
    {
        return $this->belongsToMany(Product::class, 'products_nfc_cards', 'nfc_card_id', 'product_id');
    }

    public function companies()
    {
        return $this->event ? $this->event->companies : collect([]);
    }
}
	