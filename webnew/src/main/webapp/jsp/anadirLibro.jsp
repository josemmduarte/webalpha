<%@page import="es.cj.bean.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css">

<script type="text/javascript" src="../js/validaciones.js"></script>
<script type="text/javascript" src="../js/prueba2.js"></script>


<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

<title>A�adir Pelicula</title>
</head>
<body background="../imagenes/corn.png">
	<div class="container">
	
		<%
		if (session.getAttribute("usuarioWeb") == null || session.isNew()) {
			response.sendRedirect("../index.jsp?mensaje=Error de sesi�n");
		} else {	
		%>
		
		<br>
		<div id="navegador">
			<ul class="btn btn-primary btn-xs btn-block" style="background-color: #8258FA; border-color: #8258FA;">
				<li><b>A�adir Pelicula</b></li>
				<li><a href="principalUsuario.jsp">Principal Usuario</a></li>
				<li><a href="../CerrarSesion">Cerrar Sesi�n</a></li>
			</ul>
		</div>
				
		<hr>
		<form class="form" method="post" action="../AnadirLibro" enctype="multipart/form-data" onsubmit="return prueba()">
			<div class="form-group">
				<label class="control-label" for="titulo"><b>Titulo</b></label>
				<input type="text" id="titulo" name="titulo" class="form-control" maxlength="45" required>
			</div>
			<div class="form-group">
				<label class="control-label" for="director"><b>Director</b></label>
				<input type="text" id="director" name="director" class="form-control" maxlength="45" required>
			</div>
			<div class="form-group">
				<label class="control-label" for="anyo"><b>A�o</b></label>
				<input type="number" id="anyo" name="anyo" class="form-control" maxlength="4" required>
			</div>
			<div class="form-group">
				<label class="control-label" for="sinopsis"><b>Sinopsis</b></label>
				<textarea rows="4" id="sinopsis" name="sinopsis" class="form-control" maxlength="500"></textarea>
			</div>
			<div class="form-group">
				<label class="control-label" for="portada"><b>Portada</b></label>
				<input type="file" id="portada" name="portada" class="form-control" accept="image/*">
				<span id="spportada"></span>
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-primary btn-block" value="A�adir" style="background-color:#8258FA; border-color:#8258FA;">
			</div>
		</form>
		
		<% } %>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="../js/jquery-3.3.1.slim.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>