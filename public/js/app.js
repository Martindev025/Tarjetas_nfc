window.addEventListener('load', function() {
    var preloader = document.querySelector('.blobs');
    if (preloader) {
        preloader.style.opacity = '0';
        setTimeout(function() {
            preloader.style.display = 'none';
        }, 500); 
    }
});

// Seleccionable de Tarjetas
function actualizarImagenTarjeta(tarjeta) {
    var tarjetaImg = document.getElementById('tarjeta-img');
    tarjetaImg.src = "../../img/" + tarjeta + ".png";

    if (tarjeta === 'tarjeta1' || tarjeta === 'tarjeta2') {
        tarjetaImg.style.width = '20%';
        tarjetaImg.style.height = 'auto';
        tarjetaImg.style.transform = 'rotate(-90deg)';
    } else {
        tarjetaImg.style.width = '35%';
        tarjetaImg.style.height = 'auto';
        tarjetaImg.style.transform = 'rotate(0deg)';
    }
}

document.getElementById('template').addEventListener('change', function () {
    actualizarImagenTarjeta(this.value);
});

document.addEventListener('DOMContentLoaded', function () {
    actualizarImagenTarjeta(document.getElementById('template').value);
});




// Copiar link tarjetas

function copyLinkToClipboard(link) {
    // Crear un elemento de entrada temporal
    var tempInput = document.createElement("input");
    tempInput.value = link;
    document.body.appendChild(tempInput);
    
    // Seleccionar el texto del elemento
    tempInput.select();
    tempInput.setSelectionRange(0, 99999); // Para dispositivos móviles

    // Copiar el texto al portapapeles
    document.execCommand("copy");

    // Eliminar el elemento temporal
    document.body.removeChild(tempInput);

    // Mostrar un pop-up personalizado con SweetAlert2
    Swal.fire({
        icon: 'success',
        title: '¡Enlace copiado!',
        text: 'El enlace ha sido copiado al portapapeles.',
        showConfirmButton: false,
        timer: 1500
    });
}

// Multi Select Empresa

document.addEventListener('DOMContentLoaded', function () {
    var customSelect = document.getElementById('companies-select');
    var dropdownMenu = document.getElementById('companies-dropdown-menu');

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
    });

    // Event listener para el div que envuelve el checkbox y el texto
    var checkboxWrappers = dropdownMenu.querySelectorAll('.checkbox-wrapper');
    checkboxWrappers.forEach(function (wrapper) {
        wrapper.addEventListener('click', function () {
            var checkbox = wrapper.querySelector('input[type="checkbox"]');
            checkbox.checked = !checkbox.checked; // Toggle checkbox
            updateCustomSelectText(customSelect, checkboxes);
        });
    });
});

function updateCustomSelectText(customSelect, checkboxes) {
    var selectedOptions = Array.from(checkboxes).filter(i => i.checked).map(i => i.nextElementSibling.textContent);
    customSelect.textContent = selectedOptions.length ? selectedOptions.join(', ') : 'Selecciona la(s) empresa(s)';
}
