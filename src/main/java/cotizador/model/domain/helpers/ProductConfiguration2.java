package cotizador.model.domain.helpers;

public class ProductConfiguration2 {
	
	public String codigo;
	public String nombre;
	public int unidadMedida;
	public Integer cantidad;
	public Double precioUnitario;
	
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
	public int getUnidadMedida() {
		return unidadMedida;
	}
	public void setUnidadMedida(int unidadMedida) {
		this.unidadMedida = unidadMedida;
	}
	public Integer getCantidad() {
		return cantidad;
	}
	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}
	public Double getPrecioUnitario() {
		return precioUnitario;
	}
	public void setPrecioUnitario(Double precioUnitario) {
		this.precioUnitario = precioUnitario;
	}
	@Override
	public String toString() {
		return "ProductConfiguration2 [codigo=" + codigo + ", nombre=" + nombre + ", unidadMedida=" + unidadMedida
				+ ", cantidad=" + cantidad + ", precioUnitario=" + precioUnitario + "]";
	}
	
}
