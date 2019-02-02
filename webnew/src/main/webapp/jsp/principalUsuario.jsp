<%@page import="es.cj.bean.Libro"%>
<%@page import="java.util.List"%>
<%@page import="es.cj.dao.LibroDAO"%>
<%@page import="es.cj.dao.LibroDAOImpl"%>
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

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

<title>Principal Usuario</title>
</head>
<body>
	
		<% 
			if(session.getAttribute("usuarioWeb") == null || session.isNew()){
				response.sendRedirect("../index.jsp?mensaje=Error de sesion");
			} else {
				// Voy a capturar los datos del web.xml
				ServletContext sc = getServletContext();
				String usu = sc.getInitParameter("usuario");
				String pass = sc.getInitParameter("password");
				String driver = sc.getInitParameter("driver");
				String bd = sc.getInitParameter("database");
				
				// Crear un objeto de tipo Conexion con los datos anteriores
				Conexion con = new Conexion(usu, pass, driver, bd);
				
				LibroDAO lDAO = new LibroDAOImpl();
				List<Libro> libros = lDAO.listar(con, (Usuario)session.getAttribute("usuarioWeb"));
			
		%>
	<div class="container">
		<p>
			<a href="anadirLibro.jsp" class="btn btn-primary btn-xs btn-block">Añadir Libro</a>
		</p>
		
		<div class="row col-md-12 text-center">
			<% 
				for (Libro l:libros){
				%>
					<div class="card" style="margin: 10px">
						<img alt="imagen de libro" src="img.jsp?idLibro=<%=l.getIdLibro() %>" 
							class="card-img-top" style="width: 300px; height: 100px">
						<div class="card-body">
							<h5 class="card-title"><%=l.getTitulo() %></h5>
							<p class="card-text"><%=l.getAutor() %></p>
							<p class="card-text"><small class="text-muted"><%=l.getIsbn() %></small></p>
							<button type="button" class="btn btn-default" onclick="">Actualizar</button>
							<button type="button" class="btn btn-danger" onclick="">Borrar</button>
						</div>
					</div>
				<%}
			%>
		</div>
		
		<% } %>
		
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="../js/jquery-3.3.1.slim.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>