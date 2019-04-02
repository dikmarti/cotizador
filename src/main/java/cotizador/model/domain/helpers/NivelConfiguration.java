package cotizador.model.domain.helpers;

import cotizador.model.domain.Nivel;

public class NivelConfiguration {

	public Nivel nivel;
	public Double precioTotalNivel;
	
	public Nivel getNivel() {
		return nivel;
	}
	public void setNivel(Nivel nivel) {
		this.nivel = nivel;
	}
	public Double getPrecioTotalNivel() {
		return precioTotalNivel;
	}
	public void setPrecioTotalNivel(Double precioTotalNivel) {
		this.precioTotalNivel = precioTotalNivel;
	}
	
}
