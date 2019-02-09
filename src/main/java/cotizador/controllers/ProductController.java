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

import cotizador.model.domain.Producto;
import cotizador.model.domain.models.ProductModel;
import cotizador.service.ProductService;

@Path("/product")
@Produces(MediaType.TEXT_HTML)
public class ProductController extends GenericController {

	@Inject
	ProductService productService;
	
	@GET
	@Path("/all")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Producto> allProducts() {

		System.out.println("/all get all prodcut from dataBase");
		List<Producto> allProduct = new ArrayList<Producto>();

		try {
			allProduct = productService.retrieveAllProduct();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("allProduct: " + allProduct);
		return allProduct;
	}
	
	@SuppressWarnings("unchecked")
	@POST
	@Path("/bySystem")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Producto> allProductsBySystem(String jsonForm, @Context HttpServletRequest httpRequest) {
		
		System.out.println("/bySystem get all prodcut from dataBase by system");
		List<Producto> allProduct = new ArrayList<Producto>();
		ObjectMapper mapper = new ObjectMapper();
		Map<String, String> providerMap = new HashMap<String, String>();

		try {

			providerMap = mapper.readValue(jsonForm, Map.class);
			Integer idSystem = Integer.parseInt(providerMap.get("idSystem"));
			allProduct = productService.retrieveAllProductBySystem(idSystem);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("allProduct: " + allProduct);
		return allProduct;
	}

	@POST
	@Path("/createProduct")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Integer create(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/createSystem json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		ProductModel productModel = new ProductModel();

		try {

			productModel = mapper.readValue(jsonForm, ProductModel.class);
			Integer status = productService.createProduct(productModel.getIdMco(), productModel.getIdFabricante(), 
					productModel.getCodigo(), productModel.getNombre(), productModel.getNombreCorto(), 
					productModel.getDescripcion(), productModel.getPorcentajeResguardo(), productModel.getObservacion(), 
					productModel.getUnidadMedida(), productModel.getSistema());
			
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
	@Path("/deleteProduct")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Boolean delete(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/deleteProduct json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Integer> providerMap = new HashMap<String, Integer>();

		try {

			providerMap = mapper.readValue(jsonForm, Map.class);
			Integer id = providerMap.get("id");
			Boolean deleted = productService.deleteProduct(id);

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
	@Path("/updateProduct")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Integer update(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/updateSystem json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		ProductModel productModel = new ProductModel();

		try {

			productModel = mapper.readValue(jsonForm, ProductModel.class);
			
			Integer status = productService.updateProduct(productModel.getIdMco(), productModel.getIdFabricante(), 
					productModel.getCodigo(), productModel.getNombre(), productModel.getNombreCorto(), 
					productModel.getDescripcion(), productModel.getPorcentajeResguardo(), productModel.getObservacion(), 
					productModel.getUnidadMedida(), productModel.getSistema(), productModel.getId());

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


}