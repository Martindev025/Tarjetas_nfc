// Lógica para el botón de contacto
document.addEventListener("DOMContentLoaded", function() {
    var contactButton = document.getElementById("contactButton");

    contactButton.addEventListener("click", function(event) {
        // Verifica si es móvil (opcional: puedes ajustar esta detección)
        var isMobile = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);

        if (isMobile) {
            // No previene el comportamiento por defecto en móviles (para descargar el archivo)
            // Aquí puedes definir la acción para dispositivos móviles si no quieres que descargue
            // Por ejemplo, mostrar una alerta en lugar de descargar:
            // alert("Descargando archivo .vcf para móvil.");
        } else {
            event.preventDefault(); // Previene la descarga en escritorio
            // Abre el modal de contacto para escritorio
            window.location.href = "#open-modal-contacto";
        }
    });
});
