package cotizador.service;

import java.util.List;

import javax.inject.Inject;

import cotizador.model.domain.Producto;
import cotizador.model.domain.RelacionProducto;
import cotizador.model.domain.Sistema;
import cotizador.model.repository.GenericRepository;

public class RelationService {

	@Inject
	GenericRepository genericRepository;
	
	@Inject
	SystemService systemService;
	
	@Inject
	ProductService productService;
	
	/**
	 * Metodo que retorna todos las relaciones de productos de la base de datos
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<RelacionProducto> retrieveAllRelation() {

		System.out.println("finding all relaations products from data base");

		List<Object> allObject = genericRepository.getAllObjectByQuery("SELECT u FROM RelacionProducto u");

		List<RelacionProducto> result = !allObject.isEmpty() ? (List<RelacionProducto>) (Object) allObject : null;

		return  result;
	}
	
	/**
	 * Metodo que registra una nueva relacion entre productos a la base de datos
	 * @param idSistema
	 * @param idProducto
	 * @param idProductoRelacion
	 * @param factor
	 * @param operacion
	 * @return
	 */
	public Integer createRelation(Integer idSistema, Integer idProducto, Integer idProductoRelacion, String factor, 
			Integer operacion) {

		System.out.println("Method createRelation...");

		RelacionProducto relacionProducto = new RelacionProducto();
		
		Sistema sistema = systemService.findSystemById(idSistema);
		Producto producto = productService.findProductById(idProducto);
		Producto productoRelacion = productService.findProductById(idProductoRelacion);
		
		relacionProducto.setSistema(sistema);
		relacionProducto.setProducto(producto);
		relacionProducto.setProductoRelacion(productoRelacion);
		relacionProducto.setFactor(factor);
		relacionProducto.setOperacion(operacion);

		System.out.println("Creating relation product from data base");
		Object object = genericRepository.addObject(relacionProducto);

		Integer relationResult = object != null ? 0 : 2;
		System.out.println("relationResult: " + relationResult);

		return  relationResult;
	}

	/**
	 * Metodo que actualiza una relacion de productos en la base de datos
	 * @param factor
	 * @param operacion
	 * @param id
	 * @return
	 */
	public Integer updateRelation(String factor, Integer operacion, Integer id) {

		System.out.println("Method updateRelation...");
		System.out.println("Updating system from data base");
		
		int status = genericRepository.executeUpdateQuery("UPDATE RelacionProducto u SET u.factor = '" + factor + "', "
						+ "u.operacion = '" + operacion + "' WHERE u.id = '" + id + "'");
		
		System.out.println("finish relation update");
		System.out.println("status: " + status);
		Integer result = status == 1 ? 0 : 2;
		
		return result;
	}


	/**
	 * Metodo que elimina una relacion de productos de la base de datos
	 * @param id
	 * @return
	 */
	public Boolean deleteRelation(Integer id) {

		System.out.println("Method deleteRelation...");

		int deleted = genericRepository.executeUpdateQuery("DELETE FROM RelacionProducto u WHERE u.id = '" + id +"'");

		System.out.println("deleted: " + deleted);
		Boolean systemResult = deleted == 1 ? Boolean.TRUE : Boolean.FALSE;

		return  systemResult;
	}
	
	/**
	 * Metodo que retorna una relacion de productos de la base por id
	 * @param id
	 * @return
	 */
	public RelacionProducto findRelationById(Integer id) {

		System.out.println("Method findSystemById...");
		List<Object> allObject = genericRepository.getAllObjectFiltered("RelacionProducto.findById", "id", id);

		RelacionProducto result = !allObject.isEmpty() ? (RelacionProducto) (Object) allObject.get(0) : null;
		System.out.println("Sistema: " + result);

		return result;

	}

}
