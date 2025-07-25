<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'company_id'];

    public function company()
    {
        return $this->belongsTo(Company::class);
    }

    public function nfcCards()
    {
        return $this->belongsToMany(NfcCard::class, 'products_nfc_cards');
    }

    public function images()
    {
        return $this->hasMany(ProductImage::class);
    }
}
