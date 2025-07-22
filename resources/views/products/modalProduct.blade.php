@php
    $isEdit = $isEdit ?? false;
    $product = $product ?? null;
@endphp

<div class="modal fade" id="{{ $isEdit && isset($product) ? 'editProductModal' . $product->id : 'createProductModal' }}"
    tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="{{ $isEdit && isset($product) ? route('products.update', $product) : route('products.store') }}"
                method="POST" enctype="multipart/form-data">
                @csrf
                @if ($isEdit && isset($product))
                    @method('PUT')
                @endif

                <div class="modal-header">
                    <h5 class="modal-title" id="productModalLabel">
                        {{ $isEdit && isset($product) ? __('messages.modals.product.edit_title') : __('messages.modals.product.create_title') }}
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" 
                        aria-label="@lang('.messages.modals.product.close_button')"></button>
                </div>

                <div class="modal-body">
                    <div class="mb-3">
                        <label for="productName" class="form-label">@lang('messages.modals.product.name_label')</label>
                        <input type="text" class="input-custom" id="productName" name="name"
                            value="{{ $isEdit && isset($product) ? $product->name : '' }}" required>
                    </div>

                    <div class="mb-3">
                        <label for="company_id" class="form-label">@lang('messages.modals.product.company_label')</label>
                        <select class="form-select-custom" name="company_id" id="company_id" required>
                            <option value="" disabled {{ !$isEdit ? 'selected' : '' }}>
                                @lang('messages.modals.product.select_company')
                            </option>
                            @foreach ($companies as $company)
                                <option value="{{ $company->id }}"
                                    {{ $isEdit && isset($product) && $product->company_id == $company->id ? 'selected' : '' }}>
                                    {{ $company->name }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    
                    <div class="mb-3">
                        <label for="images" class="form-label">@lang('messages.modals.product.images_label')</label>
                        <input class="form-control2" type="file" id="images" name="images[]" accept="image/*" multiple>
                        <small class="text-muted">@lang('messages.modals.product.images_hint')</small>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btnf btn__fil custom-action-btn" data-bs-dismiss="modal">
                        @lang('messages.modals.product.cancel_button')
                    </button>
                    <button type="submit" class="btnf btn__fil custom-action-btn">
                        {{ $isEdit && isset($product) ? __('messages.modals.product.update_button') : __('messages.modals.product.save_button') }}
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>