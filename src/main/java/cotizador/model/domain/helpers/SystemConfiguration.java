package cotizador.model.domain.helpers;

import java.util.List;

public class SystemConfiguration {
	
	public Integer id;
	public String nombre;
	public List<ProductConfiguration2> productConfiguration;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public List<ProductConfiguration2> getProductConfiguration() {
		return productConfiguration;
	}
	public void setProductConfiguration(List<ProductConfiguration2> productConfiguration) {
		this.productConfiguration = productConfiguration;
	}
}
