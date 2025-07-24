<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ trans('messages.header.title') }}</title>
    <link rel="icon" type="image/png" href="{{ asset('img/icono.png') }}">
    <!-- Enlaces a las hojas de estilo de Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">


    <!-- Otros estilos personalizados -->
    <link href="{{ asset('css/style_blade.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

    <link rel="stylesheet" href="https://cdn.datatables.net/2.3.2/css/dataTables.dataTables.min.css" />
    <script src="https:////cdn.datatables.net/2.3.2/js/dataTables.min.js"></script>

</head>
 <style>
    * {
      box-sizing: border-box;
    }

    html, body {
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', sans-serif;
      height: 100%;
      width: 100%;
    }

    /** Sección superior morada **/
    section.header {
      background-color: #4a49a5;
      color: white;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 60px 80px;
      flex-wrap: wrap;
      width: 100%;
    }

    .header-left {
      display: flex;
      align-items: center;
      flex: 1;
    }

    .profile-img {
      width: 200px;
      height: 200px;
      border-radius: 50%;
      object-fit: cover;
      border: 8px solid white;
      margin-right: 40px;
    }

    .name-title h1 {
      margin: 0;
      font-size: 48px;
      font-weight: bold;
      text-transform: uppercase;
    }

    .name-title h2 {
      margin: 10px 0 0;
      font-size: 28px;
      font-style: italic;
      font-weight: normal;
    }

    .logo {
      height: 100px;
    }

    /** Sección inferior **/
    section.body {
      display: flex;
      width: 100%;
      min-height: 60vh;
    }

    .left-icons {
      background-color: #d8d8d8;
      flex: 0 0 200px;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      gap: 40px;
      padding: 40px 0;
    }

    .left-icons a img {
      width: 48px;
      height: 48px;
      transition: transform 0.2s;
    }

    .left-icons a:hover img {
      transform: scale(1.2);
    }

    .right-info {
      flex: 1;
      background-color: #ffffff;
      padding: 60px 80px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      gap: 40px;
    }

    .info-line {
      font-size: 28px;
      color: #333;
      display: flex;
      align-items: center;
    }

    .info-line i {
      margin-right: 20px;
      color: #4a49a5;
      font-size: 30px;
    }

    @media (max-width: 768px) {
      section.header {
        flex-direction: column;
        align-items: flex-start;
        padding: 40px 30px;
      }

      .profile-img {
        width: 150px;
        height: 150px;
        margin-bottom: 20px;
      }

      .name-title h1 {
        font-size: 32px;
      }

      .name-title h2 {
        font-size: 20px;
      }

      section.body {
        flex-direction: column;
      }

      .left-icons {
        flex-direction: row;
        justify-content: center;
        padding: 20px;
        gap: 30px;
      }

      .right-info {
        padding: 30px 30px;
        gap: 20px;
      }

      .info-line {
        font-size: 22px;
      }

      .info-line i {
        font-size: 24px;
        margin-right: 12px;
      }
    }
  </style>
<body>

    <!-- Barra de navegación -->
    <nav class="navbar navbar-expand-lg custom-navbar position-fixed ">
        <div class="container d-flex align-items-center justify-content-between">

            <!-- Logo Izquierda -->
            <div class="navbar-logo">
                <img src="{{ asset('img/logo.png') }}" alt="Logo">
                <span class="logo-text">

                </span>
            </div>

            <!-- Título Central con enlace a eventos -->
            <div class="navbar-center">
                <a href="{{ route('events.index') }}" class="navbar-title-link">
                    <span class="navbar-title">{{ trans('messages.header.subtitle') }}</span>
                    <span class="navbar-badge">{{ trans('messages.header.event') }}</span>
                </a>
            </div>

            <!-- Iconos y Logout Derecha -->
            <div class="navbar-right d-flex align-items-center gap-2">
                <a href="{{ route('setLocale', ['locale' => 'en']) }}">
                    <img class="language-flag" src="{{ asset('img/bandera.png') }}"
                        alt="{{ trans('messages.header.en') }}">
                </a>
                <a href="{{ route('setLocale', ['locale' => 'es']) }}">
                    <img class="language-flag" src="{{ asset('img/mundo.png') }}"
                        alt="{{ trans('messages.header.es') }}">
                </a>

                <!-- Logout -->
                <div class="nav-item">
                    <button class="Btn"
                        onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                        <div class="sign">
                            <svg viewBox="0 0 512 512">
                                <path
                                    d="M377.9 105.9L500.7 228.7c7.2 7.2 11.3 17.1 11.3 27.3s-4.1 20.1-11.3 27.3L377.9 406.1c-6.4 6.4-15 9.9-24 9.9c-18.7 0-33.9-15.2-33.9-33.9l0-62.1-128 0c-17.7 0-32-14.3-32-32l0-64c0-17.7 14.3-32 32-32l128 0 0-62.1c0-18.7 15.2-33.9 33.9-33.9c9 0 17.6 3.6 24 9.9zM160 96L96 96c-17.7 0-32 14.3-32 32l0 256c0 17.7 14.3 32 32 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-64 0c-53 0-96-43-96-96L0 128C0 75 43 32 96 32l64 0c17.7 0 32 14.3 32 32s-14.3 32-32 32z">
                                </path>
                            </svg>
                        </div>
                        <div class="text-logout">{{ trans('messages.header.close') }}</div>
                    </button>
                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                        @csrf
                    </form>
                </div>
            </div>
        </div>
    </nav>

    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
        @csrf
    </form>


    <!-- Contenido principal -->
    <main>
        <div class="container mt-4">
            @yield('content')
        </div>
    </main>

    <!-- Pie de página -->
    <footer class="footer mt-auto py-3">
        <div class="container text-center">
            <span class="text">© Copyright {{ date('Y') }} TECSER & CLOUD S.A.S . All Rights Reserved</span>
        </div>
    </footer>


    <!-- Enlaces a los scripts de Bootstrap y jQuery (opcional) -->
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/c3145fe7b9.js" crossorigin="anonymous"></script>
    <script src="https://cdn.lordicon.com/lordicon.js"></script>
    <script src="{{ asset('js/app.js') }}"></script>

    @if (session('alert_message'))
<script>
    document.addEventListener('DOMContentLoaded', function () {
        Swal.fire({
            text: "{{ session('alert_message') }}",
            icon: "{{ Str::contains(session('alert_message'), '✅') ? 'success' : 'warning' }}",
            confirmButtonText: 'OK',
            customClass: {
                confirmButton: 'btn btn-primary'
            },
            buttonsStyling: false
        });
    });
    
</script>
@endif

@if(session('error'))
    <script>
        Swal.fire({
            icon: 'error',
            title: '¡Error!',
            text: '{{ session('error') }}',
            confirmButtonColor: '#d33'
        });
    </script>
@endif

@if(session('success'))
    <script>
        Swal.fire({
            icon: 'success',
            title:  "{{ session('success_title') ?? __('messages.nfc_cards.success_title') }}",
            text: '{{ session('success') }}',
            confirmButtonColor: '#3085d6'
        });
    </script>
@endif

@if ($errors->any())
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            Swal.fire({
                icon: 'error',
                title: 'Errores de validación',
                html: `{!! implode('<br>', $errors->all()) !!}`,
                confirmButtonText: 'Cerrar',
                confirmButtonColor: '#d33'
            });
        });
    </script>
@endif


</body>

</html>
