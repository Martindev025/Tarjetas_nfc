 @extends('layout')


 @section('content')


     @include('products.createCompany', ['isEdit' => false, 'company' => null])



     <div class="admin-header">
         <!-- Título a la izquierda -->
         <div class="admin-title">
             <h2 class="fw-bold text-dark mb-1">@lang('messages.products.title') </h2>
             <p class="lead mb-0">{{ $empresa->name }}</p>
         </div>

         <!-- Botones a la derecha -->
         <div class="admin-buttons">

             <a href="{{ url()->previous() }}" class="btnf btn__fil custom-action-btn">
               @lang('messages.products.back_button')</a>

             <button class="btnf btn__fil custom-action-btn" data-bs-toggle="modal" data-bs-target="#createProductModal">
                 <i class="fas fa-plus-circle me-1"></i>@lang('messages.products.new_product_button')
             </button>
         </div>
     </div>




     @if ($empresa->products->isEmpty())
         <p>@lang('messages.products.no_products')</p>
     @else
         <div class="card shadow-sm">
             <div class="card-header bg-white py-3">
                 <h4 class="mb-0 text-center">@lang('messages.products.products_header')</h4>
             </div>
             <div class="card-body p-0">
                 <div class="table-responsive">
                     <table class="table table-hover mb-0" id="productsTable">
                         <thead class="thead-light">
                             <tr>
                                 <th>@lang('messages.products.table_name')</th>
                                 <th>@lang('messages.products.table_images')</th>
                                 <th class="text-center">@lang('messages.products.table_actions')</th>
                             </tr>
                         </thead>
                         <tbody>
                             @foreach ($empresa->products as $product)
                                 {{-- Modal para editar este producto --}}
                                 @include('products.modalProduct', [
                                     'product' => $product,
                                     'isEdit' => true,
                                     'companies' => $companies,
                                 ])
                                 <tr>
                                     <td>{{ $product->name }}</td>
                                     <td>
                                         @if ($product->images->isNotEmpty())
                                             <div class="mt-2">
                                                 <img src="{{ asset('storage/' . $product->images->first()->image_path) }}"
                                                     alt="Imagen principal" class="img-thumbnail"
                                                     style="width: 80px; height: 80px; object-fit: cover; cursor: pointer;"
                                                     data-bs-toggle="modal"
                                                     data-bs-target="#productImagesModal{{ $product->id }}">
                                             </div>
                                         @endif
                                     </td>
                                     <td class="text-center">
                                         <div class="d-flex justify-content-center gap-2">
                                             <!-- Botón editar -->
                                             <a data-bs-toggle="modal"
                                                 data-bs-target="#editProductModal{{ $product->id }}">
                                                 <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                     fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                     <path
                                                         d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                                     <path fill-rule="evenodd"
                                                         d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
                                                 </svg>
                                             </a>

                                             <!-- Botón eliminar -->
                                             <form id="delete-form-{{ $product->id }}"
                                                 action="{{ route('products.destroy', $product->id) }}" method="POST"
                                                 class="d-inline">
                                                 @csrf
                                                 @method('DELETE')
                                                 <button type="button" class="btn-delete"
                                                     data-form-id="delete-form-{{ $product->id }}"
                                                     data-product-name="{{ $product->name }}"
                                                     style="outline: none;border-color: transparent; background: transparent;">
                                                     <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                         fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                                         <path
                                                             d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z" />
                                                         <path
                                                             d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z" />
                                                     </svg>
                                                 </button>
                                             </form>
                                         </div>
                                     </td>
                                 </tr>
                                 <!-- Modal con todas las imágenes del producto -->
                                 <div class="modal fade" id="productImagesModal{{ $product->id }}" tabindex="-1"
                                     aria-labelledby="productImagesModalLabel{{ $product->id }}" aria-hidden="true">
                                     <div class="modal-dialog modal-dialog-centered" style="max-width: 500px;">
                                         <!-- Aumentamos el tamaño -->
                                         <div class="modal-content">
                                             <div class="modal-header py-2">
                                                 <h5 class="modal-title fs-6 w-100 text-center"
                                                     id="productImagesModalLabel{{ $product->id }}">
                                                     @lang('messages.products.images_modal_title') {{ $product->name }}
                                                 </h5>
                                                 <button type="button" class="btn-close position-absolute end-0 me-2 mt-2"
                                                     data-bs-dismiss="modal" aria-label="Cerrar"></button>
                                             </div>
                                             <div class="modal-body p-2">
                                                 @if ($product->images->isNotEmpty())
                                                     <div id="carouselProductImages{{ $product->id }}"
                                                         class="carousel slide" data-bs-ride="carousel">
                                                         <div class="carousel-inner">
                                                             @foreach ($product->images as $index => $image)
                                                                 <div
                                                                     class="carousel-item {{ $index === 0 ? 'active' : '' }}">
                                                                     <img src="{{ asset('storage/' . $image->image_path) }}"
                                                                         class="d-block w-100 rounded"
                                                                         alt="Imagen del producto"
                                                                         style="height: 250px; object-fit: cover;">
                                                                 </div>
                                                             @endforeach
                                                         </div>
                                                         <button class="carousel-control-prev" type="button"
                                                             data-bs-target="#carouselProductImages{{ $product->id }}"
                                                             data-bs-slide="prev">
                                                             <span class="carousel-control-prev-icon"
                                                                 aria-hidden="true"></span>
                                                             <span class="visually-hidden"> @lang('messages.products.carousel_prev')</span>
                                                         </button>
                                                         <button class="carousel-control-next" type="button"
                                                             data-bs-target="#carouselProductImages{{ $product->id }}"
                                                             data-bs-slide="next">
                                                             <span class="carousel-control-next-icon"
                                                                 aria-hidden="true"></span>
                                                             <span class="visually-hidden"> @lang('messages.products.carousel_next')</span>
                                                         </button>
                                                     </div>
                                                 @else
                                                     <p class="text-center"> @lang('messages.products.no_images_text').</p>
                                                 @endif
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                             @endforeach
                         </tbody>

                     </table>
                 </div>
             </div>
         </div>
     @endif


     </div>

     @include('products.modalProduct', ['product' => null, 'isEdit' => false, 'companies' => $companies])
     <script>
    // Pasar traducciones de Laravel a variables JS
    const swalTitle = @json(__('messages.delete_confirm.title'));
    const swalDeleteProductText = @json(__('messages.companies.delete_product_text'));
    const swalConfirm = @json(__('messages.delete_confirm.confirm'));
    const swalCancel = @json(__('messages.delete_confirm.cancel'));
    const swalOk = @json(__('messages.companies.success_message_ok', [], 'es')); // O usa 'OK' literal si prefieres

    let table = new DataTable('#productsTable');
    document.addEventListener('DOMContentLoaded', function() {
        const deleteButtons = document.querySelectorAll('.btn-delete');

        deleteButtons.forEach(button => {
            button.addEventListener('click', function() {
                const formId = this.dataset.formId;
                const productName = this.dataset.productName || 'este elemento';

                Swal.fire({
                    title: swalTitle,
                    text: swalDeleteProductText.replace(':name', productName),
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#d33',
                    cancelButtonColor: '#3085d6',
                    confirmButtonText: swalConfirm,
                    cancelButtonText: swalCancel
                }).then((result) => {
                    if (result.isConfirmed) {
                        document.getElementById(formId).submit();
                    }
                });
            });
        });

        @if (session('alert_message'))
            Swal.fire({
                text: "{{ session('alert_message') }}",
                icon: "{{ Str::contains(session('alert_message'), '✅') ? 'success' : 'warning' }}",
                confirmButtonText: swalOk,
                customClass: {
                    confirmButton: 'btn btn-primary'
                },
                buttonsStyling: false
            });
        @endif
    });
</script>

 @endsection
