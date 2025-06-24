
    <!-- Botón para abrir el modal -->
    <!-- Botón para abrir el modal -->
  

    <!-- Modal -->
    <div id="modalForm" class="modal-container">
        <div class="modal-content">
            <span class="close" onclick="document.getElementById('modalForm').style.display='none'">&times;</span>
            <h2>AGREGAR TARJETA</h2>
            <form action="{{ route('nfc-cards.store') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="form-grid">
                    <input type="text" name="nombre" placeholder="Nombre">
                    <input type="text" name="celular" placeholder="Celular" maxlength="10"
                        oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                    <input type="text" name="ciudad" placeholder="Ciudad - Municipio">
                    <input type="text" name="cargo" placeholder="Cargo">
                    <input type="text" name="empresa" placeholder="Empresa">

                    <div class="select-group">
                       
                        <div class="dropdown">
                            <button class="form-control1 dropdown-toggle w-100 text-start" type="button"
                                id="dropdownProductos" data-bs-toggle="dropdown" aria-expanded="false">
                                Seleccionar productos
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

                    <input type="text" name="telefono_opci" placeholder="Celular 2 (opcional)" maxlength="10"
                        oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                    <input type="text" name="correo" placeholder="Correo electrónico">
                    <input type="text" name="correo_opc" placeholder="Correo electrónico 2 (opcional)">
                    <input type="text" name="pagina" placeholder="Página (opcional)">
                    <input type="file" name="feature">
                </div>
                  <div class="form-check mt-3 mb-3">
  <input class="form-check-input" type="checkbox" id="autorizacion">
  <label class="form-check-label" for="autorizacion">
    Acepto el <a href="{{ asset('tratamiento.pdf') }}" target="_blank">(Leer tratamiento de datos.)</a>
  </label>
</div>
                

                <input type="hidden" name="event_id" value="{{ $event->id }}">

                <div class="modal-buttons">
                    <button type="button"class="custom-action-btn"
                        onclick="document.getElementById('modalForm').style.display='none'">Cancelar</button>
                    <button type="submit"class="custom-action-btn" id="guardar" disabled>Guardar</button>
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
   