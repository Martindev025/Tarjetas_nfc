document.addEventListener('DOMContentLoaded', function() {
    function scrollToTop() {
        return new Promise((resolve) => {
            window.scrollTo({ top: 0, behavior: 'smooth' });
            setTimeout(resolve, 400); // Ajusta el tiempo según sea necesario
        });
    }

    function svgToCanvas(svgElement) {
        return new Promise((resolve) => {
            const canvas = document.createElement('canvas');
            const ctx = canvas.getContext('2d');
            const svg = new XMLSerializer().serializeToString(svgElement);

            const bbox = svgElement.getBBox();
            canvas.width = bbox.width;
            canvas.height = bbox.height;

            const img = new Image();
            img.onload = () => {
                ctx.drawImage(img, 0, 0, bbox.width, bbox.height);
                resolve(canvas);
            };
            img.src = 'data:image/svg+xml;base64,' + btoa(svg);
        });
    }

    function imgToCanvas(imgElement) {
        return new Promise((resolve) => {
            const canvas = document.createElement('canvas');
            const ctx = canvas.getContext('2d');

            const imgWidth = imgElement.width;
            const imgHeight = imgElement.height;

            canvas.width = imgWidth;
            canvas.height = imgHeight;

            ctx.beginPath();
            ctx.arc(imgWidth / 2, imgHeight / 2, Math.min(imgWidth, imgHeight) / 2, 0, 2 * Math.PI);
            ctx.clip(); // Aplica el recorte al contexto

            ctx.drawImage(imgElement, 0, 0, imgWidth, imgHeight);

            resolve(canvas);
        });
    }

    function prepareGalleryForPDF() {
        const galleryContainer = document.querySelector('.slider-container');
        if (galleryContainer && !galleryContainer.classList.contains('pdf-view')) {
            galleryContainer.classList.add('pdf-view');
        }
    }

    function restoreGallery() {
        const galleryContainer = document.querySelector('.slider-container');
        if (galleryContainer && galleryContainer.classList.contains('pdf-view')) {
            galleryContainer.classList.remove('pdf-view');
        }
    }

    function forceRedraw() {
        // Forzar el redibujado de todo el contenido
        document.body.style.display = 'none';
        document.body.offsetHeight; // Trigger reflow
        document.body.style.display = '';
    }

    async function generatePDF() {
        document.body.classList.add('no-animations');

        const fondoGris = document.getElementById('fondo-gris');
        const fondoAzul = document.getElementById('fondo-azul');
        const imageElement = document.querySelector('.circle-container img');

        if (fondoGris) fondoGris.style.display = 'none';
        if (fondoAzul) fondoAzul.style.display = 'none';

        if (imageElement) imageElement.style.opacity = '0';

        prepareGalleryForPDF();

        await scrollToTop();

        // Forzar redibujado antes de la captura
        forceRedraw();

        // Esperar un tiempo adicional para asegurar que todo esté renderizado
        await new Promise(resolve => setTimeout(resolve, 1000));

        const waveSvg = document.querySelector('.wave svg');
        const footerElement = document.querySelector('footer'); // Ajusta el selector según tu HTML

        const [canvasSvg, canvasPage] = await Promise.all([
            svgToCanvas(waveSvg),
            html2canvas(document.body, { 
                scrollY: 0, 
                useCORS: true, 
                allowTaint: true
            })
        ]);

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

        const svgRect = waveSvg.getBoundingClientRect();
        const svgWidth = svgRect.width;
        const svgHeight = svgRect.height;
        const svgTop = svgRect.top + window.scrollY;
        const svgLeft = svgRect.left + window.scrollX;

        const adjustedWidth = svgWidth + 20; 
        const adjustedLeft = svgLeft + 2.5; 

        pdf.addImage(canvasSvg.toDataURL('image/png'), 'PNG', adjustedLeft, svgTop, adjustedWidth, svgHeight);

        // Verificar si hay imagen antes de procesarla
        if (imageElement && imageElement.src) {
            try {
                const canvasImg = await imgToCanvas(imageElement);

                const imgRect = imageElement.getBoundingClientRect();
                const imgWidth = imgRect.width;
                const imgHeight = imgRect.height;
                const imgTop = imgRect.top + window.scrollY;
                const imgLeft = imgRect.left + window.scrollX;

                pdf.addImage(canvasImg.toDataURL('image/png'), 'PNG', imgLeft, imgTop, imgWidth, imgHeight);
            } catch (error) {
                console.error("Error al procesar la imagen:", error);
            }
        }

        // Asegurar que el footer esté visible
        if (footerElement) {
            const footerRect = footerElement.getBoundingClientRect();
            const footerTop = footerRect.top + window.scrollY;

            // Agregar espacio adicional en el PDF para el footer si es necesario
            // Ajustar los valores según el diseño
            pdf.text('Footer content', 10, pageHeight - 10);
        }

        pdf.save('documento.pdf');

        restoreGallery();

        window.location.reload();
    }

    document.getElementById('download-btn').addEventListener('click', generatePDF);
});
