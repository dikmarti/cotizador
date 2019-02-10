package cotizador.model.domain.models;

import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect(setterVisibility = JsonAutoDetect.Visibility.ANY,
		getterVisibility = JsonAutoDetect.Visibility.ANY, 
		isGetterVisibility = JsonAutoDetect.Visibility.ANY,
		fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class PriceListModel {
	
	public Integer id;
	public Integer producto;
	public Integer proveedor;
	public String precioMinimo;
	public String precioMaximo;
	public String precioPromedio;
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	
	public Integer getProducto() {
		return producto;
	}
	
	public void setProducto(Integer producto) {
		this.producto = producto;
	}
	
	public Integer getProveedor() {
		return proveedor;
	}
	
	public void setProveedor(Integer proveedor) {
		this.proveedor = proveedor;
	}
	
	public String getPrecioMinimo() {
		return precioMinimo;
	}
	
	public void setPrecioMinimo(String precioMinimo) {
		this.precioMinimo = precioMinimo;
	}
	
	public String getPrecioMaximo() {
		return precioMaximo;
	}
	
	public void setPrecioMaximo(String precioMaximo) {
		this.precioMaximo = precioMaximo;
	}
	
	public String getPrecioPromedio() {
		return precioPromedio;
	}
	
	public void setPrecioPromedio(String precioPromedio) {
		this.precioPromedio = precioPromedio;
	}
	
	@Override
	public String toString() {
		return "PriceListModel [id=" + id + ", producto=" + producto + ", proveedor=" + proveedor + ", precioMinimo="
				+ precioMinimo + ", precioMaximo=" + precioMaximo + ", precioPromedio=" + precioPromedio + "]";
	}

}
