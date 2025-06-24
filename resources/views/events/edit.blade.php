<!-- Modal -->
<div class="modal fade" id="editEventModal{{ $event->id }}" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Encabezado del modal -->
            <div class="modal-header">
                <h5 class="modal-title" id="editEventModalLabel">{{ trans('messages.edit-event.title') }}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <!-- Cuerpo del modal con el formulario -->
            <div class="modal-body">
                   <form action="{{ route('events.update', $event->id) }}" method="POST">
                    @csrf
                    @method('PUT')

                    <div class="mb-3">
                        <label for="nombre" class="form-label">{{ trans('messages.edit-event.name') }}</label>
                        <input type="text" class="input-custom" id="name" name="name" value="{{ $event->name }}" required>
                    </div>

                    <div class="mb-3">
                        <label for="fecha" class="form-label">{{ trans('messages.edit-event.date') }}</label>
                        <input type="date" class="input-custom" id="fecha" name="fecha" value="{{ $event->fecha }}"
                            required>
                    </div>

                    <div class="modal-footer d-flex">
                       
                        <button type="submit"
                            class="custom-action-btn">{{ trans('messages.edit-event.update') }}</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>