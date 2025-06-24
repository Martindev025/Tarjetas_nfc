@extends('layout')

@section('content')



<body style="background-image: url('{{ asset('img/header.jpg') }}'); background-size: cover; background-repeat: no-repeat; background-position: center; ">

    <h1 class="text-page">{{ trans('messages.dash.title') }}</h1>
    <div class="page-index" style="display: flex; margin-bottom: 4rem;">
        <div style="flex: 1;">
            <p class="p-index">{{ trans('messages.dash.text') }}</p>

            <div class="btn1 btn__primary"><p><a href="{{ route('events.index') }}">{{ trans('messages.dash.botton') }}</a></p></div>

        </div>
        <div style="flex: 0 0 30%;">
            <img class="img-index" src="{{ asset('img/nfc.png') }}" alt="Imagen">

        </div>
    </div>




@endsection
