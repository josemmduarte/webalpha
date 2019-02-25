package es.cj.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import es.cj.bean.Conexion;
import es.cj.bean.Usuario;

public class UsuarioDAOImpl implements UsuarioDAO {

	private String passBD = "LibrosCJ2019";
	
	public Usuario comprobarUsuario(String login, String password, Conexion c) {
		Usuario u = null;
		
		String query = "SELECT * FROM usuarios WHERE login = ? AND password = AES_ENCRYPT(?, ?)";
		try {
			PreparedStatement sentencia = c.getConector().prepareStatement(query);
			sentencia.setString(1, login);
			sentencia.setString(2, password);
			sentencia.setString(3, passBD);
			// Ejecutamos la consulta
			ResultSet resultado = sentencia.executeQuery();
			if (resultado.next()) {
				u = new Usuario(resultado.getInt("idUsuario"), 
						resultado.getString("login"), 
						resultado.getString("password"), 
						resultado.getString("nombre"), 
						resultado.getString("email"), 
						resultado.getInt("tipo"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return u;
	}

	public boolean existeLogin(String login, Conexion c) {
		boolean existe = false;
		
		String sql = "SELECT * FROM usuarios WHERE login = ?";
		try {
			PreparedStatement sentencia = c.getConector().prepareStatement(sql);
			sentencia.setString(1, login);
			ResultSet resultado = sentencia.executeQuery();
			if (resultado.next()) {
				existe = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return existe;
	}

	public boolean existeEmail(String email, Conexion c) {
boolean existe = false;
		
		String sql = "SELECT * FROM usuarios WHERE email = ?";
		try {
			PreparedStatement sentencia = c.getConector().prepareStatement(sql);
			sentencia.setString(1, email);
			ResultSet resultado = sentencia.executeQuery();
			if (resultado.next()) {
				existe = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return existe;
	}

	public int insertar(Usuario usuario, Conexion con) {
		int filas = 0;
		
		String sql = "INSERT INTO usuarios VALUES (null, ?, AES_ENCRYPT(?, ?), ?, ?, ?)";
		try {
			PreparedStatement sentencia = con.getConector().prepareStatement(sql);
			sentencia.setString(1, usuario.getLogin());
			sentencia.setString(2, usuario.getPassword());
			sentencia.setString(3, passBD);
			sentencia.setString(4, usuario.getNombre());
			sentencia.setString(5, usuario.getEmail());
			sentencia.setInt(6, usuario.getTipo());
			filas = sentencia.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return filas;
	}



}