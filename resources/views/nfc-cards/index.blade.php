@extends('layout')

@section('content')

<div class="container">
    <h1 class="mb-4">{{ trans('messages.index.title') }}</h1>
    <a href="{{ route('nfc-cards.create') }}" class="btn btn-primary mb-3">{{ trans('messages.index.add') }}</a>
    <a href="{{ route('exportar.excel') }}" class="btn btn-primary mb-3">{{ trans('messages.index.export') }}</a>
    
    <table class="table">
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
            @foreach($nfcCards as $nfcCard)
            <tr>
                <th scope="row">{{ $nfcCard->id }}</th>
                <td>{{ $nfcCard->nombre }}</td>
                <td>{{ $nfcCard->cargo }}</td>
                <td>{{ $nfcCard->ciudad }}</td>
                <td>{{ $nfcCard->celular }}</td>
                <td>{{ $nfcCard->correo }}</td>
                
                <td>
                    <a href="{{ route('nfc-cards.show', $nfcCard) }}" class="btn btn-info"><i class="fa-solid fa-eye"></i></a>
                    <a href="{{ route('nfc-cards.edit', $nfcCard) }}" class="btn btn-warning"><i class="fa-solid fa-user-pen"></i></a>
                    <form action="{{ route('nfc-cards.destroy', $nfcCard) }}" method="POST" style="display: inline;">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger" onclick="return confirm('{{ trans('messages.index.delete') }}')"><i class="fa-solid fa-trash"></i></button>
                    </form>
                </td>
                <td> <!-- Columna para el enlace HTML -->
                    <a href="{{ asset('storage/users/' . $nfcCard->getHtmlFileName($nfcCard->id)) }}" class="btn btn-secondary" target="_blank">{{ trans('messages.index.view') }}</a>
                </td>
                <td> <!-- Columna para el enlace HTML -->
                    <a href="{{ asset('..//storage/app/public/printcards/' . $nfcCard->getHtmlFileName($nfcCard->id)) }}" class="btn btn-secondary" target="_blank">{{ trans('messages.index.print') }}</a>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>

@endsection
