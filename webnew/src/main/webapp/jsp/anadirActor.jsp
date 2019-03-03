<%@page import="es.cj.bean.Pelicula"%>
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

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

<title>Añadir Actor</title>
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
						Pelicula laux = lDAO.obtenerLibroPorUUID(con, (String)request.getParameter("uuid"));
		%>
		
		<ol class="breadcrumb">
			<li class="breadcrumb-item">Bienvenido <%=((Usuario) session.getAttribute("usuarioWeb")).getNombre()%></li>
			<li class="breadcrumb-item"><a href="principalUsuario.jsp">Principal Usuario</a></li>
			<li class="breadcrumb-item"><a href="detalle.jsp?uuid=<%=laux.getUuid()%>"><%=laux.getTitulo()%></a></li>
			<li class="breadcrumb-item">Añadir Actor</li>
			<li class="breadcrumb-item text-danger"><a
				href="../CerrarSesion"> Cerrar Sesión </a></li>	
		</ol>
	
		<div class="card"
			style="margin: 10px; text-align: center; background: #8258FA; color: white;">
			<h1><b>Añadir Actor a: <%=laux.getTitulo()%></b></h1>
		</div>
		
		
		<hr>
		<form class="form" method="post" action="../AnadirActor" enctype="multipart/form-data" onsubmit="return validarFormulario()">
			<div class="form-group">
				<label class="control-label" for="titulo"><b>Nombre</b></label>
				<input type="text" id="nombre" name="nombre" class="form-control" maxlength="45" required>
			</div>
			<div class="form-group">
				<label class="control-label" for="papel"><b>Papel</b></label>
				<input type="text" id="papel" name="papel" class="form-control" maxlength="45" required>
			</div>
			<div class="form-group">
				<label class="control-label" for="foto"><b>Imagen</b></label>
				<input type="file" id="foto" name="foto" class="form-control" accept="image/*" required>
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-primary btn-block" value="Añadir" style="background-color:#8258FA; border-color:#8258FA;">
			</div>
			
			<input id="idPelicula" type="hidden" name="idPelicula" value="<%=laux.getidPelicula()%>"/>
			
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