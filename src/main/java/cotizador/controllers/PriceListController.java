package cotizador.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import cotizador.model.domain.Precio;
import cotizador.model.domain.Producto;
import cotizador.model.domain.Proveedor;
import cotizador.model.domain.models.PriceListModel;
import cotizador.model.domain.models.PriceListResponseModel;
import cotizador.service.PriceListService;
import cotizador.service.ProductService;
import cotizador.service.ProviderService;

@Path("/priceList")
@Produces(MediaType.TEXT_HTML)
public class PriceListController extends GenericController {

	@Inject
	PriceListService priceListService;
	
	@Inject
	ProductService productService;
	
	@Inject
	ProviderService providerService;
	
	@GET
	@Path("/all")
	@Produces(MediaType.APPLICATION_JSON)
	public List<PriceListResponseModel> allProviders() {

		System.out.println("/all get all priceList from dataBase");
		List<PriceListResponseModel> allPriceList = new ArrayList<PriceListResponseModel>();

		try {
			allPriceList = priceListService.retrieveAllPriceList();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("allPriceList: " + allPriceList);
		return allPriceList;
	}

	@POST
	@Path("/createPriceList")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Integer create(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/createPriceList json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		PriceListModel priceListModel = new PriceListModel();

		try {

			priceListModel = mapper.readValue(jsonForm, PriceListModel.class);
			
			priceListModel = calculatePrices(priceListModel);
			
			Integer status = priceListService.createPriceList(mapToPrice(priceListModel));
			
			System.out.println("status: " + status);
			return status;

		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@POST
	@Path("/deletePriceList")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Boolean delete(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/deletePriceList json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Integer> providerMap = new HashMap<String, Integer>();

		try {

			providerMap = mapper.readValue(jsonForm, Map.class);
			Integer id = providerMap.get("id");
			Boolean deleted = priceListService.deletePriceList(id);

			System.out.println("deleted: " + deleted);
			if (deleted) {
				return Boolean.TRUE;
			} else {
				return Boolean.FALSE;
			}

		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@POST
	@Path("/updatePriceList")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Integer update(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/updatePriceList json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		PriceListModel priceListModel = new PriceListModel();

		try {

			priceListModel = mapper.readValue(jsonForm, PriceListModel.class);
			
			priceListModel = calculatePrices(priceListModel);
			
			Integer status = priceListService.updatePriceList(mapToPrice(priceListModel));

			System.out.println("status: " + status);
			return status;
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@POST
	@Path("/byProduct")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Precio> allPriceListByProduct(String jsonForm, @Context HttpServletRequest httpRequest) {
		
		System.out.println("/byProduct get all priceList from dataBase by product");
		List<Precio> allPriceList = new ArrayList<Precio>();
		ObjectMapper mapper = new ObjectMapper();
		Map<String, String> providerMap = new HashMap<String, String>();

		try {

			providerMap = mapper.readValue(jsonForm, Map.class);
			Integer idProduct = Integer.parseInt(providerMap.get("idProduct"));
			allPriceList = priceListService.findByProduct(idProduct);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("allPriceList: " + allPriceList);
		return allPriceList;
	}
	
	public PriceListModel calculatePrices(PriceListModel priceListModel) {
		
		List<Double> precios = new ArrayList<>();
		
		precios.add(Double.parseDouble(priceListModel.getPrecio1()));
		precios.add(Double.parseDouble(priceListModel.getPrecio2()));
		precios.add(Double.parseDouble(priceListModel.getPrecio3()));
		precios.add(Double.parseDouble(priceListModel.getPrecio4()));
		precios.add(Double.parseDouble(priceListModel.getPrecio5()));
		precios.add(Double.parseDouble(priceListModel.getPrecio6()));
		precios.add(Double.parseDouble(priceListModel.getPrecio7()));
		precios.add(Double.parseDouble(priceListModel.getPrecio8()));
		precios.add(Double.parseDouble(priceListModel.getPrecio9()));
		precios.add(Double.parseDouble(priceListModel.getPrecio10()));
		precios.add(Double.parseDouble(priceListModel.getPrecio11()));
		
		
		Collections.sort(precios, new Comparator<Double>() {
		    @Override
		    public int compare(Double o1, Double o2) {
		        return Double.valueOf(o1).compareTo(o2);
		    }
		});	
		
		priceListModel.setPrecioMinimo(String.valueOf(precios.get(0)));
		priceListModel.setPrecioMaximo(String.valueOf(precios.get(10)));
		
		Double sum = 0.0;
		
		for(Double precio: precios) {
			sum += precio;
		}
		
		Double promedio = sum / precios.size();
		
		priceListModel.setPrecioPromedio(String.valueOf(promedio));
		
		return priceListModel;
	}
	
	public Precio mapToPrice(PriceListModel priceListModel) {
		
		Precio precio = new Precio();
		
		precio.setId(priceListModel.getId());
		precio.setPrecio1(Double.parseDouble(priceListModel.getPrecio1()));
		precio.setPrecio2(Double.parseDouble(priceListModel.getPrecio2()));
		precio.setPrecio3(Double.parseDouble(priceListModel.getPrecio3()));
		precio.setPrecio4(Double.parseDouble(priceListModel.getPrecio4()));
		precio.setPrecio5(Double.parseDouble(priceListModel.getPrecio5()));
		precio.setPrecio6(Double.parseDouble(priceListModel.getPrecio6()));
		precio.setPrecio7(Double.parseDouble(priceListModel.getPrecio7()));
		precio.setPrecio8(Double.parseDouble(priceListModel.getPrecio8()));
		precio.setPrecio9(Double.parseDouble(priceListModel.getPrecio9()));
		precio.setPrecio10(Double.parseDouble(priceListModel.getPrecio10()));
		precio.setPrecioMinimoo(Double.parseDouble(priceListModel.getPrecioMinimo()));
		precio.setPrecioMaximo(Double.parseDouble(priceListModel.getPrecioMaximo()));
		precio.setPrecioPromedio(Double.parseDouble(priceListModel.getPrecioPromedio()));
		
		Producto producto = productService.findProductById(priceListModel.getProducto());
		precio.setProducto(producto);
		
		Proveedor proveedor = providerService.findProviderById(priceListModel.getProveedor());
		precio.setProveedor(proveedor);
		
		return precio;
	}

}