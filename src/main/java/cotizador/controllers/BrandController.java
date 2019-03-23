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

import cotizador.model.domain.Marca;
import cotizador.model.domain.models.SystemModel;
import cotizador.service.BrandService;

@Path("/brand")
@Produces(MediaType.TEXT_HTML)
public class BrandController extends GenericController {

	@Inject
	BrandService brandService;
	
	@GET
	@Path("/all")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Marca> allProviders() {

		System.out.println("/all get all brands from dataBase");
		List<Marca> allBrands = new ArrayList<Marca>();

		try {
			allBrands = brandService.retrieveAllBrand();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("allBrands: " + allBrands);
		return allBrands;
	}

	@POST
	@Path("/createBrand")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Integer create(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/createBrand json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		SystemModel systemModel = new SystemModel();

		try {

			systemModel = mapper.readValue(jsonForm, SystemModel.class);
			Integer status = brandService.createBrand(systemModel.getNombre(), systemModel.getDescripcion());
			
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
	@Path("/deleteBrand")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Integer delete(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/deleteBrand json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Integer> providerMap = new HashMap<String, Integer>();

		try {

			providerMap = mapper.readValue(jsonForm, Map.class);
			Integer id = providerMap.get("id");
			Integer status = brandService.deleteBrand(id);

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

	@POST
	@Path("/updateBrand")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Integer update(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/updateBrand json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		SystemModel systemModel = new SystemModel();

		try {

			systemModel = mapper.readValue(jsonForm, SystemModel.class);
			
			Integer status = brandService.updateBrand(systemModel.getNombre(), systemModel.getDescripcion(), systemModel.getId());

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