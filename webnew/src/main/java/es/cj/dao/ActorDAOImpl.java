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
						resultado.getInt("idPelicula"));
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
}

