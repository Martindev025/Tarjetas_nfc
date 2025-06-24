<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{ $nfcCard->nombre }} | Mi Tarjeta Virtual</title>
    <link rel="shortcut icon" href="img/logo.ico" type="image/x-icon">
    <link rel="stylesheet" href="../../css/estilos.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-DHg8p4v9Qz2+rJLX0CKV4PDip/ELOOvJnYFiTRGvV2G9+8Z1Y4jgmh1XIH0BvIx" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-4+HfNB6zHYjzq2KAkG38Do4JYjC0pE29z34k2c96fql1OQq3p18FczELbAUPkRNd" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800&display=swap" rel="stylesheet">
    <!-- Fontawesome icon -->
    <script src="https://kit.fontawesome.com/ec1c9da28d.js" crossorigin="anonymous"></script>
</head>
<body>
    
<div class="circle-container">
    <img src="../featureds/{{str_replace(' ', '_', $nfcCard->nombre) }}.png" alt=""> <!-- Se debe agregar la ruta y verificar si funciona -->
</div>
    
  <div id="fondo-gris"></div>
  <div id="fondo-azul"></div>

<!--Inicio-->    
<header class="img-event2">  
  <div class="wave" style="height: 150px; overflow: hidden;"><svg viewBox="0 0 500 150" preserveAspectRatio="none"
    style="height: 100%; width: 100%;">
        <path d="M0.00,49.98 C150.00,150.00 349.20,-50.00 500.00,49.98 L500.00,150.00 L0.00,150.00 Z"
            style="stroke: none; fill: #e6e5ed;"></path>
  </svg></div>
</header>

<main>
  <section class="color-back">
  <section class="contenedor sobre-nosotros">
      <h2 class="titulo" >{{ $nfcCard->nombre }}</h2>  
    <div class="line"></div>
      <p class="segundo-titulo">{{ $nfcCard->cargo }} {{ $nfcCard->ciudad }}</p>
    </div>
  </section><!--Inicio Fin-->
</section>

<!-- Redes -->
<section>
  <div class="social-box-p2">
      <ul class="social-box">
          <li><a href="tel:+57{{ $nfcCard->celular }}"><i class="fa-solid fa-phone"></i><span data-translate="call"></span></a></li>
          
          <li><a href="https://api.whatsapp.com/send?phone=+57{{ $nfcCard->celular }}&text=Hola,%20estuve%20revisando%20tu%20tarjeta%20virtual..."><i class="fa-brands fa-whatsapp"></i><span data-translate="write"></span></a></li>

          <li><a href="https://api.whatsapp.com/send?text=https://tecsersas.com/cards/public/storage/users/{{str_replace(' ', '_', $nfcCard->nombre) }}.html"><i class="fa-solid fa-share"></i><span data-translate="share"></span></a></li>

          <li><a href="#" id="download-btn" class="btn"><i class="fa-solid fa-file-pdf"></i><span data-translate="export"></span></a></li>

          <!-- Agrupar los últimos tres íconos -->
          <div class="social-box-row">

            <!-- Modal Contacto -->
            <li><a href="../contacts/{{ $nfcCard->nombre }}.vcf" id="contactButton" class="btn"><i class="fa-solid fa-book"></i><span data-translate="contact"></span></a></li>

            <li><a href="mailto:{{ $nfcCard->correo }}"><i class="fa-solid fa-envelope"></i><span data-translate="mail"></span></a></li>

            <!-- Modal Qr -->
            <li><div class="container"><div class="interior"><a class="btn" href="#open-modal"><i class="fa-solid fa-qrcode"></i><span data-translate="qr"></span></a></div></div></li></div>
      </ul>
  </div>
</section><!-- Redes Fin -->



<!-- Banner Page -->
<section>
  @if(isset($nfcCard->pagina))
    <div class="banner-container">
      <div class="imagen">
        <img src="../../img/Tecnologia.gif" alt="Imagen">
      </div>
      <div class="contenido">
        <img src="../../img/logo-banner.png" style="width: 0%;">
        <br>
        <h2 data-translate="page"></h2>
        <button class="button"><a href="https://{{ $nfcCard->pagina }}" target="_blank"><i class="fa-solid fa-earth-americas"></i>  {{ $nfcCard->pagina }}</a></button>
      </div>
    </div>
  @endif
</section><!-- Banner Page Fin -->



<!-- Gallery
<div class="slider-container">
  <div class="slider">
    <div class="slide">
      <img src="../../img/banners/aires.png" alt="Imagen 1">
    </div>
    <div class="slide">
      <img src="../../img/banners/andina.png" alt="Imagen 2">
    </div>
    <div class="slide">
      <img src="../../img/banners/bkf.png" alt="Imagen 3">
    </div>
    <div class="slide">
      <img src="../../img/banners/home.png" alt="Imagen 1">
    </div>
    <div class="slide">
      <img src="../../img/banners/rsc.png" alt="Imagen 2">
    </div>
    <div class="slide">
      <img src="../../img/banners/tecser.png" alt="Imagen 3">
    </div>
  </div>
  <div class="prev">&lt;</div>
  <div class="next">&gt;</div>
</div>- Gallery Fin -->


<main class="color-main">
  <section class="contenedor-cont sobre-nosotros-contac">
      <h2 class="titulo-cont" data-translate="info"></h2>  
    <div class="line"></div>
      <p class="segundo-titulo-cont" data-translate="data"></p>
    </div>
    <div>
      @if(isset($nfcCard->celular))
        <p class="segundo-titulo-cont">{{ $nfcCard->celular }}</p>
      @endif
      @if(isset($nfcCard->telefono_opc))
        <p class="segundo-titulo-cont">{{ $nfcCard->telefono_opc }}</p>
      @endif
      @if(isset($nfcCard->telefono_opci))
        <p class="segundo-titulo-cont">{{ $nfcCard->telefono_opci }}</p>
      @endif
      @if(isset($nfcCard->correo))
        <p class="segundo-titulo-cont">{{ $nfcCard->correo }}</p>
      @endif
      @if(isset($nfcCard->correo_opc))
        <p class="segundo-titulo-cont">{{ $nfcCard->correo_opc }}</p>
      @endif
    </div>
  </section><!--Inicio Fin-->

<footer>
  <div>
    <img src="../../img/espana.png" alt="Spanish" class="lenguage-spa" onclick="changeLanguage('es')">
    <img src="../../img/ingles.png" alt="English" class="lenguage-eng" onclick="changeLanguage('en')">

    <h2 class="titulo-final">&copy; Copyright 2024 <a href="https://tecsersas.com" style="position: relative; z-index: 999;">TECSER S.A.S</a>. All Rights Reserved</h2>
  </div>
</footer>

<!-- Modal Qr -->
  <div id="open-modal" class="modal-window">
  <div>
    <a href="#" title="Close" class="modal-close" data-translate="close"></a>

        <h1 data-translate="txtqr"></h1>

    <div><img class="recuadro" src="../../../storage/app/public/qrcodes/{{ $nfcCard->id }}.png" alt=""></div>      
        <br>
   </div>
  </div><!-- Fin Modal Qr-->

<!-- Modal Contacto -->
<div id="open-modal-contacto" class="modal-window">
        <div>
            <a href="#" title="Close" class="modal-close" data-translate="close"></a>
            <h1 data-translate="modalcon"></h1>
            <h1 data-translate="phonecon"></h1>
            <p>{{ $nfcCard->celular}}</p>
            <h1 data-translate="mailcon"></h1>
            <p>{{ $nfcCard->correo }}</p>
            <br>
        </div>
    </div><!-- Fin Modal Contacto-->
</body>
<script src="../../js/contact.js"></script>
<script src="../translate/translate.js"></script>
<script src="gallery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.5.0-beta4/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="../../js/generate_pdf.js"></script>
</html>