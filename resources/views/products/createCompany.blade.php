<div class="modal fade" id="{{ $isEdit && $company ? 'editCompanyModal' . $company->id : 'createCompanyModal' }}" tabindex="-1" aria-labelledby="companyModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form action="{{ $isEdit ? route('companies.update', $company) : route('companies.store') }}" method="POST">
        @csrf
        @if ($isEdit)
            @method('PUT')
        @endif

        <div class="modal-header">
          <h5 class="modal-title" id="companyModalLabel">
            {{ $isEdit ? 'Editar Empresa' : 'Crear Empresa' }}
          </h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>

        <div class="modal-body">
          <div class="mb-3">
            <label for="companyName" class="form-label">Nombre de la Empresa</label>
            <input type="text" class="input-custom" id="companyName" name="name"
                 value="{{ $isEdit && $company ? $company->name : '' }}" required>
          </div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btnf btn__fil custom-action-btn" data-bs-dismiss="modal">Cancelar</button>
          <button type="submit" class="btnf btn__fil custom-action-btn">
            {{ $isEdit ? 'Actualizar' : 'Guardar' }}
          </button>
        </div>
      </form>
    </div>
  </div>
</div>
