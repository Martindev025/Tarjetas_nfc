<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{ $nfcCard->nombre }} | Mi Tarjeta Virtual</title>
    <link rel="shortcut icon" href="img/logo.ico" type="image/x-icon">
    <link rel="stylesheet" href="../../css/estilos.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-DHg8p4v9Qz2+rJLX0CKV4PDip/ELOOvJnYFiTRGvV2G9+8Z1Y4jgmh1XIH0BvIx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-4+HfNB6zHYjzq2KAkG38Do4JYjC0pE29z34k2c96fql1OQq3p18FczELbAUPkRNd" crossorigin="anonymous">
    </script>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Fontawesome icon -->
    <script src="https://kit.fontawesome.com/ec1c9da28d.js" crossorigin="anonymous"></script>
</head>
<style>
    /* Contenedor principal de la tarjeta */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    /* Ocupar toda la pantalla */
    html,
    body {
        height: 100%;
        width: 100%;
        font-family: 'Segoe UI', sans-serif;
        background-color: #f5f5f5;
    }

    /* Contenedor principal pantalla completa */
    .card-container {
        height: 40vh;
        width: 100vw;
        display: flex;
        flex-direction: row;
        overflow: hidden;
    }

    /* Parte izquierda gris (30%) */
    .card-left {
        background-color: #ccc;
        width: 30%;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        gap: 40px;
    }

    /* Parte derecha (70%) */
    .card-right {
        width: 70%;
        display: flex;
        flex-direction: column;
        background-color: white;
    }

    /* Header superior con fondo morado */
    .card-header {
        background-image: url('{{ asset('img/fondo_banner.jpg') }}');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        color: white;
        padding: 40px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        height: 55vh;
    }

    .card-header .user-info {
        display: flex;
        align-items: center;
    }

    .profile-pic {
        width: 300px;
        height: 300px;
        border-radius: 50%;
        object-fit: cover;
        margin-right: 30px;
        border: 5px solid white;
        background-color: white;
    }

    .card-header h1 {
        margin: 0;
        font-size: 42px;
        text-transform: uppercase;
        font-weight: bold;
    }

    .card-header p {
        margin-top: 5px;
        font-style: italic;
        font-size: 24px;
        color: #e0dfff;
    }

    .logo {
        height: 80px;
    }

    /* Cuerpo con info personal */
    .card-body {
        padding: 60px;
        font-size: 24px;
        color: #333;
    }

    .info-row {
        display: flex;
        align-items: center;
        margin-bottom: 30px;
    }

    .info-row i {
        margin-right: 15px;
        color: #333;
        font-size: 26px;
        width: 30px;
        text-align: center;
    }

    /* Iconos PDF, WhatsApp, correo */
    .icon-bar {
        display: flex;
        gap: 30px;
    }

    .icon-bar a {
        color: #333;
        font-size: 40px;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .product-card img {
        height: 250px;
        object-fit: cover;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }
</style>

<body>




    <!-- ✅ HEADER A TODO EL ANCHO -->
    <div class="card-header">
        <div class="user-info">
            <img class="profile-pic" src="{{ $nfcCard->foto_url }}" alt="Foto de {{ $nfcCard->nombre }}">
            <div>
                <h1>{{ $nfcCard->nombre }}</h1>
                <p>{{ $nfcCard->cargo }}</p>
            </div>
        </div>
        <img class="logo" src="{{ asset('img/logo-tecser.png') }}" alt="Logo">
    </div>

    <!-- 🔽 CONTENIDO DIVIDIDO EN DOS COLUMNAS -->
    <div class="card-container">
        <div class="card-left">
            <div class="icon-bar">
               <a href="#" id="download-btn" class="btn"><i class="fa-solid fa-file-pdf"></i><span data-translate="export"></span></a>
                <a href="https://wa.me/57{{ $nfcCard->celular }}"><i class="fa-solid fa-share"></i></a>
                <a href="mailto:{{ $nfcCard->correo }}"><i class="fa-solid fa-envelope"></i></a>
              
            </div>
        </div>

        <div class="card-right">
            <div class="card-body">
                <h2>Información: </h2>
                <div class="info-row"><i class="fa-solid fa-phone"></i> {{ $nfcCard->celular }}</div>
                <div class="info-row"><i class="fa-solid fa-envelope"></i> {{ $nfcCard->correo }}</div>
                <div class="info-row"><i class="fa-solid fa-location-dot"></i> {{ $nfcCard->ciudad }}</div>
            </div>
        </div>
    </div>
    <div class="container-fluid bg-light py-5 " style="background-color: #7a7c7e;">
        <h2 class="text-center mb-4">Productos de Interés</h2>

        @php
            // Solo las imágenes de productos que tienen imágenes
            $productImages = collect();

            foreach ($nfcCard->products as $product) {
                if ($product->images->isNotEmpty()) {
                    foreach ($product->images as $image) {
                        $productImages->push([
                            'image_path' => $image->image_path,
                            'product_name' => $product->name,
                        ]);
                    }
                }
            }
        @endphp

        @if ($productImages->isNotEmpty())
            <div class="container px-0 position-relative">
                <div id="productCarousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        @foreach ($productImages->chunk(3) as $chunk)
                            <div class="carousel-item {{ $loop->first ? 'active' : '' }}">
                                <div class="row justify-content-center g-4 px-4">
                                    @foreach ($chunk as $img)
                                        <div class="col-md-4">
                                            <div class="card h-100 shadow-sm">
                                                <img src="{{ asset('storage/' . $img['image_path']) }}"
                                                    class="card-img-top rounded" alt="{{ $img['product_name'] }}"
                                                    style="object-fit: cover; height: 200px;">
                                                <div class="card-body text-center">
                                                    <h6 class="card-title mb-0">{{ $img['product_name'] }}</h6>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        @endforeach
                    </div>

                    <!-- Controles -->
                    <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel"
                        data-bs-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#productCarousel"
                        data-bs-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </button>
                </div>
            </div>
        @endif
    </div>
    <div id="open-modal" class="modal-window">
        <div>
            <a href="#" title="Close" class="modal-close" data-translate="close"></a>

            <h1 data-translate="txtqr"></h1>

            <div><img class="recuadro" src="../../../storage/app/public/qrcodes/{{ $nfcCard->id }}.png"
                    alt=""></div>
            <br>
        </div>
    </div><!-- Fin Modal Qr-->
    <div id="open-modal-contacto" class="modal-window">
        <div>
            <a href="#" title="Close" class="modal-close" data-translate="close"></a>
            <h1 data-translate="modalcon"></h1>
            <h1 data-translate="phonecon"></h1>
            <p>{{ $nfcCard->celular }}</p>
            <h1 data-translate="mailcon"></h1>
            <p>{{ $nfcCard->correo }}</p>
            <br>
        </div>
    </div>


    <footer>
  <div>
    <img src="../../img/espana.png" alt="Spanish" class="lenguage-spa" onclick="changeLanguage('es')">
    <img src="../../img/ingles.png" alt="English" class="lenguage-eng" onclick="changeLanguage('en')">

    <h2 class="titulo-final">&copy; Copyright 2025 <a href="https://tecsersas.com" style="position: relative; z-index: 999;">TECSER S.A.S</a>. All Rights Reserved</h2>
  </div>
</footer>





</body>
<script src="../../js/contact.js"></script>
<script src="../translate/translate.js"></script>
<script src="gallery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.5.0-beta4/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="../../js/generate_pdf.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</html>
