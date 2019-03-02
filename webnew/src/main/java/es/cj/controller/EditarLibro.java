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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import es.cj.bean.Conexion;
import es.cj.bean.Pelicula;
import es.cj.bean.Usuario;
import es.cj.dao.LibroDAO;
import es.cj.dao.LibroDAOImpl;

/**
 * Servlet implementation class EditarLibro
 */
@MultipartConfig
public class EditarLibro extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarLibro() {
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
		String titulo = request.getParameter("titulo");
		String director = request.getParameter("director");
		String sinopsis = request.getParameter("sinopsis");
		int anyo = Integer.parseInt(request.getParameter("anyo"));
		String uuid = request.getParameter("uuid");

		HttpSession session = request.getSession();
		int idUsuario = ((Usuario) session.getAttribute("usuarioWeb")).getIdUsuario();

		// Portada
		Part filePart = request.getPart("portada");

		InputStream inputS = null;
		ByteArrayOutputStream os = null;

		Pelicula lib = null;

		if (!getFileName(filePart).equals("")) {
			inputS = filePart.getInputStream();

			// Escalar la imagen
			BufferedImage imageBuffer = ImageIO.read(inputS);
			Image tmp = imageBuffer.getScaledInstance(640, 640, BufferedImage.SCALE_FAST);
			BufferedImage buffered = new BufferedImage(640, 640, BufferedImage.TYPE_INT_RGB);
			buffered.getGraphics().drawImage(tmp, 0, 0, null);

			os = new ByteArrayOutputStream();
			ImageIO.write(buffered, "jpg", os);

			lib = new Pelicula(titulo, director, anyo, os.toByteArray(), uuid, idUsuario, sinopsis);
		} else {
			lib = new Pelicula(titulo, director, anyo, null, uuid, idUsuario, sinopsis);
		}

		LibroDAO lDAO = new LibroDAOImpl();

		// Conexión con la base de datos
		// Voy a capturar los datos del web.xml
		ServletContext sc = getServletContext();
		String usu = sc.getInitParameter("usuario");
		String pass = sc.getInitParameter("password");
		String driver = sc.getInitParameter("driver");
		String bd = sc.getInitParameter("database");

		// Crear un objeto de tipo Conexion con los datos anteriores
		Conexion con = new Conexion(usu, pass, driver, bd);

		lDAO.actualizar(con, lib);

		response.sendRedirect("jsp/detalle.jsp?uuid="+uuid);
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