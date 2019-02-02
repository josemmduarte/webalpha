package es.cj.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import es.cj.bean.Conexion;
import es.cj.bean.Libro;
import es.cj.bean.Usuario;

public class LibroDAOImpl implements LibroDAO {

	public List<Libro> listar(Conexion c, Usuario u) {
		List<Libro> libros = new ArrayList<Libro>();
		
		String sql = "SELECT * FROM libros WHERE idUsuario = ?";
		try {
			PreparedStatement sentencia = c.getConector().prepareStatement(sql);
			sentencia.setInt(1, u.getIdUsuario());
			ResultSet resultado = sentencia.executeQuery();
			while (resultado.next()) {
				Libro auxiliar = new Libro(
						resultado.getInt("idLibro"), 
						resultado.getString("titulo"), 
						resultado.getString("autor"), 
						resultado.getInt("isbn"), 
						resultado.getBytes("portada"), 
						resultado.getString("uuid"), 
						resultado.getInt("idUsuario"));
				libros.add(auxiliar);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return libros;
	}

	public byte[] obtenerPortada(Conexion c, int idLibro) {
		byte[] imagen = null;
		
		String sql = "SELECT portada FROM libros WHERE idLibro = ?";
		try {
			PreparedStatement sentencia = c.getConector().prepareStatement(sql);
			sentencia.setInt(1, idLibro);
			ResultSet resultado = sentencia.executeQuery();
			while (resultado.next()) {
				imagen = resultado.getBytes("portada");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return imagen;
	}

}
