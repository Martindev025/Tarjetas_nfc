<div class="modal fade" id="eventModal" tabindex="-1" aria-labelledby="eventModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="eventModalLabel">{{ trans('messages.create-event.title') }}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="{{ route('events.store') }}" method="POST">
                    @csrf
                    <div class="mb-3">
                        <label for="nombre" class="form-label">{{ trans('messages.create-event.name') }}</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="event_date" class="form-label">{{ trans('messages.create-event.date') }}</label>
                        <input type="date" class="form-control" id="fecha" name="fecha" required>
                    </div>

                    <!-- Selección de Empresas -->
                    <div class="mb-3">
                        <label for="companies" class="form-label">{{ trans('messages.create-event.company') }}</label>
                        <div class="custom-select-wrapper">
                            <div class="custom-select" id="companies-select">
                                {{ trans('messages.create-event.company-inter') }}
                            </div>
                            <div class="dropdown-menu" id="companies-dropdown-menu">
                                @foreach ($companies as $company)
                                    <div class="checkbox-wrapper">
                                        <input type="checkbox" id="modal_company_{{ $company->id }}" name="companies[]"
                                            value="{{ $company->id }}">
                                        <label for="modal_company_{{ $company->id }}">{{ $company->name }}</label>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                  
                    <!-- Selección Plantilla -->
                    <div class="mb-3">
                        <label for="template" class="form-label">{{ trans('messages.create-event.template') }}</label>
                        <select class="form-select" id="template" name="template">
                            <option value="tarjeta1">{{ trans('messages.create-event.template-first') }}</option>
                            <option value="tarjeta2">{{ trans('messages.create-event.template-second') }}</option>
                            <option value="tarjeta3"> Plantilla 3</option>
                            <option value="tarjeta4"> Plantilla 4</option>
                            <option value="tarjeta5"> Plantilla 5</option>
                            <option value="tarjeta6"> Plantilla 6</option>


                            <!-- Agrega las opciones restantes aquí -->
                        </select>
                    </div>
                    <div id="tarjeta-preview"
                        style="text-align: center; background-color: #c2c7db; padding: 10px; border-radius: 10px;">
                        <img id="tarjeta-img" src="" alt="Tarjeta">
                    </div>

            </div>
            <div class="modal-footer">
                <div class="container-fluid px-0">
                    <div class="row gx-2">
                        <div class="col text-start">
                            <button type="button" class="custom-action-btn" data-bs-dismiss="modal">
                               @lang('messages.modals.product.cancel_button')
                            </button>
                        </div>
                        <div class="col text-end">
                            <button type="submit" class="custom-action-btn">
                                {{ trans('messages.create-event.save') }}
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>