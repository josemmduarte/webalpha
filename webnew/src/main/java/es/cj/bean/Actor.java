package es.cj.bean;

import java.io.Serializable;

public class Actor implements Serializable {

	private int idActores;
	private String nombre;
	private String papel;
	private byte[] foto;
	private int idPelicula;
	private String uuid;
	
	public Actor() {
		// TODO Auto-generated constructor stub
	}

	public Actor(int idActores, String nombre, String papel, byte[] foto, int idPelicula, String uuid) {
		super();
		this.idActores = idActores;
		this.nombre = nombre;
		this.papel = papel;
		this.foto = foto;
		this.idPelicula = idPelicula;
		this.uuid = uuid;
	}
	
	public Actor(String nombre, String papel, byte[] foto, int idPelicula, String uuid) {
		super();
		this.nombre = nombre;
		this.papel = papel;
		this.foto = foto;
		this.idPelicula = idPelicula;
		this.uuid = uuid;
	}

	public int getIdActores() {
		return idActores;
	}

	public void setIdActores(int idActores) {
		this.idActores = idActores;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getpapel() {
		return papel;
	}

	public void setpapel(String papel) {
		papel = papel;
	}

	public byte[] getFoto() {
		return foto;
	}

	public void setFoto(byte[] foto) {
		this.foto = foto;
	}

	public int getIdPelicula() {
		return idPelicula;
	}

	public void setIdPelicula(int idPelicula) {
		this.idPelicula = idPelicula;
	}
	
	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	@Override
	public String toString() {
		return "Actor [idActores=" + idActores + ", nombre=" + nombre + ", papel=" + papel + ", idPelicula="
				+ idPelicula + ", uuid=" + uuid + "]";
	}

}
