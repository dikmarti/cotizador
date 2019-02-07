package cotizador.model.domain.models;

import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect(setterVisibility = JsonAutoDetect.Visibility.ANY,
		getterVisibility = JsonAutoDetect.Visibility.ANY, 
		isGetterVisibility = JsonAutoDetect.Visibility.ANY,
		fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class RelationModel {
	
	public Integer id;
	public Integer sistema;
	public Integer producto;
	public Integer productoRelacion;
	public String factor;
	public Integer operacion;
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getSistema() {
		return sistema;
	}
	
	public void setSistema(Integer sistema) {
		this.sistema = sistema;
	}
	
	public Integer getProducto() {
		return producto;
	}
	
	public void setProducto(Integer producto) {
		this.producto = producto;
	}
	
	public Integer getProductoRelacion() {
		return productoRelacion;
	}
	
	public void setProductoRelacion(Integer productoRelacion) {
		this.productoRelacion = productoRelacion;
	}
	
	public String getFactor() {
		return factor;
	}
	
	public void setFactor(String factor) {
		this.factor = factor;
	}
	
	public Integer getOperacion() {
		return operacion;
	}
	
	public void setOperacion(Integer operacion) {
		this.operacion = operacion;
	}
	
	@Override
	public String toString() {
		return "RelationModel [id=" + id + ", sistema=" + sistema + ", producto=" + producto + ", productoRelacion="
				+ productoRelacion + ", factor=" + factor + ", operacion=" + operacion + "]";
	}
	
}
