@extends('layout')
@section('content')
@include('nfc-cards.create', ['products' => $products, 'event' => $event])

<!-- Preloader HTML -->



<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12 px-0">
            <section class="d-flex align-items-start justify-content-between mb-3" style="width:100%;">
                <div>
                    <h1 class="mb-1" style="font-size: 2rem; font-weight: 700; color: #222; letter-spacing: 1px; margin-bottom: 0;">TARJETAS</h1>
                    <div style="font-size: 1rem; color: #222; font-weight: 500;">Listado de Tarjetas</div>
                </div>
                <div class="d-flex align-items-start gap-2" style="margin-top: 2px;">

                     <button type="button" class="custom-action-btn" onclick="document.getElementById('modalForm').style.display='block'">
         Agregar Tarjeta NFC
    </button>
                   
                    <a href="{{ route('exportar.excel', ['eventId' => $event->id]) }}" class="custom-action-btn">
                        Exportar a Excel
                    </a>
                    
                </div>
            </section>
        </div>
    </div>
</div>

<div class="card mb-2">
              <div class="card-body">
<table class="table" id="myTable">
    <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">{{ trans('messages.index.name') }}</th>
            <th scope="col">{{ trans('messages.index.position') }}</th>
            <th scope="col">{{ trans('messages.index.country') }}</th>
            <th scope="col">{{ trans('messages.index.phone') }}</th>
            <th scope="col">{{ trans('messages.index.e-mail') }}</th>
            <th scope="col">{{ trans('messages.index.actions') }}</th>
            <th scope="col">{{ trans('messages.index.link') }}</th> 
        </tr>
    </thead>
    <tbody>
        @php 
            // Calcula el número inicial del contador en función de la página actual y la cantidad de elementos por página
            $counter = ($nfcCards->currentPage() - 1) * $nfcCards->perPage() + 1; 
        @endphp
        @foreach($nfcCards as $nfcCard)
        <tr>
            <th scope="row">{{ $counter++ }}</th>
            <td>{{ Illuminate\Support\Str::limit($nfcCard->nombre, 10) }}</td>
            <td>{{ Illuminate\Support\Str::limit($nfcCard->cargo, 10) }}</td>
            <td>{{ Illuminate\Support\Str::limit($nfcCard->ciudad, 10) }}</td>
            <td>{{ $nfcCard->celular }}</td>
            <td>{{ Illuminate\Support\Str::limit($nfcCard->correo, 10) }}</td>

            
            <td>
                    <a href="{{ route('nfc-cards.show', $nfcCard) }}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
  <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
  <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
</svg></a>



                    <a  onclick="document.getElementById('modalFormEdit').style.display='block'">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
</svg></a>

                                        <a href="#" onclick="copyLinkToClipboard('{{ asset('storage/users/' . $nfcCard->getHtmlFileName($nfcCard->id)) }}')">
                   <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-link" viewBox="0 0 16 16">
  <path d="M6.354 5.5H4a3 3 0 0 0 0 6h3a3 3 0 0 0 2.83-4H9q-.13 0-.25.031A2 2 0 0 1 7 10.5H4a2 2 0 1 1 0-4h1.535c.218-.376.495-.714.82-1z"/>
  <path d="M9 5.5a3 3 0 0 0-2.83 4h1.098A2 2 0 0 1 9 6.5h3a2 2 0 1 1 0 4h-1.535a4 4 0 0 1-.82 1H12a3 3 0 1 0 0-6z"/>
</svg>
                </a>
                
                    <form id="delete-form-{{ $nfcCard->id }}" action="{{ route('nfc-cards.destroy', $nfcCard) }}" method="POST" style="display: inline;">
    @csrf
    @method('DELETE')
    <button type="button"
        onclick="confirmDelete({{ $nfcCard->id }})"
        style="outline: none; border-color: transparent; background: transparent;">
        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
            class="bi bi-trash" viewBox="0 0 16 16">
            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 
            .5-.5m2.5 0a.5.5 0 0 1 
            .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 
            .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
            <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 
            1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 
            1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 
            1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 
            4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 
            1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
        </svg>
    </button>
</form>

                </td>
                <td> <!-- Columna para el enlace HTML -->
                    <a href="{{ asset('storage/users/' . $nfcCard->getHtmlFileName($nfcCard->id)) }}" class="custom-action-btn1" target="_blank">{{ trans('messages.index.view') }}</a>
                    <a href="{{ asset('..//storage/app/public/printcards/' . $nfcCard->getHtmlFileName($nfcCard->id)) }}" class="custom-action-btn1" target="_blank">{{ trans('messages.index.print') }}</a>
                </td>
                <!-- Columna para el enlace HTML -->
                    
                
            </tr>
            @include('nfc-cards.edit', ['nfc_card' => $nfcCard])
            @endforeach
        </tbody>
    </table>
    <div class="card">
              <div class="card-body">
    @if($nfcCards->hasPages())
    <div class="pagination">
    {{ $nfcCards->links('vendor.pagination.default') }}
</div>
@endif
</div>
<script>
    let table = new DataTable('#myTable');

     function confirmDelete(id) {
        Swal.fire({
            title: '{{ __("¿Estás seguro?") }}',
            text: '{{ __("messages.index.delete") }}',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#6c757d',
            confirmButtonText: '{{ __("Sí, eliminar") }}',
            cancelButtonText: '{{ __("Cancelar") }}'
        }).then((result) => {
            if (result.isConfirmed) {
                document.getElementById('delete-form-' + id).submit();
            }
        });
    }

     setTimeout(function () {
        let alerts = document.querySelectorAll('.fade-out-error');
        alerts.forEach(function(alert) {
            alert.style.transition = "opacity 0.5s ease-out";
            alert.style.opacity = "0";
            setTimeout(() => alert.remove(), 500);
        });
    }, 5000); // 
</script>
@endsection
