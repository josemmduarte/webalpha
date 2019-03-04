<%@page import="es.cj.bean.Pelicula"%>
<%@page import="java.util.List"%>
<%@page import="es.cj.dao.LibroDAOImpl"%>
<%@page
	import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
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
<body background="../imagenes/corn.png">
	<div class="container">
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
				List<Pelicula> peliculas = lDAO.listar(con, (Usuario) session.getAttribute("usuarioWeb"));
		%>
		<br>
		<div class="row justify-content-center">
			<img src="../imagenes/img2.png">
		</div>
		<div class="row justify-content-center">
			<img src="../imagenes/img3.png">
		</div>

		<br>
		<div id="navegador">
			<ul class="btn btn-primary btn-xs btn-block"
				style="background-color: #8258FA; border-color: #8258FA;">
				<li><b>Bienvenido <%=((Usuario) session.getAttribute("usuarioWeb")).getNombre()%></b></li>
				<li><a href="anadirLibro.jsp">Añadir Pelicula</a></li>
				<li><a href="../CerrarSesion">Cerrar Sesión</a></li>
			</ul>
		</div>

		<div class="row col-md-12 text-center">
			<%
				for (Pelicula l : peliculas) {
			%>

			<div class="card" style="margin: 10px; width: 252px;">
				<button type="button" class="btn btn-link"
					onclick="location.href='detalle.jsp?uuid=<%=l.getUuid()%>'">
					<img alt="imagen de libro"
						src="image.jsp?idPelicula=<%=l.getidPelicula()%>"
						class="card-img-top" style="width: 225px; height: 333px;">
				</button>
				<!-- <div class="card-body">  -->

				<p>
					<b><%=l.getTitulo()%></b>
				</p>

				<button type="button" class="btn btn-danger" data-toggle="modal"
					data-target="#modalBorrar<%=l.getidPelicula()%>">Borrar</button>
				<!-- Modal -->
				<div class="modal fade" id="modalBorrar<%=l.getidPelicula()%>"
					tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel"
									style="color: red; font-weight: bold;">Borrar Pelicula</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								¿Desea borrar la Pelicula:
								<%=l.getTitulo()%>?
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">No</button>
								<button type="button" class="btn btn-danger"
									onclick="location.href='../BorrarLibro?uuid=<%=l.getUuid()%>'">Sí</button>
							</div>
						</div>
					</div>
				</div>
				<!-- </div> -->
			</div>

			<%
				}
			%>
		</div>

		<br> <br>

		<div id="navegador">
			<ul class="btn btn-primary btn-xs btn-block"
				style="background-color: #8258FA; border-color: #8258FA;">
				<li><a href="anadirLibro.jsp">Añadir Pelicula</a></li>
				<li><a href="../CerrarSesion">Cerrar Sesión</a></li>
			</ul>
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

<!-- Imagen -->
<!--  <img src="../imagenes/lala.png" style="height: 300px; float: right;">-->

</html>

