package cotizador.model.domain.models;

import org.codehaus.jackson.annotate.JsonAutoDetect;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import cotizador.model.domain.shape.Shape;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect(setterVisibility = JsonAutoDetect.Visibility.ANY,
		getterVisibility = JsonAutoDetect.Visibility.ANY, 
		isGetterVisibility = JsonAutoDetect.Visibility.ANY,
		fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class UserModel {
	
	public String nombre;
	public int tipoUsuario;
	public String login;
	public String clave;
	public String direccion;
	public String telefono;
	public String email;
	public String cargo;
	public String loginAnterior;
	
	public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public int getTipoUsuario() {
		return tipoUsuario;
	}
	
	public void setTipoUsuario(int tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}
	
	public String getLogin() {
		return login;
	}
	
	public void setLogin(String login) {
		this.login = login;
	}
	
	public String getClave() {
		return clave;
	}
	
	public void setClave(String clave) {
		this.clave = clave;
	}
	
	public String getDireccion() {
		return direccion;
	}
	
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	
	public String getTelefono() {
		return telefono;
	}
	
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getCargo() {
		return cargo;
	}
	
	public void setCargo(String cargo) {
		this.cargo = cargo;
	}

	public String getLoginAnterior() {
		return loginAnterior;
	}

	public void setLoginAnterior(String loginAnterior) {
		this.loginAnterior = loginAnterior;
	}

	@Override
	public String toString() {
		return "UserModel [nombre=" + nombre + ", tipoUsuario=" + tipoUsuario + ", login=" + login + ", clave=" + clave
				+ ", direccion=" + direccion + ", telefono=" + telefono + ", email=" + email + ", cargo=" + cargo
				+ ", loginAnterior=" + loginAnterior + "]";
	}

}
