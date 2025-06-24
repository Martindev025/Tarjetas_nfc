<?php
namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithMapping;


class NfcCardsExport implements FromCollection, WithHeadings, WithMapping, ShouldAutoSize
{
    protected $datos;

    public function __construct($datos)
    {
        $this->datos = $datos;
    }

    public function collection()
    {
        return $this->datos;
    }

    public function headings(): array
    {
        return [
            '#',
            'Nombre',
            'Ciudad/Municipio',
            'Celular',
            'Celular Opcional',
            'Telefono Opcional',
            'Cargo',
            'Correo',
            'Correo segundario',
            'Pagina Web',
            'Productos',
            'Empresas',
            // Añade aquí todos los encabezados que necesitas
        ];
    }

    public function map($nfcCard): array
    {
        $companies = $nfcCard->companies();
        $products = $nfcCard->products;

        return [
            $nfcCard->id,
            $nfcCard->nombre,
            $nfcCard->ciudad,
            $nfcCard->celular,
            $nfcCard->telefono_opc,
            $nfcCard->telefono_opci,
            $nfcCard->cargo,
            $nfcCard->correo,
            $nfcCard->correo_opc,
            $nfcCard->pagina,
            $products->pluck('name')->join(', '), // Lista de productos
            $companies->pluck('name')->join(', '), // Lista de empresas
        ];
    }
}