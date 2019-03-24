package cotizador.service;

import java.util.List;

import javax.inject.Inject;

import cotizador.model.domain.Marca;
import cotizador.model.domain.Producto;
import cotizador.model.domain.Sistema;
import cotizador.model.repository.GenericRepository;

public class ProductService {

	@Inject
	GenericRepository genericRepository;

	@Inject
	SystemService systemService;
	
	@Inject
	BrandService brandService;
	
	/**
	 * Metodo que retorna todos los producto de la base de datos
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Producto> retrieveAllProduct() {

		System.out.println("finding all systems from data base");

		List<Object> allObject = genericRepository.getAllObjectByQuery("SELECT u FROM Producto u");

		List<Producto> result = !allObject.isEmpty() ? (List<Producto>) (Object) allObject : null;

		return  result;
	}
	
	/**
	 * Metodo que retorna todos los productos de la base por sistema
	 * @param system
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Producto> retrieveAllProductBySystem(Integer idSystem) {
		
		System.out.println("finding all systems from data base");
		
		List<Object> allObject = genericRepository.getAllObjectFiltered("Producto.findBySystem", "sistema", idSystem);
		
		List<Producto> result = !allObject.isEmpty() ? (List<Producto>) (Object) allObject : null;
		
		return  result;
	}
	
	/**
	 * Metodo que registra un nuevo producto a la base de datos
	 * @param idMco
	 * @param idFabricante
	 * @param codigo
	 * @param nombre
	 * @param nombreCorto
	 * @param descripcion
	 * @param porcentajeResguardo
	 * @param observacion
	 * @param unidadMedida
	 * @param sistema
	 * @return
	 */
	public Integer createProduct(Integer idMco, Integer numParteFabricante, String nombre,  
			String descripcion, Integer porcentajeResguardo, String observacion, Integer unidadMedida, 
			Integer sistema, Integer marca) {

		System.out.println("Method createProduct...");

		Producto producto = new Producto();
		
		producto.setIdProductoMCO(idMco);
		producto.setNumParteFabricante(numParteFabricante);
		producto.setNombre(nombre);
		producto.setDescripcion(descripcion);
		producto.setPorcentajeResguardo(porcentajeResguardo);
		producto.setObservacion(observacion);
		producto.setUnidadMedida(unidadMedida);
		
		Sistema system = systemService.findSystemById(sistema);
		producto.setSistema(system);
		
		Marca brand = brandService.findBrandById(marca);
		producto.setMarca(brand);
		
		System.out.println("Creating product from data base");
		Object object = genericRepository.addObject(producto);

		Integer productResult = object != null ? 0 : 2;
		System.out.println("productResult: " + productResult);

		return  productResult;
	}

	/**
	 * Metodo que actualiza un producto en la base de datos
	 * @param idMco
	 * @param numParteFabricante
	 * @param codigo
	 * @param nombre
	 * @param nombreCorto
	 * @param descripcion
	 * @param porcentajeResguardo
	 * @param observacion
	 * @param unidadMedida
	 * @param sistema
	 * @param id
	 * @return
	 */
	public Integer updateProduct(Integer idMco, Integer numParteFabricante, String nombre, 
			String descripcion, Integer porcentajeResguardo, String observacion, Integer unidadMedida, 
			Integer sistema, Integer id, Integer marca) {

		System.out.println("Method updateProduct...");
		System.out.println("Updating product from data base");
		
		Sistema system = systemService.findSystemById(sistema);
		Marca brand = brandService.findBrandById(marca);
		
		int status = genericRepository.executeUpdateQuery("UPDATE Producto u SET u.idProductoMCO = '" + idMco + "', "
						+ "u.numParteFabricante = '" + numParteFabricante 
						+ "', u.nombre = '" + nombre						 
						+ "', u.descripcion = '" + descripcion 
						+ "', u.porcentajeResguardo = '" + porcentajeResguardo 
						+ "', u.observacion = '" + observacion 
						+ "', u.unidadMedida = '" + unidadMedida 
						+ "', u.marca = " + brand 
						+ ", u.sistema = " + system + " WHERE u.id = '" + id + "'");
		
		System.out.println("finish product update");
		System.out.println("status: " + status);
		Integer result = status == 1 ? 0 : 2;
		
		return result;
	}


	/**
	 * Metodo que elimina un producto de la base de datos
	 * @param id
	 * @return
	 */
	public Integer deleteProduct(Integer id) {

		System.out.println("Method deleteProduct...");
		if(isValidProduct(id)) {
			int deleted = genericRepository.executeUpdateQuery("DELETE FROM Producto u WHERE u.id = '" + id +"'");
			
			System.out.println("deleted: " + deleted);
			Integer productResult = deleted == 1 ?  0 : 2;
			
			return  productResult;
		} else {
			System.out.println("El producto esta asociado a lista de precios y no puede ser eliminado");
			return 1;
		}
	}
	
	/**
	 * Metodo que retorna un producto de la base
	 * @param id
	 * @return
	 */
	public Producto findProductById(Integer id) {

		System.out.println("Method findProductById...");
		List<Object> allObject = genericRepository.getAllObjectFiltered("Producto.findById", "id", id);

		Producto result = !allObject.isEmpty() ? (Producto) (Object) allObject.get(0) : null;
		System.out.println("Producto: " + result);

		return result;

	}
	
	public Boolean isValidProduct(Integer id) {
		
		System.out.println("Method isValidProduct...");
		List<Object> allObject = genericRepository.getAllObjectByQuery("SELECT u FROM Precio u WHERE u.producto.id = '" + id +"'");
		
		Boolean result = !allObject.isEmpty() ? Boolean.FALSE : Boolean.TRUE;
		System.out.println("result: " + result);
		
		return result;
		
	}
	
}
