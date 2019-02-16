package cotizador.service;

import java.util.List;

import javax.inject.Inject;

import cotizador.model.domain.Proyecto;
import cotizador.model.domain.Sistema;
import cotizador.model.domain.Usuario;
import cotizador.model.repository.GenericRepository;

public class MetradoService {

	@Inject
	GenericRepository genericRepository;
	

	/**
	 * Metodo que registra un nuevo sistema a la base de datos
	 * @param nombre
	 * @param descripcion
	 * @param elementos
	 * @param materiales
	 * @return
	 */
	public Object createMetrado(Object object) {

		System.out.println("Creating project in data base");
		Object result = genericRepository.addObject(object);
		
		return  result;
	}
	
	public List<Object> addAllMetrado(List<Object> listObject) {

		System.out.println("Creating project in data base");
		List<Object> result = genericRepository.addAllObject(listObject);
		
		return  result;
	}

	
}
