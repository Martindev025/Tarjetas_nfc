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
            {{ $isEdit ? __('messages.modalsCompany.edit_title') : __('messages.modalsCompany.create_title') }}
          </h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="@lang('messages.modals.close_button')"></button>
        </div>

        <div class="modal-body">
          <div class="mb-3">
            <label for="companyName" class="form-label">@lang('messages.modalsCompany.company_name_label')</label>
            <input type="text" class="input-custom" id="companyName" name="name"
                 value="{{ $isEdit && $company ? $company->name : '' }}" required>
          </div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btnf btn__fil custom-action-btn" data-bs-dismiss="modal">
            @lang('messages.modalsCompany.cancel_button')
          </button>
          <button type="submit" class="btnf btn__fil custom-action-btn">
            {{ $isEdit ? __('messages.modalsCompany.update_button') : __('messages.modalsCompany.save_button') }}
          </button>
        </div>
      </form>
    </div>
  </div>
</div>