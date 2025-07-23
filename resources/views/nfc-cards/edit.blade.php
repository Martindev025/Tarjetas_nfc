<!-- Modal -->
<div id="modalFormEdit" class="modal-container">
    <div class="modal-content">
        <span class="close" onclick="document.getElementById('modalFormEdit').style.display='none'">&times;</span>
        <h2>{{ __('messages.edit_card_modal.title') }}</h2>
        <form action="{{ route('nfc-cards.update', $nfc_card->id) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="form-grid">
                <input type="text" name="nombre" placeholder="{{ __('messages.edit_card_modal.name') }}" value="{{ $nfc_card->nombre }}">
                <input type="text" name="celular" placeholder="{{ __('messages.edit_card_modal.cellphone') }}" maxlength="10"
                    oninput="this.value = this.value.replace(/[^0-9]/g, '')" value="{{ $nfc_card->celular }}">
                <input type="text" name="ciudad" placeholder="{{ __('messages.edit_card_modal.city') }}" value="{{ $nfc_card->ciudad }}">
                <input type="text" name="cargo" placeholder="{{ __('messages.edit_card_modal.position') }}" value="{{ $nfc_card->cargo }}">
                <input type="text" name="empresa" placeholder="{{ __('messages.edit_card_modal.company') }}" value="{{ $nfc_card->empresa }}">
                <input type="text" name="telefono_opci" placeholder="{{ __('messages.edit_card_modal.optional_cellphone') }}" maxlength="10"
                    oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                <input type="text" name="correo" placeholder="{{ __('messages.edit_card_modal.email') }}" value="{{ $nfc_card->correo }}">
                <input type="text" name="correo_opc" placeholder="{{ __('messages.edit_card_modal.optional_email') }}">
                <input type="text" name="pagina" placeholder="{{ __('messages.edit_card_modal.website') }}">
                <input type="file" name="feature">
            </div>

            <div class="form-check-group">
                <input type="checkbox" id="modal_autorizacion" name="autorizacion">
                <label for="autorizacion">
                    {{ __('messages.edit_card_modal.authorization_label') }}
                    <a href="{{ asset('tratamiento.pdf') }}" target="_blank">{{ __('messages.edit_card_modal.authorization_link') }}</a>
                </label>
            </div>

            <div class="modal-buttons">
                <button type="button" class="custom-action-btn"
                    onclick="document.getElementById('modalFormEdit').style.display='none'">{{ __('messages.edit_card_modal.cancel') }}</button>
                <button type="submit" class="custom-action-btn" id="modal_guardar" disabled>{{ __('messages.edit_card_modal.save') }}</button>
            </div>
        </form>
        <script>
            document.getElementById('modal_autorizacion').addEventListener('change', function () {
                document.getElementById('modal_guardar').disabled = !this.checked;
            });
        </script>
    </div>
</div>