package cotizador.service;

import java.util.List;

import javax.inject.Inject;

import cotizador.model.domain.Marca;
import cotizador.model.repository.GenericRepository;

public class BrandService {

	@Inject
	GenericRepository genericRepository;
	
	/**
	 * Metodo que retorna todas las marcas de la base de datos
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Marca> retrieveAllBrand() {

		System.out.println("finding all brands from data base");

		List<Object> allObject = genericRepository.getAllObjectByQuery("SELECT u FROM Marca u");

		List<Marca> result = !allObject.isEmpty() ? (List<Marca>) (Object) allObject : null;

		return  result;
	}
	
	/**
	 * Metodo que registra una nueva marca a la base de datos
	 * @param nombre
	 * @param descripcion
	 * @return
	 */
	public Integer createBrand(String nombre, String descripcion) {

		System.out.println("Method createBrand...");

		Marca marca = new Marca();
		
		marca.setNombre(nombre);
		marca.setDescripcion(descripcion);

		System.out.println("Creating brand from data base");
		Object object = genericRepository.addObject(marca);

		Integer systemResult = object != null ? 0 : 2;
		System.out.println("brandResult: " + systemResult);

		return  systemResult;
	}

	/**
	 * Metodo que actualiza una marca en la base de datos
	 * @param nombre
	 * @param descripcion
	 * @param id
	 * @return
	 */
	public Integer updateBrand(String nombre, String descripcion, Integer id) {

		System.out.println("Method updateBrand...");
		System.out.println("Updating brand from data base");
		
		int status = genericRepository.executeUpdateQuery("UPDATE Marca u SET u.nombre = '" + nombre + "', "
						+ "u.descripcion = '" + descripcion 
						+ "' WHERE u.id = '" + id + "'");
		
		System.out.println("finish brand update");
		System.out.println("status: " + status);
		Integer result = status == 1 ? 0 : 2;
		
		return result;
	}


	/**
	 * Metodo que elimina una marca de la base de datos
	 * @param id
	 * @return
	 */
	public Integer deleteBrand(Integer id) {

		System.out.println("Method deleteBrand...");
		
		if(!isValidBrand(id)) {
			System.out.println("La marca tiene productos asociados..");
			return 1;
		}

		int deleted = genericRepository.executeUpdateQuery("DELETE FROM Marca u WHERE u.id = '" + id +"'");

		System.out.println("deleted: " + deleted);
		Integer systemResult = deleted == 1 ? 0 : 2;

		return  systemResult;
	}
	
	/**
	 * Metodo que verifica si la marca se encuentra asociada a un producto
	 * @param id
	 * @return
	 */
	public Boolean isValidBrand(Integer id) {
		System.out.println("Method isValidBrand...");
		List<Object> allObject = genericRepository
				.getAllObjectByQuery("SELECT u FROM Producto u WHERE u.marca.id = '" 
						+ id +"'");

		Boolean result = !allObject.isEmpty() ? Boolean.FALSE : Boolean.TRUE;
		System.out.println("result: " + result);

		return result;
	}
	
	/**
	 * Metodo que retorna una marca de la base por id
	 * @param id
	 * @return
	 */
	public Marca findBrandById(Integer id) {

		System.out.println("Method findBrandById...");
		List<Object> allObject = genericRepository.getAllObjectFiltered("Marca.findById", "id", id);

		Marca result = !allObject.isEmpty() ? (Marca) (Object) allObject.get(0) : null;
		System.out.println("Marca: " + result);

		return result;

	}

}
