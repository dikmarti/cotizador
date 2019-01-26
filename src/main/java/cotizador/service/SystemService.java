package cotizador.service;

import java.util.List;

import javax.inject.Inject;

import cotizador.model.domain.Sistema;
import cotizador.model.repository.GenericRepository;

public class SystemService {

	@Inject
	GenericRepository genericRepository;
	
	/**
	 * Metodo que retorna todos los sistemas de la base de datos
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Sistema> retrieveAllSystem() {

		System.out.println("finding all systems from data base");

		List<Object> allObject = genericRepository.getAllObjectByQuery("SELECT u FROM Sistema u");

		List<Sistema> result = !allObject.isEmpty() ? (List<Sistema>) (Object) allObject : null;

		return  result;
	}
	
	/**
	 * Metodo que registra un nuevo sistema a la base de datos
	 * @param nombre
	 * @param descripcion
	 * @param elementos
	 * @param materiales
	 * @return
	 */
	public Integer createSystem(String nombre, String descripcion, String elementos, String materiales) {

		System.out.println("Method createSystem...");

		Sistema sistema = new Sistema();
		
		sistema.setNombre(nombre);
		sistema.setDescripcion(descripcion);
		sistema.setElementos(elementos);
		sistema.setMateriales(materiales);

		System.out.println("Creating system from data base");
		Object object = genericRepository.addObject(sistema);

		Integer systemResult = object != null ? 0 : 2;
		System.out.println("systemResult: " + systemResult);

		return  systemResult;
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
	public Integer updateSystem(String nombre, String descripcion, String elementos, String materiales, Integer id) {

		System.out.println("Method updateSystem...");
		System.out.println("Updating system from data base");
		
		int status = genericRepository.executeUpdateQuery("UPDATE Sistema u SET u.nombre = '" + nombre + "', "
						+ "u.descripcion = '" + descripcion 
						+ "', u.elementos = '" + elementos 
						+ "', u.materiales = '" + materiales + "' WHERE u.id = '" + id + "'");
		
		System.out.println("finish system update");
		System.out.println("status: " + status);
		Integer result = status == 1 ? 0 : 2;
		
		return result;
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

}
