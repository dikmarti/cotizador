package cotizador.service;

import java.util.List;

import javax.inject.Inject;

import cotizador.model.domain.Producto;
import cotizador.model.domain.Sistema;
import cotizador.model.repository.GenericRepository;

public class ProductService {

	@Inject
	GenericRepository genericRepository;

	@Inject
	SystemService systemService;
	
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
	public Integer createProduct(Integer idMco, Integer idFabricante, String codigo, String nombre, String nombreCorto, 
			String descripcion, Integer porcentajeResguardo, String observacion, Integer unidadMedida, 
			Integer sistema) {

		System.out.println("Method createProduct...");

		Producto producto = new Producto();
		
		producto.setIdProductoMCO(idMco);
		producto.setIdFabricante(idFabricante);
		producto.setCodigo(codigo);
		producto.setNombre(nombre);
		producto.setNombreCorto(nombreCorto);
		producto.setDescripcion(descripcion);
		producto.setPorcentajeResguardo(porcentajeResguardo);
		producto.setObservacion(observacion);
		producto.setUnidadMedida(unidadMedida);
		
		Sistema system = systemService.findSystemById(sistema);
		
		producto.setSistema(system);
		
		System.out.println("Creating product from data base");
		Object object = genericRepository.addObject(producto);

		Integer productResult = object != null ? 0 : 2;
		System.out.println("productResult: " + productResult);

		return  productResult;
	}

	/**
	 * Metodo que actualiza un producto en la base de datos
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
	 * @param id
	 * @return
	 */
	public Integer updateProduct(Integer idMco, Integer idFabricante, String codigo, String nombre, String nombreCorto, 
			String descripcion, Integer porcentajeResguardo, String observacion, Integer unidadMedida, 
			Integer sistema, Integer id) {

		System.out.println("Method updateProduct...");
		System.out.println("Updating product from data base");
		
		int status = genericRepository.executeUpdateQuery("UPDATE Producto u SET u.idProductoMCO = '" + idMco + "', "
						+ "u.idFabricante = '" + idFabricante 
						+ "u.codigo = '" + codigo 
						+ "u.nombre = '" + nombre 
						+ "u.nombreCorto = '" + nombreCorto 
						+ "u.descripcion = '" + descripcion 
						+ "u.porcentajeResguardo = '" + porcentajeResguardo 
						+ "u.observacion = '" + observacion 
						+ "', u.unidadMedida = '" + unidadMedida 
						+ "', u.sistema = '" + sistema + "' WHERE u.id = '" + id + "'");
		
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
	public Boolean deleteProduct(Integer id) {

		System.out.println("Method deleteProduct...");
		//TODO: Eliminar todas las tablas donde se encuentre el id de producto antes de eliminar el producto
		int deleted = genericRepository.executeUpdateQuery("DELETE FROM Producto u WHERE u.id = '" + id +"'");

		System.out.println("deleted: " + deleted);
		Boolean productResult = deleted == 1 ? Boolean.TRUE : Boolean.FALSE;

		return  productResult;
	}

}
