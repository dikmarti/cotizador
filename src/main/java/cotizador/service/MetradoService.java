package cotizador.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import cotizador.model.domain.Metrado;
import cotizador.model.domain.Precio;
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
	
	@SuppressWarnings("unchecked")
	public List<Metrado> findAllMetrado(String idNivel){
		
		List<Object> allObject = genericRepository.getAllObjectFiltered("Metrado.findByNivel", "id", idNivel);
		
		List<Metrado> metradoList = !allObject.isEmpty() ? (List<Metrado>) (Object) allObject : null;
		
		return metradoList;
		
	}

	
}
