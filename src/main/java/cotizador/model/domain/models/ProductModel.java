package cotizador.model.domain.models;

import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect(setterVisibility = JsonAutoDetect.Visibility.ANY,
		getterVisibility = JsonAutoDetect.Visibility.ANY, 
		isGetterVisibility = JsonAutoDetect.Visibility.ANY,
		fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class ProductModel {
	
	public Integer id;
	public String idMcb;
	public Integer numParteFabricante;
	public String nombre;
	public Double porcentajeResguardo;
	public String observacion;
	public Integer unidadMedida;
	public int sistema;
	public int sistemaAnterior;
	public int marca;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getIdMcb() {
		return idMcb;
	}
	public void setIdMco(String idMcb) {
		this.idMcb = idMcb;
	}

	public String getNombre() {
		return nombre;
	}
	public Integer getNumParteFabricante() {
		return numParteFabricante;
	}
	public void setNumParteFabricante(Integer numParteFabricante) {
		this.numParteFabricante = numParteFabricante;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public Double getPorcentajeResguardo() {
		return porcentajeResguardo;
	}
	public void setPorcentajeResguardo(Double porcentajeResguardo) {
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
	public Integer getMarca() {
		return marca;
	}
	public void setMarca(Integer marca) {
		this.marca = marca;
	}
	
	public Integer getSistemaAnterior() {
		return sistemaAnterior;
	}
	public void setSistemaAnterior(Integer sistemaAnterior) {
		this.sistemaAnterior = sistemaAnterior;
	}
	@Override
	public String toString() {
		return "ProductModel [id=" + id + ", idMcb=" + idMcb + ", numParteFabricante=" + numParteFabricante
				+ ", nombre=" + nombre + ", porcentajeResguardo=" + porcentajeResguardo
				+ ", observacion=" + observacion + ", unidadMedida=" + unidadMedida + ", sistema=" + sistema
				+ ", sistemaAnterior=" + sistemaAnterior + ", marca=" + marca + "]";
	}
}
