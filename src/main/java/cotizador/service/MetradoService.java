package cotizador.service;

import java.util.List;

import javax.inject.Inject;

import cotizador.model.domain.Metrado;
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

		System.out.println("Creating metrado in data base");
		List<Object> result = genericRepository.addAllObject(listObject);
		
		return  result;
	}
	
	public List<Object> modifyAllMetrado(List<Object> listObject) {

		System.out.println("modify metrado in data base");
		List<Object> result = genericRepository.modifyAllObject(listObject);
		
		return  result;
	}
	
	@SuppressWarnings("unchecked")
	public List<Metrado> findAllMetrado(Integer idNivel){
		
		List<Object> allObject = genericRepository.getAllObjectFiltered("Metrado.findByNivel", "idNivel", idNivel);
		
		return !allObject.isEmpty() ? (List<Metrado>) (Object) allObject : null;
	
	}
	
	public int removeAllListId(String listId) {

		System.out.println("remove metrados in data base");
		int result = genericRepository.executeUpdateQuery("DELETE FROM Metrado m WHERE m.id IN (" + listId + ")");
		
		return  result;
	}

	@SuppressWarnings("unchecked")
	public List<Metrado> getAllMetradoByProject(Integer idProject){
		
		List<Object> allObject = genericRepository.getAllObjectFiltered("Metrado.getAllMetradoByProject", "idProject", idProject);
		
		return !allObject.isEmpty() ? (List<Metrado>) (Object) allObject : null;
	
	}
	
}
