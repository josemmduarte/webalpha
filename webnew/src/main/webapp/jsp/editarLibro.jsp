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
			Pelicula laux = lDAO.obtenerLibroPorUUID(con, (String)request.getParameter("uuid"));
		%>
		
		
		<br>
		<div id="navegador">
			<ul class="btn btn-primary btn-xs btn-block" style="background-color: #8258FA; border-color: #8258FA;">
				<li><b>Editar Pelicula <%=laux.getTitulo()%></b></li>
				<li><a href="principalUsuario.jsp">Principal Usuario</a></li>
				<li><a href="detalle.jsp?uuid=<%=laux.getUuid()%>"><%=laux.getTitulo()%></a></li>
				<li><a href="../CerrarSesion">Cerrar Sesión</a></li>
			</ul>
		</div>
		
		<hr>
		<form class="form" method="post" action="../EditarLibro" enctype="multipart/form-data" onsubmit="return validarFormulario()">
			<input type="hidden" name="uuid" id="uuid" value="<%=laux.getUuid()%>">
			<div class="form-group">
				<label class="control-label" for="titulo"><b>Título</b></label>
				<input type="text" id="titulo" name="titulo" class="form-control" value="<%=laux.getTitulo() %>" maxlength="45" required>
			</div>
			<div class="form-group">
				<label class="control-label" for="director"><b>Director</b></label>
				<input type="text" id="director" name="director" class="form-control" value="<%=laux.getdirector() %>" maxlength="45" required>
			</div>
			<div class="form-group">
				<label class="control-label" for="anyo"><b>Año</b></label>
				<input type="number" id="anyo" name="anyo" class="form-control" value="<%=laux.getanyo() %>" maxlength="4" required>
			</div>
			<div class="form-group">
				<label class="control-label" for="sinopsis"><b>Sinopsis</b></label>
				<textarea rows="4" id="sinopsis" name="sinopsis" class="form-control" maxlength="500"><%=laux.getSinopsis() %></textarea>
			</div>
			<div class="form-group">
				<img alt="Portada" src="image.jsp?idPelicula=<%=laux.getidPelicula()%>" 
					style="width: 250px;height: 371px">
				<label class="control-label" for="portada"></label>
				<input type="file" id="portada" name="portada" class="form-control" accept="image/*">
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-primary btn-block" value="Editar" style="background-color:#8258FA; border-color:#8258FA;">
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