package es.cj.dao;

import java.util.List;

import es.cj.bean.Actor;
import es.cj.bean.Conexion;
import es.cj.bean.Libro;

public interface ActorDAO {
	
	List<Actor> listar(Conexion c, Libro p);

}
