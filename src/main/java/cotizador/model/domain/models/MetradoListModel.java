package cotizador.model.domain.models;

import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect(setterVisibility = JsonAutoDetect.Visibility.ANY,
		getterVisibility = JsonAutoDetect.Visibility.ANY, 
		isGetterVisibility = JsonAutoDetect.Visibility.ANY,
		fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class MetradoListModel {
	
	private MetradoModel listaMetrados[];
	private String listaMetradoEliminados;

	public MetradoModel[] getListaMetrados() {
		return listaMetrados;
	}

	public void setListaMetrados(MetradoModel[] listaMetrados) {
		this.listaMetrados = listaMetrados;
	}

	public String getListaMetradoEliminados() {
		return listaMetradoEliminados;
	}

	public void setListaMetradoEliminados(String listaMetradoEliminados) {
		this.listaMetradoEliminados = listaMetradoEliminados;
	}

	
}
