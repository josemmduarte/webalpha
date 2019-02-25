package es.cj.dao;

import java.util.List;

import es.cj.bean.Conexion;
import es.cj.bean.Libro;
import es.cj.bean.Usuario;

public interface LibroDAO {

	List<Libro> listar(Conexion c, Usuario u);
	
	byte [] obtenerPortada(Conexion c, int idManga);
	
	void borrar(Conexion c, String uuid);

	void insertar(Conexion con, Libro lib);
	
	Libro obtenerLibroPorUUID(Conexion con, String uuid);

	void actualizar(Conexion con, Libro lib);
}
