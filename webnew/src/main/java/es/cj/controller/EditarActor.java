package es.cj.controller;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import es.cj.bean.Actor;
import es.cj.bean.Conexion;
import es.cj.bean.Pelicula;
import es.cj.dao.ActorDAO;
import es.cj.dao.ActorDAOImpl;
import es.cj.dao.LibroDAO;
import es.cj.dao.LibroDAOImpl;

/**
 * Servlet implementation class EditarActor
 */
@MultipartConfig
public class EditarActor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarActor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nombre = request.getParameter("nombre");
		String papel = request.getParameter("papel");
		String uuid = request.getParameter("uuid");
		
			ServletContext sc = getServletContext();
			String usu = sc.getInitParameter("usuario");
			String pass = sc.getInitParameter("password");
			String driver = sc.getInitParameter("driver");
			String bd = sc.getInitParameter("database");
			// Crear un objeto de tipo Conexion con los datos anteriores
			Conexion con = new Conexion(usu, pass, driver, bd);
			//
			LibroDAO lDAO = new LibroDAOImpl();
			Pelicula laux = lDAO.obtenerLibroPorUUID(con, (String) request.getParameter("uuid"));
		
		int idPelicula = laux.getidPelicula();
		
		// Portada
		Part filePart = request.getPart("foto");

		InputStream inputS = null;
		ByteArrayOutputStream os = null;
		
		Actor act = null;
		
		if (!getFileName(filePart).equals("")) {
			inputS = filePart.getInputStream();

			// Escalar la imagen
			BufferedImage imageBuffer = ImageIO.read(inputS);
			Image tmp = imageBuffer.getScaledInstance(200, 297, BufferedImage.SCALE_FAST);
			BufferedImage buffered = new BufferedImage(200, 297, BufferedImage.TYPE_INT_RGB);
			buffered.getGraphics().drawImage(tmp, 0, 0, null);

			os = new ByteArrayOutputStream();
			ImageIO.write(buffered, "jpg", os);
			
			act = new Actor(nombre, papel, os.toByteArray(), idPelicula, uuid);
		} else {
			act = new Actor(nombre, papel, null, idPelicula, uuid);
		}

		ActorDAO aDAO = new ActorDAOImpl();
		
		aDAO.actualizar(con, act);
		
		response.sendRedirect("jsp/principalUsuario.jsp");
	}

	private String getFileName(Part filePart) {
		for (String content : filePart.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf("=") + 1).trim().replace("\"", "");
			}
		}
		return null;
	}

}
