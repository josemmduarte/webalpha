<%@page import="es.cj.bean.Pelicula"%>
<%@page import="es.cj.bean.Actor"%>
<%@page import="es.cj.dao.ActorDAOImpl"%>
<%@page import="es.cj.dao.ActorDAO"%>
<%@page
	import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@page import="java.util.List"%>
<%@page import="es.cj.bean.Actor"%>
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
	.
	modal
	{
	text-align
	:
	center;
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
}
</style>

<title>Editar Actor</title>
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

				ActorDAO aDAO = new ActorDAOImpl();
				Actor aaux = aDAO.obtenerActorPoruuid(con, (String) request.getParameter("uuid"));
		%>


		<br>
		<div id="navegador">
			<ul class="btn btn-primary btn-xs btn-block" style="background-color: #8258FA; border-color: #8258FA;">
				<li><b><%=aaux.getNombre()%></b></li>
				<li><a href="javascript:history.back()">Volver a Pelicula</a></li>
				<li><a href="principalUsuario.jsp">Principal Usuario</a></li>
				<li><a href="../CerrarSesion">Cerrar Sesión</a></li>
			</ul>
		</div>
		
		<img alt="foto" src="image2.jsp?idActores=<%=aaux.getIdActores()%>"
			style="width: 200px; height: 297px">

		<!-- Borrar -->

		<button type="button" class="btn btn-danger" data-toggle="modal"
			data-target="#modalBorrar<%=aaux.getIdActores()%>";">Borrar</button>
		<!-- Modal -->
		<div class="modal fade" id="modalBorrar<%=aaux.getIdActores()%>"
			tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel"
							style="color: red; font-weight: bold;">Borrar Actor</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						¿Desea borrar a:
						<%=aaux.getNombre()%>?
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">No</button>
						<button type="button" class="btn btn-danger"
							onclick="location.href='../BorrarActor2?uuid=<%=aaux.getUuid()%>'">Sí</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Fin Borrar -->

		<form class="form" method="post" action="../EditarActor"
			enctype="multipart/form-data" onsubmit="return validarFormulario()">
			<input type="hidden" name="uuid" id="uuid" value="<%=aaux.getUuid()%>">
				
			<div class="form-group">
				<label class="control-label" for="nombre"><b>Nombre</b></label> <input
					type="text" id="nombre" name="nombre" class="form-control"
					style="width: 500px" value="<%=aaux.getNombre()%>" maxlength="45"
					required>
			</div>
			<div class="form-group">
				<label class="control-label" for="papel"><b>Papel</b></label> <input
					type="text" id="papel" name="papel" class="form-control"
					style="width: 500px" value="<%=aaux.getpapel()%>" maxlength="45"
					required>
			</div>
			<div class="form-group">
				<label class="control-label" for="foto"><b>Foto</b></label> 
				<input type="file" id="foto" name="foto" class="form-control"
					style="width: 500px" accept="image/*">
			</div>
			<br>
			<div class="form-group">
				<input type="submit" class="btn btn-primary btn-block"
					value="Actualizar"
					style="background-color: #8258FA; border-color: #8258FA; width: 500px">
			</div>
		</form>

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
