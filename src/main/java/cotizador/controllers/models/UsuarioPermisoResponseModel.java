package cotizador.controllers.models;

import java.io.Serializable;

public class UsuarioPermisoResponseModel implements Serializable{

	private static final long serialVersionUID = 6074337017557762045L;

	private int id;
	private String nombre;
	private String login;
	private String cargo;
	private String permisos;
	

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

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getCargo() {
		return cargo;
	}

	public void setCargo(String cargo) {
		this.cargo = cargo;
	}

	public String getPermisos() {
		return permisos;
	}

	public void setPermisos(String permisos) {
		this.permisos = permisos;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "UsuarioPermisoResponseModel [id=" + id + ", nombre=" + nombre + ", login=" + login + ", cargo=" + cargo
				+ ", permisos=" + permisos + "]";
	}


}
