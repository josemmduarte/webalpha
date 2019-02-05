package es.cj.dao;

import java.util.List;

import es.cj.bean.Conexion;
import es.cj.bean.Libro;
import es.cj.bean.Usuario;

public interface LibroDAO {

	List<Libro> listar(Conexion c, Usuario u);
	
	byte [] obtenerPortada(Conexion c, int idLibro);
	
	void borrar(Conexion c, String uuid);
}
