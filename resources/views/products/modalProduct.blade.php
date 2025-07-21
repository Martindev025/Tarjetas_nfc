@php
    $isEdit = $isEdit ?? false;
    $product = $product ?? null;
@endphp

<div class="modal fade" id="{{ $isEdit && isset($product) ? 'editProductModal' . $product->id : 'createProductModal' }}"
    tabindex="-1" aria-labelledby="productModalLabel" aria-hidden="true" >
    <div class="modal-dialog">
        <div class="modal-content">
            <form
                action="{{ $isEdit && isset($product) ? route('products.update', $product) : route('products.store') }}"
                method="POST" enctype="multipart/form-data">
                @csrf
                @if ($isEdit && isset($product))
                    @method('PUT')
                @endif

                <div class="modal-header">
                    <h5 class="modal-title" id="productModalLabel">
                        {{ $isEdit && isset($product) ? 'Editar Producto' : 'Crear Producto' }}
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>

                <div class="modal-body">
                    <div class="mb-3">
                        <label for="productName" class="form-label">Nombre del Producto</label>
                        <input type="text" class="input-custom" id="productName" name="name"
                            value="{{ $isEdit && isset($product) ? $product->name : '' }}" required>
                    </div>

                    <div class="mb-3">
                        <label for="company_id" class="form-label">Empresa</label>
                        <select class="form-select-custom " name="company_id" id="company_id" required>
                            <option value="" disabled {{ !$isEdit ? 'selected' : '' }}>Seleccione una empresa
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
                        <label for="images" class="form-label">Imágenes del Producto (máx 10)</label>
                        <input class="form-control2" type="file" id="images" name="images[]" accept="image/*"
                            multiple>
                        <small class="text-muted">Puedes subir hasta 10 imágenes</small>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btnf btn__fil custom-action-btn"
                        data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btnf btn__fil custom-action-btn">
                        {{ $isEdit && isset($product) ? 'Actualizar' : 'Guardar' }}
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
