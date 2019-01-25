package cotizador.controllers.models;

import java.io.Serializable;

public class ModuloResponseModel implements Serializable{

	private static final long serialVersionUID = 6074337017557762045L;

	private int tipoModulo;

	private String nombre;
	
	private String descripcion;
	
	private String url;
	
	private int id;
	
	private int orden;

	public int getTipoModulo() {
		return tipoModulo;
	}

	public void setTipoModulo(int tipoModulo) {
		this.tipoModulo = tipoModulo;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public int getOrden() {
		return orden;
	}

	public void setOrden(int orden) {
		this.orden = orden;
	}

	@Override
	public String toString() {
		return "ModuloResponseModel [tipoModulo=" + tipoModulo + ", nombre=" + nombre + ", descripcion=" + descripcion
				+ ", url=" + url + ", id=" + id + ", orden=" + orden + "]";
	}
	
}
