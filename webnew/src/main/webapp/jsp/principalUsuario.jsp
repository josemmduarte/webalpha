<%@page import="es.cj.bean.Libro"%>
<%@page import="java.util.List"%>
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

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">

<style type="text/css">
.modal {
	text-align: center;
}
@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}
.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}
</style>

<title>Principal Usuario</title>
</head>
<body>
	<%
		if (session.getAttribute("usuarioWeb") == null || session.isNew()) {
			response.sendRedirect("../index.jsp?mensaje=Error de sesión");
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
			List<Libro> libros = lDAO.listar(con, (Usuario) session.getAttribute("usuarioWeb"));
	%>
	<div class="container">

		<ol class="breadcrumb">
			<li class="breadcrumb-item">Bienvenido <%=((Usuario) session.getAttribute("usuarioWeb")).getNombre()%>
			</li>
			<li class="breadcrumb-item">Principal Usuario</li>
			<li class="breadcrumb-item text-danger"><a
				href="../CerrarSesion"> Cerrar Sesión </a></li>
		</ol>

		<p>
			<a href="anadirLibro.jsp" class="btn btn-primary btn-xs btn-block">Añadir
				Libro</a>
		</p>

		<div class="row col-md-12 text-center">
			<%
				for (Libro l : libros) {
			%>

			<div class="card" style="margin: 10px">
				<img alt="imagen de libro"
					src="image.jsp?idLibro=<%=l.getIdLibro()%>" class="card-img-top"
					style="width: 300px; height: 100px">
				<div class="card-body">
					<h5 class="card-title"><%=l.getTitulo()%></h5>
					<p class="card-text"><%=l.getAutor()%></p>
					<p class="card-text">
						<small class="text-muted"><%=l.getIsbn()%></small>
					</p>
					<button type="button" class="btn btn-default" onclick="">Actualizar</button>
					<button type="button" class="btn btn-danger" data-toggle="modal" 
						data-target="modalBorrar<%=l.getIdLibro()%>">Borrar</button>
					<!-- Modal -->
					<div class="modal fade" id="modalBorrar<%=l.getIdLibro()%>" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Borrar Libro</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body">
									¿Desea borrar el libro <%=l.getTitulo() %>?
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">No</button>
									<button type="button" class="btn btn-primary" 
										onclick="location.href='../BorrarLibro?uuid=<%=l.getUuid()%>'">Sí</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%
				}
			%>
		</div>


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