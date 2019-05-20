package cotizador.service;

import java.util.List;

import javax.inject.Inject;

import cotizador.model.domain.Bloque;
import cotizador.model.repository.GenericRepository;

public class BloqueService {

	@Inject
	GenericRepository genericRepository;
	

	/**
	 * Metodo que registra un nuevo nivel a la base de datos
	 * @param nombre
	 * @param descripcion
	 * @param elementos
	 * @param materiales
	 * @return
	 */
	public Object createBloque(Object object) {

		System.out.println("Creating bloque in data base");
		Object result = genericRepository.addObject(object);
		
		return  result;
	}
	
	 /* Metodo que modifica un nivel a la base de datos
	 * @param object
	 * @return
	 */
	public void updateBloque(Object object) {

		System.out.println("Modifying bloque in data base");
		genericRepository.updateObject(object);		
	}
	

	/**
	 * Metodo que elimina un proveedor de la base de datos
	 * @param id
	 * @return
	 */
	public Boolean deleteBloque(Integer id) {

		System.out.println("Method deleteBloque...");

		int deleted = genericRepository.executeUpdateQuery("DELETE FROM Bloque u WHERE u.id = '" + id +"'");

		System.out.println("deleted: " + deleted);
		Boolean systemResult = deleted == 1 ? Boolean.TRUE : Boolean.FALSE;

		return  systemResult;
	}
	
	/**
	 * Metodo que retorna un bloque de la base por id
	 * @param id
	 * @return
	 */
	public Bloque findBloqueById(Integer id) {

		System.out.println("Method findBloqueById...");
		List<Object> allObject = genericRepository.getAllObjectFiltered("Bloque.findById", "id", id);

		Bloque result = !allObject.isEmpty() ? (Bloque) (Object) allObject.get(0) : null;
		System.out.println("Bloque: " + result);

		return result;

	}

	/**
	 * Metodo que retorna lista de bloques por id de proyecto
	 * @param idProject
	 * @return
	 */
	public List<Bloque> findBloqueByProject(Integer idProject) {
		
		System.out.println("Method findBloqueById...");
		List<Object> allObject = genericRepository.getAllObjectFiltered("Bloque.findByIdProject", "id", idProject);
		
		List<Bloque> result = !allObject.isEmpty() ? (List<Bloque>) (Object) allObject : null;
		System.out.println("BloqueList: " + result);
		
		return result;
		
	}

}
