package es.cj.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import es.cj.bean.Actor;
import es.cj.bean.Conexion;

public class ActorDAOImpl implements ActorDAO {
	List<Actor> actores = new ArrayList<Actor>();

	public List<Actor> listar(Conexion c, int idPelicula) {
		
		String sql = "SELECT * FROM actores WHERE idPelicula = ?";
		try {
			PreparedStatement sentencia = c.getConector().prepareStatement(sql);
			sentencia.setInt(1, idPelicula);
			ResultSet resultado = sentencia.executeQuery();
			while (resultado.next()) {
				Actor auxiliar = new Actor(
						resultado.getInt("idActores"), 
						resultado.getString("nombre"), 
						resultado.getString("papel"), 
						resultado.getBytes("foto"), 
						resultado.getInt("idPelicula"),
						resultado.getString("uuid"));
				actores.add(auxiliar);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return actores;
	}

	public byte[] obtenerFoto(Conexion c, int idActores) {
		byte[] imagen = null;
		
		String sql = "SELECT foto FROM actores WHERE idActores = ?";
		try {
			PreparedStatement sentencia = c.getConector().prepareStatement(sql);
			sentencia.setInt(1, idActores);
			ResultSet resultado = sentencia.executeQuery();
			while (resultado.next()) {
				imagen = resultado.getBytes("foto");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return imagen;
	}

	public Actor obtenerActorPoruuid(Conexion con, String uuid) {
		Actor aaux = new Actor();
		
		String sql = "SELECT * FROM actores WHERE uuid = ?";
		try {
			PreparedStatement sentencia = con.getConector().prepareStatement(sql);
			sentencia.setString(1, uuid);
			ResultSet resultado = sentencia.executeQuery();
			while (resultado.next()) {
				aaux = new Actor(
						resultado.getInt("idActores"), 
						resultado.getString("nombre"), 
						resultado.getString("papel"), 
						resultado.getBytes("foto"), 
						resultado.getInt("idPelicula"),
						resultado.getString("uuid"));
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return aaux;
	}

	public void borrar(Conexion c, String uuid) {
		String sql = "DELETE FROM actores WHERE uuid = ?";
		try {
			PreparedStatement sentencia = c.getConector().prepareStatement(sql);
			sentencia.setString(1, uuid);
			sentencia.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void insertar(Conexion con, Actor act) {
		String sql = "INSERT INTO actores VALUES (null, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement sentencia = con.getConector().prepareStatement(sql);
			sentencia.setString(1, act.getNombre());
			sentencia.setString(2, act.getpapel());
			sentencia.setBytes(3, act.getFoto());
			sentencia.setInt(4, act.getIdPelicula());
			sentencia.setString(5, act.getUuid());
			
			sentencia.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
}

