function notexitoso(texto, ubicacion) {
    swal.fire({
        type: 'success',
        html: texto,
        allowOutsideClick: false,
        allowEnterKey: false
    }).then((result) => {
        if (result.value) {
            window.location.replace(ubicacion);
        }
    });
    console.log(texto);
}

function noterror(texto, ubicacion) {
    swal.fire({
        type: 'error',
        html: texto,
        allowOutsideClick: false,
        allowEnterKey: false
    }).then((result) => {
        if (result.value) {
            location.href= "http://"+ubicacion;
        }
    });
    console.log(texto);
}

function alertas(texto,tipo) {
    swal.fire({
        allowEnterKey: false,
   //     width:'1200px',
        type:tipo,
        text: texto
    });
}



function notificacionerror(texto) {
    swal.fire({
        allowEnterKey: false,
        title: 'Error',
      // width: '1200px',
        type: 'error',
        html: texto
    });
    console.log(texto);
}


function logueado() {
    const Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000,
        onOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
    });


    Toast.fire({
        type: 'success',
        title: 'Ingreso correcto'
    });
}

