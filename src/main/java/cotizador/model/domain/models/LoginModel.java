package cotizador.model.domain.models;

import org.codehaus.jackson.annotate.JsonAutoDetect;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import cotizador.model.domain.shape.Shape;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect(setterVisibility = JsonAutoDetect.Visibility.ANY,
		getterVisibility = JsonAutoDetect.Visibility.ANY, 
		isGetterVisibility = JsonAutoDetect.Visibility.ANY,
		fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class LoginModel {
	
	public String usuario;
	public String clave;
	
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}
	public String getClave() {
		return clave;
	}
	public void setClave(String clave) {
		this.clave = clave;
	}
	@Override
	public String toString() {
		return "LoginModel [usuario=" + usuario + ", clave=" + clave + "]";
	}

}
