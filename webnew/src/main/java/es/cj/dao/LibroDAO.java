package es.cj.dao;

import java.util.List;

import es.cj.bean.Conexion;
import es.cj.bean.Pelicula;
import es.cj.bean.Usuario;

public interface LibroDAO {

	List<Pelicula> listar(Conexion c, Usuario u);
	
	byte [] obtenerPortada(Conexion c, int idPelicula);
	
	void borrar(Conexion c, String uuid);

	void insertar(Conexion con, Pelicula lib);
	
	Pelicula obtenerLibroPorUUID(Conexion con, String uuid);

	void actualizar(Conexion con, Pelicula lib);
}
