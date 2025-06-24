



    <!-- Modal -->
    <div id="modalFormEdit" class="modal-container">
        <div class="modal-content">
            <span class="close" onclick="document.getElementById('modalFormEdit').style.display='none'">&times;</span>
            <h2>EDITAR  TARJETA</h2>
            <form  action="{{ route('nfc-cards.update', $nfc_card->id) }}" method="POST" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <div class="form-grid">
                    <input type="text" name="nombre" placeholder="Nombre"  value="{{ $nfc_card->nombre }}">
                    <input type="text" name="celular" placeholder="Celular" maxlength="10"
                        oninput="this.value = this.value.replace(/[^0-9]/g, '')"  value="{{ $nfc_card->celular }}">
                    <input type="text" name="ciudad" placeholder="Ciudad - Municipio"  value="{{ $nfc_card->ciudad }}">
                    <input type="text" name="cargo" placeholder="Cargo"  value="{{ $nfc_card->cargo }}">
                    <input type="text" name="empresa" placeholder="Empresa" value="{{ $nfc_card->empresa }}">

                    

                    <input type="text" name="telefono_opci" placeholder="Celular 2 (opcional)" maxlength="10"
                        oninput="this.value = this.value.replace(/[^0-9]/g, '')"  >
                    <input type="text" name="correo" placeholder="Correo electrónico" value="{{ $nfc_card->correo }}">
                    <input type="text" name="correo_opc" placeholder="Correo electrónico 2 (opcional)">
                    <input type="text" name="pagina" placeholder="Página (opcional)">
                    <input type="file" name="feature" >
                </div>

                <div class="form-check-group">
                    <input type="checkbox" id="modal_autorizacion" name="autorizacion">
                    <label for="autorizacion">
                        ¿AUTORIZA EL TRATAMIENTO DE SUS DATOS?
                        <a href="{{ asset('tratamiento.pdf') }}" target="_blank">(Leer tratamiento de datos)</a>
                    </label>
                </div>

               

                <div class="modal-buttons">
                    <button type="button"class="custom-action-btn"
                        onclick="document.getElementById('modalFormEdit').style.display='none'">Cancelar</button>
                    <button type="submit" class="custom-action-btn" id="modal_guardar" disabled>Guardar</button>
                </div>
            </form>
            <script>
    document.getElementById('modal_autorizacion').addEventListener('change', function () {
        document.getElementById('modal_guardar').disabled = !this.checked;
    });
</script>
        </div>
    </div>

    




   
  

    

   


    