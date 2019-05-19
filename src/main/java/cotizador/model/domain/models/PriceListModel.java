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
	public String precio1;
	public String precio2;
	public String precio3;
	public String precio4;
	public String precio5;
	public String precio6;
	public String precio7;
	public String precio8;
	public String precio9;
	public String precio10;
	public String precio11;
	public String precioMinimo;
	public String precioMaximo;
	public String precioPromedio;
	
	public String getPrecio1() {
		return precio1;
	}

	public void setPrecio1(String precio1) {
		this.precio1 = precio1;
	}

	public String getPrecio2() {
		return precio2;
	}

	public void setPrecio2(String precio2) {
		this.precio2 = precio2;
	}

	public String getPrecio3() {
		return precio3;
	}

	public void setPrecio3(String precio3) {
		this.precio3 = precio3;
	}

	public String getPrecio4() {
		return precio4;
	}

	public void setPrecio4(String precio4) {
		this.precio4 = precio4;
	}

	public String getPrecio5() {
		return precio5;
	}

	public void setPrecio5(String precio5) {
		this.precio5 = precio5;
	}

	public String getPrecio6() {
		return precio6;
	}

	public void setPrecio6(String precio6) {
		this.precio6 = precio6;
	}

	public String getPrecio7() {
		return precio7;
	}

	public void setPrecio7(String precio7) {
		this.precio7 = precio7;
	}

	public String getPrecio8() {
		return precio8;
	}

	public void setPrecio8(String precio8) {
		this.precio8 = precio8;
	}

	public String getPrecio9() {
		return precio9;
	}

	public void setPrecio9(String precio9) {
		this.precio9 = precio9;
	}

	public String getPrecio10() {
		return precio10;
	}

	public void setPrecio10(String precio10) {
		this.precio10 = precio10;
	}

	public String getPrecio11() {
		return precio11;
	}

	public void setPrecio11(String precio11) {
		this.precio11 = precio11;
	}
	
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
