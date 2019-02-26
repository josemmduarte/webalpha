package es.cj.bean;

import java.io.Serializable;

public class Libro implements Serializable {

	private int idPelicula;
	private String titulo;
	private String director;
	private int anyo;
	private byte[] portada;
	private String uuid;
	private int idUsuario;
	
	public Libro() {
		// TODO Auto-generated constructor stub
	}
	
	public Libro(String titulo, String director, int anyo, byte[] portada, String uuid, int idUsuario) {
		super();
		this.titulo = titulo;
		this.director = director;
		this.anyo = anyo;
		this.portada = portada;
		this.uuid = uuid;
		this.idUsuario = idUsuario;
	}

	public Libro(int idPelicula, String titulo, String director, int anyo, byte[] portada, String uuid, int idUsuario) {
		super();
		this.idPelicula = idPelicula;
		this.titulo = titulo;
		this.director = director;
		this.anyo = anyo;
		this.portada = portada;
		this.uuid = uuid;
		this.idUsuario = idUsuario;
	}

	public int getidPelicula() {
		return idPelicula;
	}

	public void setidPelicula(int idPelicula) {
		this.idPelicula = idPelicula;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getdirector() {
		return director;
	}

	public void setdirector(String director) {
		this.director = director;
	}

	public int getanyo() {
		return anyo;
	}

	public void setanyo(int anyo) {
		this.anyo = anyo;
	}

	public byte[] getPortada() {
		return portada;
	}

	public void setPortada(byte[] portada) {
		this.portada = portada;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	@Override
	public String toString() {
		return "Libro [idPelicula=" + idPelicula + ", titulo=" + titulo + ", director=" + director + ", anyo=" + anyo + ", uuid="
				+ uuid + ", idUsuario=" + idUsuario + "]";
	}
	 
}
