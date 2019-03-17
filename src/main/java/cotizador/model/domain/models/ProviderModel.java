package cotizador.model.domain.models;

import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect(setterVisibility = JsonAutoDetect.Visibility.ANY,
		getterVisibility = JsonAutoDetect.Visibility.ANY, 
		isGetterVisibility = JsonAutoDetect.Visibility.ANY,
		fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class ProviderModel {
	
	public String codigo;
	public String nombre;
	public String direccion;
	public String codigoAnterior;
	public Integer id;
	private String nombreContacto1;
	private String correoContacto1;
	private String telefonoContacto1;
	private String nombreContacto2;
	private String correoContacto2;
	private String telefonoContacto2;
	private String nombreContacto3;
	private String correoContacto3;
	private String telefonoContacto3;
	
	public String getCodigo() {
		return codigo;
	}
	
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public String getDireccion() {
		return direccion;
	}
	
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	
	public String getCodigoAnterior() {
		return codigoAnterior;
	}

	public void setCodigoAnterior(String codigoAnterior) {
		this.codigoAnterior = codigoAnterior;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}	

	public String getNombreContacto1() {
		return nombreContacto1;
	}

	public void setNombreContacto1(String nombreContacto1) {
		this.nombreContacto1 = nombreContacto1;
	}

	public String getCorreoContacto1() {
		return correoContacto1;
	}

	public void setCorreoContacto1(String correoContacto1) {
		this.correoContacto1 = correoContacto1;
	}

	public String getTelefonoContacto1() {
		return telefonoContacto1;
	}

	public void setTelefonoContacto1(String telefonoContacto1) {
		this.telefonoContacto1 = telefonoContacto1;
	}

	public String getNombreContacto2() {
		return nombreContacto2;
	}

	public void setNombreContacto2(String nombreContacto2) {
		this.nombreContacto2 = nombreContacto2;
	}

	public String getCorreoContacto2() {
		return correoContacto2;
	}

	public void setCorreoContacto2(String correoContacto2) {
		this.correoContacto2 = correoContacto2;
	}

	public String getTelefonoContacto2() {
		return telefonoContacto2;
	}

	public void setTelefonoContacto2(String telefonoContacto2) {
		this.telefonoContacto2 = telefonoContacto2;
	}

	public String getNombreContacto3() {
		return nombreContacto3;
	}

	public void setNombreContacto3(String nombreContacto3) {
		this.nombreContacto3 = nombreContacto3;
	}

	public String getCorreoContacto3() {
		return correoContacto3;
	}

	public void setCorreoContacto3(String correoContacto3) {
		this.correoContacto3 = correoContacto3;
	}

	public String getTelefonoContacto3() {
		return telefonoContacto3;
	}

	public void setTelefonoContacto3(String telefonoContacto3) {
		this.telefonoContacto3 = telefonoContacto3;
	}

	@Override
	public String toString() {
		return "ProviderModel [codigo=" + codigo + ", nombre=" + nombre + ", direccion=" + direccion
				+ ", codigoAnterior=" + codigoAnterior + ", id=" + id + "]";
	}

}
