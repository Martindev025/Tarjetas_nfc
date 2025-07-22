<div id="modalForm" class="modal-container">
    <div class="modal-content">
        <span class="close" onclick="document.getElementById('modalForm').style.display='none'">&times;</span>
        <h2>@lang('messages.add_card_title')</h2>
        <form action="{{ route('nfc-cards.store') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="form-grid">
                <input type="text" name="nombre" placeholder="@lang('messages.form.name')">
                <input type="text" name="celular" placeholder="@lang('messages.form.phone')" maxlength="10"
                    oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                <input type="text" name="ciudad" placeholder="@lang('messages.form.city')">
                <input type="text" name="cargo" placeholder="@lang('messages.form.position')">
                <input type="text" name="empresa" placeholder="@lang('messages.form.company')">

                <div class="select-group">
                    <div class="dropdown">
                        <button class="form-control1 dropdown-toggle w-100 text-start" type="button"
                            id="dropdownProductos" data-bs-toggle="dropdown" aria-expanded="false">
                            @lang('messages.form.select_products')
                        </button>
                        <ul class="dropdown-menu w-100" aria-labelledby="dropdownProductos"
                            style="max-height: 200px; overflow-y: auto;">
                            @foreach ($products as $product)
                                <li>
                                    <div class="form-check ms-2">
                                        <input class="form-check-input" type="checkbox" name="product_ids[]"
                                            value="{{ $product->id }}" id="product_{{ $product->id }}">
                                        <label class="form-check-label"
                                            for="product_{{ $product->id }}">{{ $product->name }}</label>
                                    </div>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                </div>

                <input type="text" name="telefono_opci" placeholder="@lang('messages.form.optional_phone')" maxlength="10"
                    oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                <input type="text" name="correo" placeholder="@lang('messages.form.email')">
                <input type="text" name="correo_opc" placeholder="@lang('messages.form.optional_email')">
                <input type="text" name="pagina" placeholder="@lang('messages.form.website')">
                <input type="file" name="feature">
            </div>

            <div class="form-check mt-3 mb-3">
                <input class="form-check-input" type="checkbox" id="autorizacion">
                <label class="form-check-label" for="autorizacion">
                    @lang('messages.form.data_consent', ['link' => asset('tratamiento.pdf')])
                </label>
            </div>

            <input type="hidden" name="event_id" value="{{ $event->id }}">

            <div class="modal-buttons">
                <button type="button" class="custom-action-btn"
                    onclick="document.getElementById('modalForm').style.display='none'">
                    @lang('messages.form.cancel')
                </button>
                <button type="submit" class="custom-action-btn" id="guardar" disabled>
                    @lang('messages.form.save')
                </button>
            </div>
        </form>
    </div>
</div>

    <script>
        document.getElementById('autorizacion').addEventListener('change', function () {
            document.getElementById('guardar').disabled = !this.checked;
        });

        document.addEventListener('DOMContentLoaded', function () {
            var customSelect = document.getElementById('products-select');
            var dropdownMenu = customSelect.nextElementSibling;

            customSelect.addEventListener('click', function () {
                dropdownMenu.classList.toggle('show');
            });

            document.addEventListener('click', function (e) {
                if (!customSelect.contains(e.target) && !dropdownMenu.contains(e.target)) {
                    dropdownMenu.classList.remove('show');
                }
            });

            var checkboxes = dropdownMenu.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(function (checkbox) {
                checkbox.addEventListener('change', function () {
                    updateCustomSelectText(customSelect, checkboxes);
                });

                // New event listener to handle label clicks
                var label = checkbox.nextElementSibling;
                label.addEventListener('click', function () {
                    checkbox.checked = !checkbox.checked; // Toggle checkbox
                    updateCustomSelectText(customSelect, checkboxes);
                });
            });

            // New event listener to handle text clicks
            var labels = dropdownMenu.querySelectorAll('label');
            labels.forEach(function (label) {
                label.addEventListener('click', function () {
                    var checkboxId = label.getAttribute('for');
                    var checkbox = document.getElementById(checkboxId);
                    checkbox.checked = !checkbox.checked; // Toggle checkbox
                    updateCustomSelectText(customSelect, checkboxes);
                });
            });
        });

        function updateCustomSelectText(customSelect, checkboxes) {
            var selectedOptions = Array.from(checkboxes).filter(i => i.checked).map(i => i.nextElementSibling.textContent);
            customSelect.textContent = selectedOptions.length ? selectedOptions.join(', ') : 'Selecciona los productos';
        }


        document.getElementById('autorizacion').addEventListener('change', function () {
            document.getElementById('guardar').disabled = !this.checked;
        });
    </script>
   