<%@page import="es.cj.dao.ActorDAOImpl"%>
<%@page import="es.cj.dao.ActorDAO"%>
<%@page import="es.cj.bean.Libro"%>
<%@page import="es.cj.dao.LibroDAOImpl"%>
<%@page import="es.cj.dao.LibroDAO"%>
<%@page import="es.cj.bean.Conexion"%>
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

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">

<style type="text/css">
img {
	float: left;
	margin-right: 20px;
}
</style>

<title>Editar Pelicula</title>
</head>
<body background="../imagenes/corn.png">
	<div class="container">
		<%
			if (session.getAttribute("usuarioWeb") == null || session.isNew()) {
				response.sendRedirect("../index.jsp?mensaje=Error de sesión");
			} else {

				// Conexión con la base de datos
				// Voy a capturar los datos del web.xml
				ServletContext sc = getServletContext();
				String usu = sc.getInitParameter("usuario");
				String pass = sc.getInitParameter("password");
				String driver = sc.getInitParameter("driver");
				String bd = sc.getInitParameter("database");
				// Crear un objeto de tipo Conexion con los datos anteriores
				Conexion con = new Conexion(usu, pass, driver, bd);

				LibroDAO lDAO = new LibroDAOImpl();
				Libro laux = lDAO.obtenerLibroPorUUID(con, (String) request.getParameter("uuid"));
		
		%>

		<ol class="breadcrumb">
			<li class="breadcrumb-item">Bienvenido <%=((Usuario) session.getAttribute("usuarioWeb")).getNombre()%>
			</li>
			<li class="breadcrumb-item"><%=laux.getTitulo()%></li>
			<li class="breadcrumb-item"><a href="principalUsuario.jsp">Principal
					Usuario</a></li>
			<li class="breadcrumb-item text-danger"><a
				href="../CerrarSesion"> Cerrar Sesión </a></li>
		</ol>

		<div class="row justify-content-center">
			<h1>
				<b><%=laux.getTitulo()%></b>
			</h1>
		</div>
		<hr>

		<img alt="Portada"
			src="image.jsp?idPelicula=<%=laux.getidPelicula()%>"
			style="width: 250px; height: 371px">

		<form class="star">
			<p class="clasificacion">
				<input id="radio1" type="radio" name="estrellas" value="5">
				<label for="radio1">&#9733;</label>
				<input id="radio2" type="radio" name="estrellas" value="4">
				<label for="radio2">&#9733;</label>
				<input id="radio3" type="radio" name="estrellas" value="3">
				<label for="radio3">&#9733;</label>
				<input id="radio4" type="radio" name="estrellas" value="2">
				<label for="radio4">&#9733;</label>
				<input id="radio5" type="radio" name="estrellas" value="1">
				<label for="radio5">&#9733;</label>
			</p>
		</form>

		<div class="card"
			style="margin: 10px; background-color: #D8CEF6; border: 0px;">
			<h4>
				<b>Director:</b>
				<%=laux.getdirector()%></h4>
			<h4>
				<b>Año:</b>
				<%=laux.getanyo()%></h4>
			<h4>
				<b>Sinopsis:</b>
				<%=laux.getSinopsis()%></h4>
		</div>

		<button type="button" class="btn btn-default"
			onclick="location.href='editarLibro.jsp?uuid=<%=laux.getUuid()%>'">Actualizar</button>
			
		<%
			}
		%>

	
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="../js/jquery-3.3.1.slim.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>
