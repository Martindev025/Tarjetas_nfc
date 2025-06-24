<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tarjetas Editables</title>
<link rel="stylesheet" href="../css/style_card.css">
</head>
<body>
@if($nfcCard)
    <div class="tarjeta">
        <div class="contenido" contenteditable="false">
            <span>{{ $nfcCard->cargo }} 
            <br>{{ $nfcCard->ciudad }}</span>

        </div>
        <img class="fondo-texto" src="{{ asset('img/') }}/{{ $event->template }}.png" alt="">
    </div>

    <div class="tarjeta">
        <div class="qr">
            <img class="recuadro" src="../qrcodes/{{ $nfcCard->id }}.png" alt="">
        </div>
        <img class="fondo-qr" src="{{ asset('img/') }}/{{ $event->template }}.png" alt="">
    </div>
@else
    <p>No se ha proporcionado ninguna tarjeta NFC.</p>
@endif
</body>
</html>
