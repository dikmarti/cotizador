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
	public Integer createSystem(String nombre, String descripcion) {

		System.out.println("Method createSystem...");

		Sistema sistema = new Sistema();
		
		sistema.setNombre(nombre);
		sistema.setDescripcion(descripcion);

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
	public Integer updateSystem(String nombre, String descripcion, Integer id) {

		System.out.println("Method updateSystem...");
		System.out.println("Updating system from data base");
		
		int status = genericRepository.executeUpdateQuery("UPDATE Sistema u SET u.nombre = '" + nombre + "', "
						+ "u.descripcion = '" + descripcion 
						+ "' WHERE u.id = '" + id + "'");
		
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
	public Integer deleteSystem(Integer id) {

		System.out.println("Method deleteSystem...");
		
		if(!isValidSystem(id)) {
			System.out.println("El sistema tiene productos asociados..");
			return 1;
		}

		int deleted = genericRepository.executeUpdateQuery("DELETE FROM Sistema u WHERE u.id = '" + id +"'");

		System.out.println("deleted: " + deleted);
		Integer systemResult = deleted == 1 ? 0 : 2;

		return  systemResult;
	}
	
	/**
	 * Metodo que retorna un sistema de la base por id
	 * @param id
	 * @return
	 */
	public Sistema findSystemById(Integer id) {

		System.out.println("Method findSystemById...");
		List<Object> allObject = genericRepository.getAllObjectFiltered("Sistema.findById", "id", id);

		Sistema result = !allObject.isEmpty() ? (Sistema) (Object) allObject.get(0) : null;
		System.out.println("Sistema: " + result);

		return result;

	}
	
	public Boolean isValidSystem(Integer id) {
		System.out.println("Method isValidSystem...");
		List<Object> allObject = genericRepository
				.getAllObjectByQuery("SELECT u FROM Producto u WHERE u.sistema.id = '" 
						+ id +"'");

		Boolean result = !allObject.isEmpty() ? Boolean.FALSE : Boolean.TRUE;
		System.out.println("result: " + result);

		return result;
	}

}
