<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Company extends Model
{
    use HasFactory;

    protected $fillable = ['name'];

    public function products()
    {
        return $this->hasMany(Product::class);
    }

    public function events()
    {
        return $this->belongsToMany(Event::class, 'event_company');
    }

    public function nfcCards()
    {
        return $this->hasManyThrough(NfcCard::class, Event::class);
    }
}
