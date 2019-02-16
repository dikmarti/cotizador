package cotizador.service;

import java.util.List;

import javax.inject.Inject;

import cotizador.model.domain.Nivel;
import cotizador.model.domain.Proyecto;
import cotizador.model.domain.Sistema;
import cotizador.model.domain.Usuario;
import cotizador.model.repository.GenericRepository;

public class NivelService {

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
	public Object createNivel(Object object) {

		System.out.println("Creating nivel in data base");
		Object result = genericRepository.addObject(object);
		
		return  result;
	}

	/**
	 * Metodo que actualiza un sistema en la base de datos
	 * @param nombre
	 * @param descripcion
	 * @param elementos
	 * @param materiales
	 * @param id
	 * @return
	 */
	public Integer updateProject(Proyecto proyecto) {

		/*System.out.println("Method updateProject...");
		
		int status = genericRepository.executeUpdateQuery("UPDATE Proyecto u SET u.nombre = '" + nombre + "', "
						+ "u.descripcion = '" + descripcion 
						+ "', u.elementos = '" + elementos 
						+ "', u.materiales = '" + materiales + "' WHERE u.id = '" + id + "'");
		
		System.out.println("finish system update");
		System.out.println("status: " + status);
		Integer result = status == 1 ? 0 : 2;
		
		return result;*/
		
		return null;
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
	 * Metodo que retorna un sistema de la base por id
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

}
