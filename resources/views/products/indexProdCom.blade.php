@extends('layout')


@section('content')
    @php
        $isEdit = $isEdit ?? false;
        $company = $company ?? null;
    @endphp



    @include('products.createCompany')
    @include('products.modalProduct', [
        'isEdit' => false,
        'companies' => $companies,
    ])
    {{-- Título centrado con botones alineados a la derecha --}}
    <style>
        .admin-header {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .admin-title {
            flex: 1 1 300px;
        }

        .admin-buttons {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
            justify-content: flex-end;
            flex: 1 1 300px;
        }
    </style>

    <div class="admin-header">
        <!-- Título a la izquierda -->
        <div class="admin-title">
            <h2 class="fw-bold text-dark mb-1">@lang('messages.companies.title')</h2>
            <p class="lead mb-0">@lang('messages.companies.subtitle')</p>
        </div>

        <!-- Botones a la derecha -->
        <div class="admin-buttons">
            <button class="btnf btn__fil custom-action-btn" data-bs-toggle="modal" data-bs-target="#createCompanyModal">
                <i class="fas fa-building me-1"></i> @lang('messages.companies.new_company')
            </button>
            <button class="btnf btn__fil custom-action-btn" data-bs-toggle="modal" data-bs-target="#createProductModal">
                <i class="fas fa-plus-circle me-1"></i> @lang('messages.companies.new_product')
            </button>
        </div>
    </div>



    {{-- Tabla de Empresas --}}
    <div class="row mb-5">
        <div class="col-12">
            <div class="card shadow-sm mb-4">
                <div class="card-header bg-white py-3">
                    <h4 class="mb-0 text-center">@lang('messages.companies.companies_table_title')</h4>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0" id="companiesTable">
                            <thead class="thead-light">
                                <tr>
                                    <th>@lang('messages.companies.company_name')</th>
                                    <th class="text-center">@lang('messages.companies.actions')</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($companies as $company)
                                    @include('products.createCompany', [
                                        'company' => $company,
                                        'isEdit' => true,
                                    ])
                                    <tr>
                                        <td>{{ $company->name }}</td>
                                        <td class="text-center">
                                            <div class="d-flex justify-content-center gap-2">

                                                <a href="{{ route('products.byCompany', $company->id) }}"
                                                    title="@lang('messages.companies.view_products')">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                        fill="currentColor" color="black" class="bi bi-eye-fill"
                                                        viewBox="0 0 16 16">
                                                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0" />
                                                        <path
                                                            d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7" />
                                                    </svg>
                                                </a>

                                                <a data-bs-toggle="modal"
                                                    data-bs-target="#editCompanyModal{{ $company->id }}">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                        fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                        <path
                                                            d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                                        <path fill-rule="evenodd"
                                                            d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
                                                    </svg>
                                                </a>

                                                <form id="deleteCompanyForm{{ $company->id }}"
                                                    action="{{ route('companies.destroy', $company->id) }}" method="POST"
                                                    class="d-inline">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="button" class="btn-delete-company"
                                                        data-id="{{ $company->id }}" data-name="{{ $company->name }}"
                                                        style="outline: none; border-color: transparent; background: transparent;">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="30"
                                                            height="30" fill="currentColor" class="bi bi-trash"
                                                            viewBox="0 0 16 16">
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
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


    </div>

    <script>
        // Traducciones para SweetAlert
        const swalTitle = @json(__('messages.delete_confirm.title'));
        const swalDeleteProductText = @json(__('messages.companies.delete_product_text')); // Debes agregar esta clave
        const swalDeleteCompanyText = @json(__('messages.companies.delete_company_text')); // Debes agregar esta clave
        const swalConfirm = @json(__('messages.delete_confirm.confirm'));
        const swalCancel = @json(__('messages.delete_confirm.cancel'));
        const swalOk = @json(__('messages.companies.success_message_ok', [], 'es')); // O usa 'OK' literal si prefieres
    </script>
    {{-- Scripts para DataTables --}}
    <script>
        let table = new DataTable('#productsTable');
        let table2 = new DataTable('#companiesTable');

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

            // Mostrar mensajes flash
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

        document.querySelectorAll('.btn-delete-company').forEach(button => {
            button.addEventListener('click', function() {
                const id = this.getAttribute('data-id');
                const name = this.getAttribute('data-name');

                Swal.fire({
                    title: swalTitle,
                    text: swalDeleteCompanyText.replace(':name', name),
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#d33',
                    cancelButtonColor: '#3085d6',
                    confirmButtonText: swalConfirm,
                    cancelButtonText: swalCancel
                }).then((result) => {
                    if (result.isConfirmed) {
                        document.getElementById(`deleteCompanyForm${id}`).submit();
                    }
                });
            });
        });
    </script>
@endsection
