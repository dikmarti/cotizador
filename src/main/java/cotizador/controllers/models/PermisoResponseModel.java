package cotizador.controllers.models;

import java.io.Serializable;

public class PermisoResponseModel implements Serializable{

	private static final long serialVersionUID = 6074337017557762045L;

	private int id;

	private String nombre;
	
	private String fecha;
	

	public int getId() {
		return id;
	}

	public void setid(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	@Override
	public String toString() {
		return "PermisoResponseModel [id=" + id + ", nombre=" + nombre + ", fecha=" + fecha + "]";
	}

}
