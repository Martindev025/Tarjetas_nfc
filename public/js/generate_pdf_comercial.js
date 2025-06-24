document.addEventListener('DOMContentLoaded', function () {
    function prepareGalleryForPDF() {
        const galleryContainer = document.querySelector('.slider-container');
        if (galleryContainer && !galleryContainer.classList.contains('pdf-view')) {
            galleryContainer.classList.add('pdf-view'); // Agrega una clase que ajuste la galería para PDF
        }
    }

    function restoreGallery() {
        const galleryContainer = document.querySelector('.slider-container');
        if (galleryContainer && galleryContainer.classList.contains('pdf-view')) {
            galleryContainer.classList.remove('pdf-view'); // Restaura la galería al estado original
        }
    }

    async function generatePDF() {
        const { jsPDF } = window.jspdf;

        // Agregar clase para desactivar animaciones y asegurar visibilidad
        document.body.classList.add('no-animations');

        // Preparar galería para el PDF
        prepareGalleryForPDF();

        // Ocultar elementos que no deben aparecer en el PDF
        const elementosOcultar = ['#fondo-gris', '#fondo-azul', '.carousel-section'];
        elementosOcultar.forEach(selector => {
            const el = document.querySelector(selector);
            if (el) el.style.display = 'none';
        });

        // Forzar desplazamiento al inicio y esperar renderización
        window.scrollTo({ top: 0, behavior: 'smooth' });
        await new Promise(resolve => setTimeout(resolve, 500)); // Ajustar tiempo si es necesario

        // Capturar el contenido del body como imagen
        const canvasPage = await html2canvas(document.body, {
            scrollY: 0,
            useCORS: true,
            allowTaint: true
        });

        const pageWidth = canvasPage.width;
        const pageHeight = canvasPage.height;

        // Configurar orientación del PDF
        const isPortrait = pageHeight > pageWidth;
        const pdf = new jsPDF({
            orientation: isPortrait ? 'portrait' : 'landscape',
            unit: 'px',
            format: [pageWidth, pageHeight]
        });

        // Convertir contenido capturado en imagen y agregarlo al PDF
        const imgData = canvasPage.toDataURL('image/png');
        pdf.addImage(imgData, 'PNG', 0, 0, pageWidth, pageHeight);

        // Descargar el PDF
        pdf.save('documento.pdf');

        // Restaurar elementos ocultos
        elementosOcultar.forEach(selector => {
            const el = document.querySelector(selector);
            if (el) el.style.display = '';
        });

        // Restaurar galería al estado original
        restoreGallery();

        // Quitar clase de animaciones desactivadas
        document.body.classList.remove('no-animations');
    }

    // Asociar evento al botón de descarga
    const downloadButton = document.getElementById('download-btn');
    if (downloadButton) {
        downloadButton.addEventListener('click', generatePDF);
    } else {
        console.error('No se encontró el botón de descarga.');
    }
});
