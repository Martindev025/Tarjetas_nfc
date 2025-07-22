{{-- filepath: resources/views/nfc-cards/show.blade.php --}}
@extends('layout')

@section('content')
<div class="profile-bg-header container-fluid" style="background: url('{{ asset('img/fondo_banner.jpg') }}') center/cover no-repeat; height: 300px; border-radius: 18px 18px 0 0;"></div>
<div class="container profile-card-container  mb-3" style="max-width: 700px; margin-top: -90px; background: #fff; border-radius: 18px; box-shadow: 0 4px 24px rgba(44,62,80,0.07); padding: 0 0 32px 0;">
    <div class="d-flex flex-column align-items-center" style="position: relative;">
      

       <div class="profile-img-wrapper" style="margin-top: -70px;">
    <img src="{{ $nfcCard->foto_url }}" alt="Foto de {{ $nfcCard->nombre }}" class="foto-usuario" style="width: 130px; height: 130px; object-fit: cover; border-radius: 50%; border: 6px solid #fff; box-shadow: 0 2px 12px rgba(44,62,80,0.10);">
</div>


        <h2 class="mt-3 mb-1" style="font-weight: 700; font-size: 2rem;">{{ $nfcCard->nombre }}</h2>
    </div>
  <div class="row justify-content-center mt-3">
    <div class="col-12 col-md-10">
        <div class="d-flex flex-row gap-4" style="justify-content: space-between;">
            <!-- Columna Izquierda -->
            <div style="flex:1; min-width: 220px;">
                <div class="mb-3">
                    <div class="profile-label"><strong>{{ trans('messages.details.position') }} </strong></div>
                    <div class="profile-value">{{ $nfcCard->cargo }}</div>
                </div>
                <div class="mb-3">
                    <div class="profile-label"> <strong> {{ trans('messages.details.city') }} </strong></div>
                    <div class="profile-value">{{ $nfcCard->ciudad }}</div>
                </div>
                <div class="mb-3">
                    <div class="profile-label"> <strong> {{ trans('messages.details.phone') }} </strong></div>
                    <div class="profile-value">{{ $nfcCard->celular }}</div>
                </div>
               
                
            </div>
            <!-- Columna Derecha -->
            <div style="flex:1; min-width: 220px;">
                 <div class="mb-3">
                    <div class="profile-label"> <strong>{{ trans('messages.details.e-mail') }} </strong></div>
                    <div class="profile-value">{{ $nfcCard->correo }}</div>
                </div>
                <div class="mb-3">
                    <div class="profile-label"> <strong>{{ trans('messages.details.product') }} </strong></div>
                    <div class="profile-value">
                        @forelse ($products as $product)
                            {{ $product->name }}<br>
                        @empty
                            N/A
                        @endforelse
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</div>
    <div style="margin-left: 2rem">
     <a href="{{ url()->previous() }}" class="custom-action-btn "  >
    @lang('messages.products.back_button')
</a>              
</div>
</div>
@endsection