
   document.addEventListener('DOMContentLoaded', function() {
    // Función para desplazar la página hacia arriba
    function scrollToTop() {
        return new Promise((resolve) => {
            window.scrollTo({ top: 0, behavior: 'smooth' });
            setTimeout(resolve, 500); // Ajusta el tiempo según sea necesario
        });
    }

    // Función para modificar la galería antes de generar el PDF
    function prepareGalleryForPDF() {
        const galleryContainer = document.querySelector('.slider-container');
        if (galleryContainer && !galleryContainer.classList.contains('pdf-view')) {
            galleryContainer.classList.add('pdf-view'); // Agrega una clase específica para PDF
        }
        const carouselSection = document.querySelector('.carousel-section');
        if (carouselSection) {
            carouselSection.style.display = 'none'; // Oculta el carrusel
        }
    }

    // Función para restaurar el carrusel y la galería después de generar el PDF
    function restoreGalleryAndCarousel() {
        const galleryContainer = document.querySelector('.slider-container');
        if (galleryContainer && galleryContainer.classList.contains('pdf-view')) {
            galleryContainer.classList.remove('pdf-view'); // Elimina la clase específica para PDF
        }
        const carouselSection = document.querySelector('.carousel-section');
        if (carouselSection) {
            carouselSection.style.display = 'block'; // Muestra el carrusel
        }
    }

    // Función para generar el PDF
    async function generatePDF() {
        document.body.classList.add('no-animations');
        prepareGalleryForPDF();

        await scrollToTop();

        const waveSvg = document.querySelector('.wave svg');
        const canvasPage = await html2canvas(document.body, { 
            scrollY: 0, 
            useCORS: true, 
            allowTaint: true
        });

        const { jsPDF } = window.jspdf;
        const pageWidth = canvasPage.width;
        const pageHeight = canvasPage.height;
        const isPortrait = pageHeight > pageWidth;
        const pdf = new jsPDF({
            orientation: isPortrait ? 'portrait' : 'landscape',
            unit: 'px',
            format: [pageWidth, pageHeight]
        });

        const imgData = canvasPage.toDataURL('image/png');
        pdf.addImage(imgData, 'PNG', 0, 0, pageWidth, pageHeight);

        if (waveSvg) {
            const svgRect = waveSvg.getBoundingClientRect();
            const svgWidth = svgRect.width;
            const svgHeight = svgRect.height;
            const svgTop = svgRect.top + window.scrollY;
            const svgLeft = svgRect.left + window.scrollX;
            const adjustedWidth = svgWidth + 20;
            const adjustedLeft = svgLeft + 2.5;
            pdf.addImage(waveSvg.toDataURL('image/png'), 'PNG', adjustedLeft, svgTop, adjustedWidth, svgHeight);
        }

        pdf.save('documento.pdf');
        restoreGalleryAndCarousel();

        window.location.reload();
    }

    document.getElementById('download-btn').addEventListener('click', generatePDF);
});
    
    