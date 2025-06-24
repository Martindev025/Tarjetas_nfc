@extends('layout')



@section('content')
    @include('events.modal-create')




    <defs>
        <filter id="goo">
            <feGaussianBlur in="SourceGraphic" stdDeviation="10" result="blur"></feGaussianBlur>
            <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7" result="goo">
            </feColorMatrix>
            <feBlend in="SourceGraphic" in2="goo"></feBlend>
        </filter>
    </defs>
    <!-- Preloader HTML -->
    <div class="blobs">
        <div class="blob-center"></div>
        <div class="blob"></div>
        <div class="blob"></div>
        <div class="blob"></div>
        <div class="blob"></div>
        <div class="blob"></div>
    </div>



    <div class="container custom-event">

        <div class="row justify-content-center col-md-10">
            <section class="d-flex align-items-center justify-content-between mb-3">
                <div>
                    <h2 style="margin:0; font-weight:700; color:#222; letter-spacing:1px;">EVENTOS</h2>
                    <div class="card-event">{{ trans('messages.index-event.title') }}</div>
                </div>
                <div class="d-flex gap-2">
                    <button type="button" class="btnf btn__fil custom-action-btn" data-bs-toggle="modal"
                        data-bs-target="#eventModal">
                        <i class="fa fa-plus-circle" style="margin-right:6px;"></i>
                        {{ trans('messages.index-event.subtitle') }}
                    </button>

                    <a href="{{ route('products.index') }}" class="btnf btn__fil custom-action-btn">
                        <i class="fa-solid fa-building" style="margin-right: 6px;"></i>
                        empresas y productos
                    </a>



                </div>



                <div class="modal fade" id="filterModal" tabindex="-1" aria-labelledby="filterModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" style="max-width: 500px;">
                        <div class="modal-content" style="border-radius: 16px;">
                            <div class="modal-header border-0">
                                <h5 class="modal-title fw-bold" id="filterModalLabel">
                                    {{ trans('messages.index-event.toggle-filter') }}
                                </h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Cerrar"></button>
                            </div>
                            <div class="modal-body">
                                <form id="filter-form" action="{{ route('events.index') }}" method="GET"
                                    class="d-flex flex-column align-items-center gap-3">
                                    <div style="width: 80%;">
                                        <label for="name"
                                            class="form-label">{{ trans('messages.index-event.name') }}</label>
                                        <input type="text" class="form-control" id="name" name="name"
                                            value="{{ request()->input('name') }}"
                                            placeholder="{{ trans('messages.index-event.name') }}">
                                    </div>
                                    <div style="width: 80%;">
                                        <label for="date"
                                            class="form-label">{{ trans('messages.index-event.date') }}</label>
                                        <input type="date" class="form-control" id="date" name="date"
                                            value="{{ request()->input('date') }}">
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer justify-content-between border-0 px-4">
                                <a href="{{ route('events.index') }}" class="btn btn-primary w-100 me-2"
                                    style="max-width: 45%;">
                                    {{ trans('messages.index-event.clear-filter') }}
                                </a>
                                <button type="submit" form="filter-form" class="btn btn-primary w-100"
                                    style="max-width: 45%;">
                                    {{ trans('messages.index-event.apply-filter') }}
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
        </div>




        </section>
    </div>



   <div class="row justify-content-center mb-5">
    <div class="col-md-9 custom-box">
        <div class="card">
            <div class="card-body">
                <table class="table" id="eventsTable">
                    <thead>
                        <tr>
                            <th>{{ trans('messages.index-event.name') }}</th>
                            <th>{{ trans('messages.index-event.date') }}</th>
                            <th class="text-center">{{ trans('messages.index-event.actions') }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($events as $event)
                            <tr>
                                <td>{{ $event->name }}</td>
                                <td>{{ $event->fecha }}</td>
                                <td class="text-center">
                                    <div class="d-flex justify-content-center gap-3">
                                        <!-- View -->
                                        <a href="{{ route('events.nfc-cards', $event->id) }}" class="text-decoration-none">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                fill="currentColor" color="black" class="bi bi-eye-fill"
                                                viewBox="0 0 16 16">
                                                <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0" />
                                                <path
                                                    d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7" />
                                            </svg>
                                        </a>
                                        <!-- Edit -->
                                        <a data-bs-toggle="modal" data-bs-target="#editEventModal{{ $event->id }}" class="text-decoration-none">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                <path
                                                    d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                                <path fill-rule="evenodd"
                                                    d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
                                            </svg>
                                        </a>
                                        <!-- Delete -->
                                        <form id="delete-form-{{ $event->id }}"
                                            action="{{ route('events.destroy', $event) }}" method="POST"
                                            style="display: inline-block;">
                                            @csrf
                                            @method('DELETE')
                                            <button type="button" onclick="confirmDelete({{ $event->id }})"
                                                style="outline: none; border: none; background: transparent; padding: 0;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                    fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1
                                                    .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z" />
                                                    <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1
                                                    1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4
                                                    4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z" />
                                                </svg>
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            @include('events.edit', ['event' => $event])
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
    <!-- Botón para abrir el modal -->

    <!-- Modal -->
    <div class="modal fade" id="nfcCardModal" tabindex="-1" aria-labelledby="nfcCardModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="nfcCardModalLabel">{{ trans('messages.create.title') }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>

                <div class="modal-body">
                    <!-- Formulario aquí -->
                    <form action="{{ route('nfc-cards.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf

                        {{-- Aquí va todo tu formulario tal como lo tienes (inputs, selects, checkboxes, scripts, etc.) --}}

                        {{-- ... Tu formulario ... --}}

                </div>

                <div class="modal-footer">
                    @if ($events->count())
                        <input type="hidden" name="event_id" value="{{ $events->first()->id }}">
                    @else
                        <p class="text-danger">No hay eventos disponibles.</p>
                    @endif

                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button id="guardar" type="submit" class="btn btn-primary"
                        disabled>{{ trans('messages.create.save') }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <script>
        let table = new DataTable('#eventsTable');

        document.getElementById('toggleFilterForm').addEventListener('click', function() {
            var filterForm = document.getElementById('filterForm');
            if (filterForm.style.display === 'none') {
                filterForm.style.display = 'block';
            } else {
                filterForm.style.display = 'none';
            }
        });


        function confirmDelete(eventId) {
            Swal.fire({
                title: '¿Estás seguro?',
                text: 'Esta acción no se puede deshacer.',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#d33',
                cancelButtonColor: '#6c757d',
                confirmButtonText: 'Sí, eliminar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById(`delete-form-${eventId}`).submit();
                }
            });
        }
    </script>
@endsection
