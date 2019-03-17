package cotizador.service;

import java.util.List;

import javax.inject.Inject;

import cotizador.model.domain.Nivel;
import cotizador.model.domain.Proyecto;
import cotizador.model.repository.GenericRepository;

public class NivelService {

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
	public Object createNivel(Object object) {

		System.out.println("Creating nivel in data base");
		Object result = genericRepository.addObject(object);
		
		return  result;
	}
	
	 /* Metodo que modifica un nivel a la base de datos
	 * @param object
	 * @return
	 */
	public void updateNivel(Object object) {

		System.out.println("Modifying nivel in data base");
		genericRepository.updateObject(object);		
	}
	

	/**
	 * Metodo que elimina un proveedor de la base de datos
	 * @param id
	 * @return
	 */
	public Boolean deleteSystem(Integer id) {

		System.out.println("Method deleteSystem...");

		int deleted = genericRepository.executeUpdateQuery("DELETE FROM Sistema u WHERE u.id = '" + id +"'");

		System.out.println("deleted: " + deleted);
		Boolean systemResult = deleted == 1 ? Boolean.TRUE : Boolean.FALSE;

		return  systemResult;
	}
	
	/**
	 * Metodo que retorna un nivel de la base por id
	 * @param id
	 * @return
	 */
	public Nivel findNivelById(Integer id) {

		System.out.println("Method findNivelById...");
		List<Object> allObject = genericRepository.getAllObjectFiltered("Nivel.findById", "id", id);

		Nivel result = !allObject.isEmpty() ? (Nivel) (Object) allObject.get(0) : null;
		System.out.println("Nivel: " + result);

		return result;

	}

	/**
	 * Metodo que retorna lista de niveles por id de proyecto
	 * @param idProject
	 * @return
	 */
	public List<Nivel> findNivelByProject(Integer idProject) {
		
		System.out.println("Method findNivelById...");
		List<Object> allObject = genericRepository.getAllObjectFiltered("Nivel.findByIdProject", "id", idProject);
		
		List<Nivel> result = !allObject.isEmpty() ? (List<Nivel>) (Object) allObject : null;
		System.out.println("NivelList: " + result);
		
		return result;
		
	}

}
