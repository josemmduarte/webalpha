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
		List<Libro> mangas = new ArrayList<Libro>();
		
		String sql = "SELECT * FROM mangas WHERE idUsuario = ?";
		try {
			PreparedStatement sentencia = c.getConector().prepareStatement(sql);
			sentencia.setInt(1, u.getIdUsuario());
			ResultSet resultado = sentencia.executeQuery();
			while (resultado.next()) {
				Libro auxiliar = new Libro(
						resultado.getInt("idManga"), 
						resultado.getString("titulo"), 
						resultado.getString("autor"), 
						resultado.getInt("isbn"), 
						resultado.getBytes("portada"), 
						resultado.getString("uuid"), 
						resultado.getInt("idUsuario"));
				mangas.add(auxiliar);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mangas;
	}

	public byte[] obtenerPortada(Conexion c, int idManga) {
		byte[] imagen = null;
		
		String sql = "SELECT portada FROM mangas WHERE idManga = ?";
		try {
			PreparedStatement sentencia = c.getConector().prepareStatement(sql);
			sentencia.setInt(1, idManga);
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
		String sql = "DELETE FROM mangas WHERE uuid = ?";
		try {
			PreparedStatement sentencia = c.getConector().prepareStatement(sql);
			sentencia.setString(1, uuid);
			sentencia.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void insertar(Conexion con, Libro lib) {
		String sql = "INSERT INTO mangas VALUES (null, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement sentencia = con.getConector().prepareStatement(sql);
			sentencia.setString(1, lib.getTitulo());
			sentencia.setString(2, lib.getAutor());
			sentencia.setInt(3, lib.getIsbn());
			sentencia.setBytes(4, lib.getPortada());
			sentencia.setInt(5, lib.getIdUsuario());
			sentencia.setString(6, lib.getUuid());
			
			sentencia.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public Libro obtenerLibroPorUUID(Conexion con, String uuid) {
		Libro laux = new Libro();
		
		String sql = "SELECT * FROM mangas WHERE uuid = ?";
		try {
			PreparedStatement sentencia = con.getConector().prepareStatement(sql);
			sentencia.setString(1, uuid);
			ResultSet resultado = sentencia.executeQuery();
			while (resultado.next()) {
				laux = new Libro(
						resultado.getInt("idManga"), 
						resultado.getString("titulo"), 
						resultado.getString("autor"), 
						resultado.getInt("isbn"), 
						resultado.getBytes("portada"), 
						resultado.getString("uuid"), 
						resultado.getInt("idUsuario"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return laux;
	}

	public void actualizar(Conexion con, Libro lib) {
		try {
			if (lib.getPortada() != null) {
				String sql = "UPDATE mangas SET titulo=?, autor=?, isbn=?, portada=? WHERE uuid=?";
				PreparedStatement sentencia = con.getConector().prepareStatement(sql);
				sentencia.setString(1, lib.getTitulo());
				sentencia.setString(2, lib.getAutor());
				sentencia.setInt(3, lib.getIsbn());
				sentencia.setBytes(4, lib.getPortada());
				sentencia.setString(5, lib.getUuid());
				sentencia.executeUpdate();
			} else {
				String sql = "UPDATE mangas SET titulo=?, autor=?, isbn=? WHERE uuid=?";
				PreparedStatement sentencia = con.getConector().prepareStatement(sql);
				sentencia.setString(1, lib.getTitulo());
				sentencia.setString(2, lib.getAutor());
				sentencia.setInt(3, lib.getIsbn());
				sentencia.setString(4, lib.getUuid());
				sentencia.executeUpdate();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}