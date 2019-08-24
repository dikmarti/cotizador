package cotizador.model.domain.models;

import java.util.List;

import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import cotizador.model.domain.Precio;
import cotizador.model.domain.RelacionProducto;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect(setterVisibility = JsonAutoDetect.Visibility.ANY,
		getterVisibility = JsonAutoDetect.Visibility.ANY, 
		isGetterVisibility = JsonAutoDetect.Visibility.ANY,
		fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class RelationProductsModel {
	
	private List<RelacionProducto> relacionProducto;
	private List<List<Precio>> precioProductoRelacion;
	
	
	public List<RelacionProducto> getRelacionProducto() {
		return relacionProducto;
	}
	public void setRelacionProducto(List<RelacionProducto> relacionProducto) {
		this.relacionProducto = relacionProducto;
	}
	public List<List<Precio>> getPrecioProductoRelacion() {
		return precioProductoRelacion;
	}
	public void setPrecioProductoRelacion(List<List<Precio>> precioProductoRelacion) {
		this.precioProductoRelacion = precioProductoRelacion;
	}
	
}
