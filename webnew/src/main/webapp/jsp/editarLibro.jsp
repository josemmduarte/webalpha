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

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

<title>Editar Manga</title>
</head>
<body>
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
			Libro laux = lDAO.obtenerLibroPorUUID(con, (String)request.getParameter("uuid"));
		%>
		
		<ol class="breadcrumb">
			<li class="breadcrumb-item">Bienvenido <%=((Usuario) session.getAttribute("usuarioWeb")).getNombre()%>
			</li>
			<li class="breadcrumb-item"><a href="principalUsuario.jsp">Principal Usuario</a></li>
			<li class="breadcrumb-item">Editar Manga</li>
			<li class="breadcrumb-item text-danger"><a
				href="../CerrarSesion"> Cerrar Sesión </a></li>
		</ol>
	
		<div class="row justify-content-center">
			<h1>Editar Libro</h1>
		</div>
		
		<hr>
		<form class="form" method="post" action="../EditarLibro" enctype="multipart/form-data">
			<input type="hidden" name="uuid" id="uuid" value="<%=laux.getUuid()%>">
			<div class="form-group">
				<label class="control-label" for="titulo">Título</label>
				<input type="text" id="titulo" name="titulo" class="form-control" value="<%=laux.getTitulo() %>">
			</div>
			<div class="form-group">
				<label class="control-label" for="autor">Autor</label>
				<input type="text" id="autor" name="autor" class="form-control" value="<%=laux.getAutor() %>" >
			</div>
			<div class="form-group">
				<label class="control-label" for="isbn">ISBN</label>
				<input type="number" id="isbn" name="isbn" class="form-control" value="<%=laux.getIsbn() %>" >
			</div>
			<div class="form-group">
				<img alt="Portada" src="image.jsp?idManga=<%=laux.getidManga()%>" 
					style="width: 250px;height: 350px">
				<label class="control-label" for="portada">Portada</label>
				<input type="file" id="portada" name="portada" class="form-control" >
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-primary btn-block" value="Editar">
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