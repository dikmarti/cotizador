package cotizador.model.domain.models;

import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect(setterVisibility = JsonAutoDetect.Visibility.ANY,
		getterVisibility = JsonAutoDetect.Visibility.ANY, 
		isGetterVisibility = JsonAutoDetect.Visibility.ANY,
		fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class PriceListResponseModel {
	
	public int id;
	public String producto;
	public String proveedor;
	public String precioMinimo;
	public String precioMaximo;
	public String precioPromedio;
	public String fechaInicio;
	public String fechaFin;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public String getProducto() {
		return producto;
	}

	public void setProducto(String producto) {
		this.producto = producto;
	}

	public String getProveedor() {
		return proveedor;
	}

	public void setProveedor(String proveedor) {
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

	public String getFechaInicio() {
		return fechaInicio;
	}

	public void setFechaInicio(String fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public String getFechaFin() {
		return fechaFin;
	}

	public void setFechaFin(String fechaFin) {
		this.fechaFin = fechaFin;
	}

	@Override
	public String toString() {
		return "PriceListResponseModel [id=" + id + ", producto=" + producto + ", proveedor=" + proveedor
				+ ", precioMinimo=" + precioMinimo + ", precioMaximo=" + precioMaximo + ", precioPromedio="
				+ precioPromedio + ", fechaInicio=" + fechaInicio + ", fechaFin=" + fechaFin + "]";
	}
	
}
