package es.cj.controller;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

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
import es.cj.dao.ActorDAO;
import es.cj.dao.ActorDAOImpl;


/**
 * Servlet implementation class AnadirLibro
 */
@MultipartConfig
public class AnadirActor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AnadirActor() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nombre = request.getParameter("nombre");
		String papel = request.getParameter("papel");
		String uuid = UUID.randomUUID().toString();
			
		int idPelicula = Integer.parseInt(request.getParameter("idPelicula"));
		
		// Portada
		Part filePart = request.getPart("foto");

		InputStream inputS = null;
		ByteArrayOutputStream os = null;
		if (!getFileName(filePart).equals("")) {
			inputS = filePart.getInputStream();

			// Escalar la imagen
			BufferedImage imageBuffer = ImageIO.read(inputS);
			Image tmp = imageBuffer.getScaledInstance(200, 297, BufferedImage.SCALE_FAST);
			BufferedImage buffered = new BufferedImage(200, 297, BufferedImage.TYPE_INT_RGB);
			buffered.getGraphics().drawImage(tmp, 0, 0, null);

			os = new ByteArrayOutputStream();
			ImageIO.write(buffered, "jpg", os);
		}

		Actor act = new Actor(nombre, papel, os.toByteArray(), idPelicula, uuid);
		
		ActorDAO aDAO = new ActorDAOImpl();
		
		ServletContext sc = getServletContext();
		String usu = sc.getInitParameter("usuario");
		String pass = sc.getInitParameter("password");
		String driver = sc.getInitParameter("driver");
		String bd = sc.getInitParameter("database");
		Conexion con = new Conexion(usu, pass, driver, bd);
		
		aDAO.insertar(con, act);
		
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
