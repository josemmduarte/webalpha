<%@page import="java.io.OutputStream"%><%@page import="es.cj.dao.LibroDAO"%><%@page import="es.cj.bean.Conexion"%><%@page import="es.cj.dao.LibroDAOImpl"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%><%try{
	ServletContext sc = getServletContext();
	String usu = sc.getInitParameter("usuario");
	String pass = sc.getInitParameter("password");
	String driver = sc.getInitParameter("driver");
	String bd = sc.getInitParameter("database");
	Conexion con = new Conexion(usu, pass, driver, bd);
	String idPelicula = request.getParameter("idPelicula");
	LibroDAO lDAO = new LibroDAOImpl();
	byte[] imagen = lDAO.obtenerPortada(con, Integer.parseInt(idPelicula));
	try {
		if (imagen != null) {
			response.setContentType("imagen/jpeg");
			response.setHeader("Content-Disposition", "attachment");
			OutputStream o = response.getOutputStream();
			o.write(imagen);
			o.flush();
			o.close();
			return;
		}
	} catch (IllegalStateException e){
	}
} catch (Exception e){	
}%>