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
}
</style>

<title>Editar Actor</title>
</head>
<body background="../imagenes/corn.png">
	<div class="container">
		<%
			if (session.getAttribute("usuarioWeb") == null || session.isNew()) {
				response.sendRedirect("../index.jsp?mensaje=Error de sesi�n");
			} else {

				// Conexi�n con la base de datos
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

		<ol class="breadcrumb">
			<li class="breadcrumb-item">Bienvenido <%=((Usuario) session.getAttribute("usuarioWeb")).getNombre()%>
			</li>
			<li class="breadcrumb-item"><a href="principalUsuario.jsp">Principal Usuario</a></li>
			<li class="breadcrumb-item"><a href="javascript:history.back()"> Pelicula</a></li>
			<li class="breadcrumb-item"><a><%=aaux.getNombre()%></a></li>
			<li class="breadcrumb-item text-danger"><a
				href="../CerrarSesion"> Cerrar Sesi�n </a></li>
		</ol>
		
		<img alt="foto"
			src="image2.jsp?idActores=<%=aaux.getIdActores()%>"
			style="width: 200px; height: 297px">
			
			<button type="button" class="btn btn-default" data-toggle="modal"
						data-target="#modalBorrar<%=aaux.getIdActores()%>">Actualizar</button>
			
			<!-- Borrar -->
			
				<button type="button" class="btn btn-danger" data-toggle="modal"
						data-target="#modalBorrar<%=aaux.getIdActores()%>">Borrar</button>
					<!-- Modal -->
					<div class="modal fade" id="modalBorrar<%=aaux.getIdActores()%>" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel" style="color: red; font-weight: bold;">Borrar Actor</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">�</span> 
									</button>
								</div>
								<div class="modal-body">
									�Desea borrar a: <%=aaux.getNombre() %>?
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">No</button>
									<button type="button" class="btn btn-danger" 
										onclick="location.href='../BorrarActor2?uuid=<%=aaux.getUuid()%>'">S�</button>
								</div>
							</div>
						</div>
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
