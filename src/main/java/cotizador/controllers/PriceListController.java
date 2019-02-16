package cotizador.controllers;

import java.io.IOException;
import java.util.ArrayList;
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
import cotizador.model.domain.models.PriceListModel;
import cotizador.model.domain.models.PriceListResponseModel;
import cotizador.service.PriceListService;

@Path("/priceList")
@Produces(MediaType.TEXT_HTML)
public class PriceListController extends GenericController {

	@Inject
	PriceListService priceListService;
	
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
			Integer status = priceListService.createPriceList(priceListModel.getProducto(), 
					priceListModel.getProveedor(), priceListModel.getPrecioMinimo(), priceListModel.getPrecioMaximo(),
					priceListModel.getPrecioPromedio());
			
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
			
			Integer status = priceListService.updatePriceList(priceListModel.getPrecioMinimo(),
					priceListModel.getPrecioMaximo(), priceListModel.getPrecioPromedio(), priceListModel.getId());

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

}