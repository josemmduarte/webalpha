/**
 * 
 */

function validarFormulario() {
	var login = ducument.getElementById("login");
	if (login.value == null || login.value.trim().length == 0) {
		document.getElementById("splogin").innerHTML = "Debe rellenar el campo";
		return false;
	}
	return true;
}

