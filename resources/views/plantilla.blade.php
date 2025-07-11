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
        width: 200px;
        height: 200px;
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

    .icon-bar img {
        width: 48px;
        height: 48px;
        transition: transform 0.2s;
    }

    .icon-bar img:hover {
        transform: scale(1.1);
        cursor: pointer;
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
            <img class="profile-pic" src="{{ asset('storage/profile/' . $nfcCard->foto) }}" alt="Foto">
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
                <a href="{{ $nfcCard->pdf_url }}"><img src="{{ asset('img/pdf.png') }}" alt="PDF"></a>
                <a href="https://wa.me/57{{ $nfcCard->celular }}"><img src="{{ asset('img/whatsapp.png') }}"
                        alt="WhatsApp"></a>
                <a href="mailto:{{ $nfcCard->correo }}"><img src="{{ asset('img/email.png') }}" alt="Email"></a>
            </div>
        </div>

        <div class="card-right">
            <div class="card-body">
                <div class="info-row"><i class="fa-solid fa-phone"></i> {{ $nfcCard->celular }}</div>
                <div class="info-row"><i class="fa-solid fa-envelope"></i> {{ $nfcCard->correo }}</div>
                <div class="info-row"><i class="fa-solid fa-location-dot"></i> {{ $nfcCard->direccion }}</div>
            </div>
        </div>
    </div>
    <div class="container-fluid bg-light py-5">
  <h2 class="text-center mb-4">Productos de Interés</h2>

  @if($nfcCard->products->isNotEmpty())
    <!-- Contenedor centrado -->
    <div class="container px-0">
      <div id="productCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">

          @foreach($nfcCard->products->chunk(3) as $chunk)
            <div class="carousel-item {{ $loop->first ? 'active' : '' }}">
              <div class="row g-2">
                @foreach($chunk as $product)
                  <div class="col-md-4">
                    <img src="{{ asset('storage/products/' . $product->imagen) }}" class="d-block w-100 product-img" alt="{{ $product->nombre }}">
                  </div>
                @endforeach
              </div>
            </div>
          @endforeach

        </div>

        <!-- Controles -->
        <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel" data-bs-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#productCarousel" data-bs-slide="next">
          <span class="carousel-control-next-icon"></span>
        </button>
      </div>
    </div>
  @else
    <p class="text-center text-muted">Este contacto aún no tiene productos de interés asignados.</p>
  @endif
</div>






</body>
<script src="../../js/contact.js"></script>
<script src="../translate/translate.js"></script>
<script src="gallery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.5.0-beta4/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="../../js/generate_pdf.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</html>
