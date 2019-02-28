<%@page import="java.io.OutputStream"%><%@page import="es.cj.bean.Conexion"%><%@page import="es.cj.dao.ActorDAOImpl"%><%@page import="es.cj.dao.ActorDAO"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%><%try{
	ServletContext sc = getServletContext();
	String usu = sc.getInitParameter("usuario");
	String pass = sc.getInitParameter("password");
	String driver = sc.getInitParameter("driver");
	String bd = sc.getInitParameter("database");
	Conexion con = new Conexion(usu, pass, driver, bd);
	String idActores = request.getParameter("idActores");
	ActorDAO aDAO = new ActorDAOImpl();
	byte[] imagen = aDAO.obtenerFoto(con, Integer.parseInt(idActores));
	try {
		if (imagen != null) {
			response.setContentType("image/jpeg");
			response.setHeader("Content-Disposition", "attachment");
			OutputStream o = response.getOutputStream();
			o.write(imagen);
			o.flush();
			o.close();
			return;
		}
	} catch (IllegalStateException e) {
	}
} catch (Exception e) {	
}
%>