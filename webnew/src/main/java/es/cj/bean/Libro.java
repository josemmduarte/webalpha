package es.cj.bean;

import java.io.Serializable;

public class Libro implements Serializable {

	private int idManga;
	private String titulo;
	private String autor;
	private int isbn;
	private byte[] portada;
	private String uuid;
	private int idUsuario;
	
	public Libro() {
		// TODO Auto-generated constructor stub
	}
	
	public Libro(String titulo, String autor, int isbn, byte[] portada, String uuid, int idUsuario) {
		super();
		this.titulo = titulo;
		this.autor = autor;
		this.isbn = isbn;
		this.portada = portada;
		this.uuid = uuid;
		this.idUsuario = idUsuario;
	}

	public Libro(int idManga, String titulo, String autor, int isbn, byte[] portada, String uuid, int idUsuario) {
		super();
		this.idManga = idManga;
		this.titulo = titulo;
		this.autor = autor;
		this.isbn = isbn;
		this.portada = portada;
		this.uuid = uuid;
		this.idUsuario = idUsuario;
	}

	public int getidManga() {
		return idManga;
	}

	public void setidManga(int idManga) {
		this.idManga = idManga;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}

	public int getIsbn() {
		return isbn;
	}

	public void setIsbn(int isbn) {
		this.isbn = isbn;
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
		return "Libro [idManga=" + idManga + ", titulo=" + titulo + ", autor=" + autor + ", isbn=" + isbn + ", uuid="
				+ uuid + ", idUsuario=" + idUsuario + "]";
	}
	 
}
