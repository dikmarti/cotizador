package cotizador.model.domain.helpers;

import java.util.List;

import cotizador.model.domain.Bloque;

public class BloqueConfiguration {

	public Bloque bloque;
	public List<NivelConfiguration> niveles;
	
	public Bloque getBloque() {
		return bloque;
	}
	public void setBloque(Bloque bloque) {
		this.bloque = bloque;
	}
	public List<NivelConfiguration> getNiveles() {
		return niveles;
	}
	public void setNiveles(List<NivelConfiguration> niveles) {
		this.niveles = niveles;
	}
	
}
