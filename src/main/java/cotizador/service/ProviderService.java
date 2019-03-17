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
	public Integer createProvider(Proveedor proveedor) {

		System.out.println("Method createProvider...");

		System.out.println("Verificando si el codigo de proveedor no existe...");

		if(!validCode(proveedor.getCodigo())) {
			System.out.println("Ya existe codigo de proveedor");
			return 1;
		}

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
	public Integer updateProvider(Proveedor proveedor, String codigoAnterior) {

		System.out.println("Method updateProvider...");
		System.out.println("Updating provider from data base");
		
		if(!codigoAnterior.equals(proveedor.getCodigo())) {
			if(!validCode(proveedor.getCodigo())) {
				System.out.println("Ya existe codigo de proveedor");
				//Codigo repetido
				return 1;
			}
		}

		try {
			genericRepository.updateObject(proveedor);
		} catch (Exception e) {
			//Cualquier error
			return 2;
		}
		
		//Exito
		return 0;
	}


	/**
	 * Metodo que elimina un proveedor de la base de datos
	 * @param id
	 * @return
	 */
	public Integer deleteProvider(Integer id) {

		System.out.println("Method deleteUser...");
		
		if(isValidProvider(id)) {
			int deleted = genericRepository.executeUpdateQuery("DELETE FROM Proveedor u WHERE u.id = '" + id +"'");
			System.out.println("deleted: " + deleted);
			Integer providerResult = deleted == 1 ? 0 : 2;
			return  providerResult;
		} else { 
			System.out.println("El proveedor esta asociado a lista de precios y no puede ser eliminado");
			return 1;
		}
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
	 * Metodo que valida si un proveedor se encuentra asociado a una lista de precios
	 * @param id
	 * @return
	 */
	public Boolean isValidProvider(Integer id) {
		
		System.out.println("Method isValidProvider...");
		List<Object> allObject = genericRepository.getAllObjectByQuery("SELECT u FROM Precio u WHERE u.proveedor.id = '" + id +"'");
		
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
