package cotizador.service;

import java.util.List;

import javax.inject.Inject;

import cotizador.model.domain.Proveedor;
import cotizador.model.repository.GenericRepository;

public class ProviderService {

	@Inject
	GenericRepository genericRepository;
	
	/**
	 * Metodo que retorna todos los proveedores de la base de datos
	 * @return
	 */
	public List<Proveedor> retrieveAllProviders() {

		System.out.println("finding all user from data base");

		List<Object> allObject = genericRepository.getAllObjectByQuery("SELECT u FROM Proveedor u");

		List<Proveedor> result = !allObject.isEmpty() ? (List<Proveedor>) (Object) allObject : null;

		return  result;
	}
	
	/**
	 * Metodo que registra un nuevo proveedor a la base de datos
	 * @param codigo
	 * @param nombre
	 * @param direccion
	 * @return
	 */
	public Integer createProvider(String codigo, String nombre, String direccion) {

		System.out.println("Method createProvider...");

		System.out.println("Verificando si el codigo de proveedor no existe...");

		if(!validCode(codigo)) {
			System.out.println("Ya existe codigo de proveedor");
			return 1;
		}

		Proveedor proveedor = new Proveedor();
		proveedor.setCodigo(codigo);
		proveedor.setNombre(nombre);
		proveedor.setDireccion(direccion);

		System.out.println("Creating provider from data base");
		Object object = genericRepository.addObject(proveedor);

		Integer providerResult = object != null ? 0 : 2;
		System.out.println("providerResult: " + providerResult);

		return  providerResult;
	}

	/**
	 * Metodo que actualiza un proveedor en la base de datos
	 * @param codigo
	 * @param codigoAnterior
	 * @param nombre
	 * @param direccion
	 * @param id
	 * @return
	 */
	public Integer updateProvider(String codigo, String codigoAnterior, String nombre, String direccion, Integer id) {

		System.out.println("Method updateProvider...");
		System.out.println("Updating provider from data base");
		
		if(!codigoAnterior.equals(codigo)) {
			if(!validCode(codigo)) {
				System.out.println("Ya existe codigo de proveedor");
				return 1;
			}
		}

		int status = genericRepository.executeUpdateQuery("UPDATE Proveedor u SET u.nombre = '" + nombre + "', "
						+ "u.codigo = '" + codigo + "', u.direccion = '" + direccion + "' WHERE u.id = '" + id + "'");
		
		System.out.println("finish provider update");
		System.out.println("status: " + status);
		Integer result = status == 1 ? 0 : 2;
		
		return result;
	}


	/**
	 * Metodo que elimina un proveedor de la base de datos
	 * @param id
	 * @return
	 */
	public Boolean deleteProvider(Integer id) {

		System.out.println("Method deleteUser...");

		int deleted = genericRepository.executeUpdateQuery("DELETE FROM Proveedor u WHERE u.id = '" + id +"'");

		System.out.println("deleted: " + deleted);
		Boolean providerResult = deleted == 1 ? Boolean.TRUE : Boolean.FALSE;

		return  providerResult;
	}

	/**
	 * Metodo que valida si el codigo de proveedor ya existe en la base de datos
	 * @param codigo
	 * @return
	 */
	public Boolean validCode(String codigo) {

		System.out.println("Method validCode...");
		List<Object> allObject = genericRepository.getAllObjectByQuery("SELECT u FROM Proveedor u WHERE u.codigo = '" + codigo +"'");

		Boolean result = !allObject.isEmpty() ? Boolean.FALSE : Boolean.TRUE;
		System.out.println("result: " + result);

		return result;

	}
	
	/**
	 * Metodo que busca un proveedor en la base de datos por id
	 * @param id
	 * @return
	 */
	public Proveedor findProviderById(Integer id) {

		System.out.println("Method findProviderById...");
		List<Object> allObject = genericRepository.getAllObjectFiltered("Proveedor.findById", "id", id);

		Proveedor result = !allObject.isEmpty() ? (Proveedor) (Object) allObject.get(0) : null;
		System.out.println("Proveedor: " + result);

		return result;

	}


}
