package cotizador.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import cotizador.model.domain.Precio;
import cotizador.model.domain.models.PriceListResponseModel;
import cotizador.model.repository.GenericRepository;

public class PriceListService {

	@Inject
	GenericRepository genericRepository;
	
	@Inject
	ProductService productService;

	@Inject
	ProviderService providerService;
	
	public static SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy HH:mm");
	
	/**
	 * Metodo que retorna todas las listas de precios de la base de datos
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<PriceListResponseModel> retrieveAllPriceList() {

		System.out.println("finding all priceLists from data base");

		List<Object> allObject = genericRepository.getAllObjectByQuery("SELECT u FROM Precio u");

		List<Precio> result = !allObject.isEmpty() ? (List<Precio>) (Object) allObject : null;
		List<PriceListResponseModel> priceListResponseModels = new ArrayList<PriceListResponseModel>();
		if(result != null && !result.isEmpty()) {
			for (Precio p : result) {
				PriceListResponseModel priceListResponseModel = new PriceListResponseModel();
				priceListResponseModel.setId(p.getId());
				priceListResponseModel.setProducto(p.getProducto().getNombre());
				priceListResponseModel.setProveedor(p.getProveedor().getNombre());
				priceListResponseModel.setPrecio1(String.valueOf(p.getPrecio1()));
				priceListResponseModel.setPrecio2(String.valueOf(p.getPrecio2()));
				priceListResponseModel.setPrecio3(String.valueOf(p.getPrecio3()));
				priceListResponseModel.setPrecio4(String.valueOf(p.getPrecio4()));
				priceListResponseModel.setPrecio5(String.valueOf(p.getPrecio5()));
				priceListResponseModel.setPrecio6(String.valueOf(p.getPrecio6()));
				priceListResponseModel.setPrecio7(String.valueOf(p.getPrecio7()));
				priceListResponseModel.setPrecio8(String.valueOf(p.getPrecio8()));
				priceListResponseModel.setPrecio9(String.valueOf(p.getPrecio9()));
				priceListResponseModel.setPrecio10(String.valueOf(p.getPrecio10()));
				priceListResponseModel.setPrecioMinimo(String.valueOf(p.getPrecioMinimo()));
				priceListResponseModel.setPrecioMaximo(String.valueOf(p.getPrecioMaximo()));
				priceListResponseModel.setPrecioPromedio(String.valueOf(p.getPrecioPromedio()));
				priceListResponseModel.setFechaInicio(p.getFechaInicio() != null ? format.format(p.getFechaInicio()) : "");
				priceListResponseModel.setFechaFin(p.getFechaFin() != null ? format.format(p.getFechaFin()) : "");
				
				priceListResponseModels.add(priceListResponseModel);
			}
			return priceListResponseModels;
		}
		return null;
	}
	
	/**
	 * Metodo para crear una lista de precios en la base datos
	 * @param idProducto
	 * @param idProveedor
	 * @param precioMinimo
	 * @param precioMaximo
	 * @param precioPromedio
	 * @return
	 */
	public Integer createPriceList(Precio precio) {

		System.out.println("Method createPriceList...");
		
		if(!isValidPriceList(precio.getProducto().getId(), precio.getProveedor().getId())) {
			System.out.println("Existe priceList vigente para producto y proveedor...");
			return 1;
		}
	
		System.out.println("Creating system from data base");
		Object object = genericRepository.addObject(precio);

		Integer priceListResult = object != null ? 0 : 2;
		System.out.println("precioResult: " + priceListResult);

		return  priceListResult;
	}

	/**
	 * Metodo que actualiza los precios de una lista de precios en la base de datos
	 * @param precioMinimo
	 * @param precioMaximo
	 * @param precioPromedio
	 * @param id
	 * @return
	 */
	public Integer updatePriceList(Precio precio) {

		System.out.println("Method updatePriceList...");
		System.out.println("Updating PriceList from data base");
		
		Integer result = ((Precio) genericRepository.updateObject(precio)) != null ? 0 : 2;
		System.out.println("finish priceList update");
		
		return result;
	}


	
	/**
	 * Metodo que coloca fecha fin a una lista de precios
	 * @param id
	 * @return
	 */
	public Boolean deletePriceList(Integer id) {

		System.out.println("Method deletePriceList...");
		
		Precio listaPrecio = findById(id);
		listaPrecio.setFechaFin(new Date());
		try {
			genericRepository.updateObject(listaPrecio);
			return Boolean.TRUE;
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return  Boolean.FALSE;
	}
	
	/**
	 * Metodo que retorna una lista de precios por id de producto
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Precio> findByProduct(Integer id) {

		System.out.println("Method findByProduct...");
		List<Object> allObject = genericRepository.getAllObjectFiltered("Precio.findByProduct", "id", id);

		List<Precio> result = !allObject.isEmpty() ? (List<Precio>) (Object) allObject : null;
		System.out.println("Lista de Precios: " + result);

		return result;

	}
	
	/**
	 * Metodo que devuelve una lista de precios de la base de datos por Id
	 * @param id
	 * @return
	 */
	public Precio findById(Integer id) {
		
		System.out.println("Method findById...");
		List<Object> allObject = genericRepository.getAllObjectFiltered("Precio.findById", "id", id);
		
		Precio result = !allObject.isEmpty() ? (Precio) (Object) allObject.get(0) : null;
		System.out.println("Lista de Precio: " + result);
		
		return result;
		
	}
	
	/**
	 * Metodo que valida si existe una lista de precios activa para el producto y proveedor a crear
	 * @param idSystem
	 * @param idProduct
	 * @param idProductRelation
	 * @return
	 */
	public Boolean isValidPriceList(Integer idProduct, Integer idProveedor) {

		System.out.println("Method validPriceList...");
		List<Object> allObject = genericRepository
				.getAllObjectByQuery("SELECT u FROM Precio u WHERE u.producto.id = '" 
						+ idProduct +"' AND u.proveedor.id = '"
						+ idProveedor +"' AND u.fechaFin IS NULL");

		Boolean result = !allObject.isEmpty() ? Boolean.FALSE : Boolean.TRUE;
		System.out.println("result: " + result);

		return result;

	}

}
