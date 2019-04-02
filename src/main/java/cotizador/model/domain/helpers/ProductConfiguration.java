package cotizador.model.domain.helpers;

import java.util.List;

import cotizador.model.domain.Producto;

public class ProductConfiguration {
	
	public Producto producto;
	public List<NivelConfiguration> niveles;
	public Double precioTotalProducto;
	
	public List<NivelConfiguration> getNiveles() {
		return niveles;
	}
	public void setNiveles(List<NivelConfiguration> niveles) {
		this.niveles = niveles;
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
