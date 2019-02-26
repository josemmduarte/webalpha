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

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

<title>Añadir Pelicula</title>
</head>
<body>
	<div class="container">
	
		<%
		if (session.getAttribute("usuarioWeb") == null || session.isNew()) {
			response.sendRedirect("../index.jsp?mensaje=Error de sesión");
		} else {	
		%>
		
		<ol class="breadcrumb">
			<li class="breadcrumb-item">Bienvenido <%=((Usuario) session.getAttribute("usuarioWeb")).getNombre()%>
			</li>
			<li class="breadcrumb-item"><a href="principalUsuario.jsp">Principal Usuario</a></li>
			<li class="breadcrumb-item">Añadir Libro</li>
			<li class="breadcrumb-item text-danger"><a
				href="../CerrarSesion"> Cerrar Sesión </a></li>
				
		</ol>
	
		<div class="row justify-content-center">
			<h1>Añadir Pelicula</h1>
		</div>
		
		<hr>
		<form class="form" method="post" action="../AnadirLibro" enctype="multipart/form-data">
			<div class="form-group">
				<label class="control-label" for="titulo">Titulo</label>
				<input type="text" id="titulo" name="titulo" class="form-control">
			</div>
			<div class="form-group">
				<label class="control-label" for="director">director</label>
				<input type="text" id="director" name="director" class="form-control" >
			</div>
			<div class="form-group">
				<label class="control-label" for="anyo">anyo</label>
				<input type="number" id="anyo" name="anyo" class="form-control" >
			</div>
			<div class="form-group">
				<label class="control-label" for="sinopsis">sinopsis</label>
				<input type="text" id="sinopsis" name="sinopsis" class="form-control" >
			</div>
			<div class="form-group">
				<label class="control-label" for="portada">Portada</label>
				<input type="file" id="portada" name="portada" class="form-control" >
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-primary btn-block" value="Añadir">
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