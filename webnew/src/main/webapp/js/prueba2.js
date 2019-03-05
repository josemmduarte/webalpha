/**
 * 
 */


function prueba() {
	
	var fileInput = document.getElementById('portada');
    var filePath = fileInput.value;
    var allowedExtensions = /(.jpg|.jpeg|.png)$/i;
    if(!allowedExtensions.exec(filePath)){
    	document.getElementById("spportada").innerHTML = "Suba: .jpeg/.jpg/.png";
        fileInput.value = '';
        return false;
    }else{
    	document.getElementById("spportada").innerHTML = "";
    }
    
    return true;
	
}
