package cotizador.model.domain.helpers;

import java.util.List;

import cotizador.model.domain.Producto;

public class ProductConfiguration {
	
	public Producto producto;
	public List<BloqueConfiguration> bloques;
	public Double precioTotalProducto;
			
	public List<BloqueConfiguration> getBloques() {
		return bloques;
	}
	public void setBloques(List<BloqueConfiguration> bloques) {
		this.bloques = bloques;
	}
	public Double getPrecioTotalProducto() {
		return precioTotalProducto;
	}
	public void setPrecioTotalProducto(Double precioTotalProducto) {
		this.precioTotalProducto = precioTotalProducto;
	}
	public Producto getProducto() {
		return producto;
	}
	public void setProducto(Producto producto) {
		this.producto = producto;
	}

}
