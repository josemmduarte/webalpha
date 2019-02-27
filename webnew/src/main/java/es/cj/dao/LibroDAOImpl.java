package es.cj.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import es.cj.bean.Conexion;
import es.cj.bean.Pelicula;
import es.cj.bean.Usuario;

public class LibroDAOImpl implements LibroDAO {

	public List<Pelicula> listar(Conexion c, Usuario u) {
		List<Pelicula> peliculas = new ArrayList<Pelicula>();
		
		String sql = "SELECT * FROM peliculas WHERE idUsuario = ?";
		try {
			PreparedStatement sentencia = c.getConector().prepareStatement(sql);
			sentencia.setInt(1, u.getIdUsuario());
			ResultSet resultado = sentencia.executeQuery();
			while (resultado.next()) {
				Pelicula auxiliar = new Pelicula(
						resultado.getInt("idPelicula"), 
						resultado.getString("titulo"), 
						resultado.getString("director"), 
						resultado.getInt("anyo"), 
						resultado.getBytes("portada"), 
						resultado.getString("uuid"), 
						resultado.getInt("idUsuario"),
						resultado.getString("sinopsis"));
				peliculas.add(auxiliar);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return peliculas;
	}

	public byte[] obtenerPortada(Conexion c, int idPelicula) {
		byte[] imagen = null;
		
		String sql = "SELECT portada FROM peliculas WHERE idPelicula = ?";
		try {
			PreparedStatement sentencia = c.getConector().prepareStatement(sql);
			sentencia.setInt(1, idPelicula);
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

	public void borrar(Conexion c, String uuid) {
		String sql = "DELETE FROM peliculas WHERE uuid = ?";
		try {
			PreparedStatement sentencia = c.getConector().prepareStatement(sql);
			sentencia.setString(1, uuid);
			sentencia.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void insertar(Conexion con, Pelicula lib) {
		String sql = "INSERT INTO peliculas VALUES (null, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement sentencia = con.getConector().prepareStatement(sql);
			sentencia.setString(1, lib.getTitulo());
			sentencia.setString(2, lib.getdirector());
			sentencia.setInt(3, lib.getanyo());
			sentencia.setBytes(4, lib.getPortada());
			sentencia.setInt(5, lib.getIdUsuario());
			sentencia.setString(6, lib.getUuid());
			sentencia.setString(7, lib.getSinopsis());
			
			sentencia.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public Pelicula obtenerLibroPorUUID(Conexion con, String uuid) {
		Pelicula laux = new Pelicula();
		
		String sql = "SELECT * FROM peliculas WHERE uuid = ?";
		try {
			PreparedStatement sentencia = con.getConector().prepareStatement(sql);
			sentencia.setString(1, uuid);
			ResultSet resultado = sentencia.executeQuery();
			while (resultado.next()) {
				laux = new Pelicula(
						resultado.getInt("idPelicula"), 
						resultado.getString("titulo"), 
						resultado.getString("director"), 
						resultado.getInt("anyo"), 
						resultado.getBytes("portada"), 
						resultado.getString("uuid"), 
						resultado.getInt("idUsuario"),
						resultado.getString("sinopsis"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return laux;
	}

	public void actualizar(Conexion con, Pelicula lib) {
		try {
			if (lib.getPortada() != null) {
				String sql = "UPDATE peliculas SET titulo=?, director=?, anyo=?, portada=?, sinopsis=? WHERE uuid=?";
				PreparedStatement sentencia = con.getConector().prepareStatement(sql);
				sentencia.setString(1, lib.getTitulo());
				sentencia.setString(2, lib.getdirector());
				sentencia.setInt(3, lib.getanyo());
				sentencia.setBytes(4, lib.getPortada());
				sentencia.setString(5, lib.getSinopsis());
				sentencia.setString(6, lib.getUuid());
				sentencia.executeUpdate();
			} else {
				String sql = "UPDATE peliculas SET titulo=?, director=?, anyo=?, sinopsis=? WHERE uuid=?";
				PreparedStatement sentencia = con.getConector().prepareStatement(sql);
				sentencia.setString(1, lib.getTitulo());
				sentencia.setString(2, lib.getdirector());
				sentencia.setInt(3, lib.getanyo());
				sentencia.setString(4, lib.getSinopsis());
				sentencia.setString(5, lib.getUuid());
				sentencia.executeUpdate();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}