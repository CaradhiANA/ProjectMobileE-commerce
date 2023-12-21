<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Keripik Tempe Sanan</title>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.bunny.net/css?family=Nunito" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <link rel="stylesheet" href="app.css">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">

</head>

<body>
    <div class="container-fluid">
        <div class="row flex-nowrap">

            <!--Side Bar-->
            <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
                <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100 sidebar-header">

                    <br>
                    <a href="#" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white bg-dark text-decoration-none sticky-sm-top align-middle px-5 py-3">
                        <span class="fs-5 d-none d-sm-inline fw-bold text-uppercase">DATABASE LARAVEL</span>
                    </a>
                    <br>
                    <hr>
                    <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start list-unstyled components" id="menu">
                        {{-- <li class="nav-item" style="width: 10rem;">
                            <a href="/login" class="nav-link  align-middle px-4">
                                <i class="fs-4 bi-people"></i> <span class="ms-1 d-none d-sm-inline"><i class="bi bi-box-arrow-in-right"></i>
                                LOGIN</span>
                            </a>
                        </li> --}}
                        <li class="nav-item" style="width: 10rem;">
                            <a href="/home" class="nav-link align-middle px-4">
                                <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">PENJUALAN</span>
                            </a>
                        </li>
                        <br>

                        <li class="nav-item" style="width: 10rem;">
                            <a href="/pilihBarang" class="nav-link align-middle px-4">
                                <i class="fs-4 bi-people"></i> <span class="ms-1 d-none d-sm-inline">MASUK PRODUK</span>
                            </a>
                        </li>
                        <br>
                        <li class="nav-item" style="width: 10rem;">
                            <a href="/posts" class="nav-link align-middle px-4">
                                <i class="fs-4 bi-table"></i> <span class="ms-1 d-none d-sm-inline">PRODUK</span>
                            </a>
                        </li>
                        <br>
                        <li class="nav-item" style="width: 10rem;">
                            <a href="/Halo" class="nav-link align-middle px-4">
                                <i class="fs-4 bi-speedometer2"></i> <span class="ms-1 d-none d-sm-inline">FEEDBACK AND RATING</span>
                            </a>
                        </li>
                        <br>
                        <li class="nav-item" style="width: 10rem;">
                            <a href="/karyawan" class="nav-link  align-middle px-4">
                                <i class="fs-4 bi-people"></i> <span class="ms-1 d-none d-sm-inline">KARYAWAN</span>
                            </a>
                        </li>
                        <br>
                        <li class="nav-item" style="width: 10rem;">
                            <a href="/reviews" class="nav-link  align-middle px-4">
                                <i class="fs-4 bi-people"></i> <span class="ms-1 d-none d-sm-inline">REVIEW</span>
                            </a>
                        </li>

                    </ul>
                    <hr>


                </div>
            </div>
            <!--Side Bar End-->

            <!--Content-->
            <div class="col py-3">

                <!--Navbar top-->
                <nav class="navbar navbar-expand-md navbar-light shadow-sm sticky-sm-top" style="background-color: #CFD8DC">
                    <div class="container">
                        <a class="navbar-brand fst-italic" href="{{ url('/home') }}">
                            Keripik Tempe Sanan
                        </a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <!-- Left Side Of Navbar -->
                            <ul class="navbar-nav me-auto">

                            </ul>

                            <!-- Right Side Of Navbar -->
                            <ul class="navbar-nav ms-auto">
                                <!-- Authentication Links -->
                                @guest
                                @if (Route::has('login'))
                                    <li class="nav-item">
                                        <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                                    </li>
                                @endif

                                @if (Route::has('register'))
                                    <li class="nav-item">
                                        <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                                    </li>
                                @endif
                                @else
                                {{-- <li class="nav-item dropdown">
                                    <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                       {{ Auth::users()->name }}
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                       <a class="dropdown-item" href="{{ route('logout') }}"
                                          onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                          {{ __('Logout') }}
                                       </a>
                                       <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                          @csrf
                                       </form>
                                    </div>
                                 </li> --}}
                                @endguest
                            </ul>
                        </div>
                    </div>
                </nav>
                <!--Navbar top End-->
                <br>

                <!--Main Content-->
                <div class="container">
                    @yield('content')
                </div>
                <!--Main Content End-->
            </div>
            <!--Content End-->
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <script>
        const currentHref = location.href
         $('.nav-link').each(function (i, e) {
            if(e.href === currentHref) {
                e.classList.add('active')
            }
        })
    </script>
</body>
<html>
