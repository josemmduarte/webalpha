package es.cj.dao;

import java.util.List;

import es.cj.bean.Actor;
import es.cj.bean.Conexion;

public interface ActorDAO {
	
	List<Actor> listar(Conexion c, int idPelicula);
	// List<Actor> listar(Conexion c, Pelicula p);
	
	byte [] obtenerFoto(Conexion c, int idActores);
}
