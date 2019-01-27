package cotizador.model.domain.models;

import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import cotizador.model.domain.Sistema;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect(setterVisibility = JsonAutoDetect.Visibility.ANY,
		getterVisibility = JsonAutoDetect.Visibility.ANY, 
		isGetterVisibility = JsonAutoDetect.Visibility.ANY,
		fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class ProductModel {
	
	public Integer id;
	public Integer idMco;
	public Integer idFabricante;
	public String codigo;
	public String nombre;
	public String nombreCorto;
	public String descripcion;
	public Integer porcentajeResguardo;
	public String observacion;
	public Integer unidadMedida;
	public int sistema;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getIdMco() {
		return idMco;
	}
	public void setIdMco(Integer idMco) {
		this.idMco = idMco;
	}
	public Integer getIdFabricante() {
		return idFabricante;
	}
	public void setIdFabricante(Integer idFabricante) {
		this.idFabricante = idFabricante;
	}
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
	public String getNombreCorto() {
		return nombreCorto;
	}
	public void setNombreCorto(String nombreCorto) {
		this.nombreCorto = nombreCorto;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Integer getPorcentajeResguardo() {
		return porcentajeResguardo;
	}
	public void setPorcentajeResguardo(Integer porcentajeResguardo) {
		this.porcentajeResguardo = porcentajeResguardo;
	}
	public String getObservacion() {
		return observacion;
	}
	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}
	public Integer getUnidadMedida() {
		return unidadMedida;
	}
	public void setUnidadMedida(Integer unidadMedida) {
		this.unidadMedida = unidadMedida;
	}
	public Integer getSistema() {
		return sistema;
	}
	public void setSistema(Integer sistema) {
		this.sistema = sistema;
	}
	@Override
	public String toString() {
		return "ProductModel [id=" + id + ", idMco=" + idMco + ", idFabricante=" + idFabricante + ", codigo=" + codigo
				+ ", nombre=" + nombre + ", nombreCorto=" + nombreCorto + ", descripcion=" + descripcion
				+ ", porcentajeResguardo=" + porcentajeResguardo + ", observacion=" + observacion + ", unidadMedida="
				+ unidadMedida + ", sistema=" + sistema + "]";
	}
	
}
