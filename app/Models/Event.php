<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Event extends Model
{

    protected $fillable = ['nombre', 'fecha'];

    public function nfcCards()
    {
        return $this->hasMany(NfcCard::class);
    }
     // Nueva relación
    public function companies()
    {
        return $this->belongsToMany(Company::class, 'event_company');
    }
}
