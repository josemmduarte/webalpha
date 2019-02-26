<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

<title>PlanetDeviluke</title>
</head>
<body background="imagenes/corn.png">
		<div class="row justify-content-center" style="padding-top: 100px;">
			<img src="imagenes/generatedtext.png">
		</div>
		<br>
	<div class="container" Style="background-color: #9F81F7;
	height: 340px; width: 400px; border-radius: 55px; padding-top: 50px;">
		
		

		<div class="row justify-content-center">
			<form role="form" method="post" action="ValidarUsuario">
				<div class="form-group">
					<label for="usuario"><img src="imagenes/usuario2.png"></label> <input type="text"
						class="form-control" id="usuario" name="usuario"
						aria-describedby="usuarioHelp" autofocus required="required">
				</div>
				<div class="form-group">
					<label for="password"><img src="imagenes/password2.png"></label> <input type="password"
						class="form-control" id="password" name="password"
						required="required">
				</div>
				<button type="submit" class="btn btn-primary"><i class="fas fa-share-square"></i> Enviar</button>
				<button type="button" class="btn btn-secondary" onclick="location.href='jsp/registrar.jsp'"><i class="fas fa-user-plus"></i> Registrar</button>
			</form>

		</div>
	</div>
	
	<br>
	
	<div class="row justify-content-center">
			<%
				String error = request.getParameter("mensaje");
				if (error != null) {
			%>
			<div class="alert alert-warning alert-dismissible fade show"
				role="alert">
				<%
					out.print(error);
				%>
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<%
				}
			%>
		</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="js/jquery-3.3.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>