package cotizador.model.domain.models;

import org.codehaus.jackson.annotate.JsonAutoDetect;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown = true)
@JsonAutoDetect(setterVisibility = JsonAutoDetect.Visibility.ANY,
		getterVisibility = JsonAutoDetect.Visibility.ANY, 
		isGetterVisibility = JsonAutoDetect.Visibility.ANY,
		fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class MetradoListModel {
	
	MetradoModel listaMetrados[];

	public MetradoModel[] getListaMetrados() {
		return listaMetrados;
	}

	public void setListaMetrados(MetradoModel[] listaMetrados) {
		this.listaMetrados = listaMetrados;
	}
	
}
