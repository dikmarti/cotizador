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

import cotizador.model.domain.Proveedor;
import cotizador.model.domain.models.ProviderModel;
import cotizador.model.domain.models.UserModel;
import cotizador.service.ProviderService;

@Path("/provider")
@Produces(MediaType.TEXT_HTML)
public class ProviderController extends GenericController {

	@Inject
	ProviderService providerService;
	
	@GET
	@Path("/all")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Proveedor> allProviders() {

		System.out.println("/allProviders get all providers from dataBase");
		List<Proveedor> allProviders = new ArrayList<Proveedor>();

		try {
			allProviders = providerService.retrieveAllProviders();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("allProviders: " + allProviders);
		return allProviders;
	}

	@POST
	@Path("/createProvider")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Integer create(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/createProvider json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		ProviderModel providerModel = new ProviderModel();

		try {

			providerModel = mapper.readValue(jsonForm, ProviderModel.class);
			Integer status = providerService.createProvider(providerModel.getCodigo(), providerModel.getNombre(), 
					providerModel.getDireccion());
			
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
	@Path("/deleteProvider")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Integer delete(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/deleteProvider json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Integer> providerMap = new HashMap<String, Integer>();

		try {

			providerMap = mapper.readValue(jsonForm, Map.class);
			Integer id = providerMap.get("id");
			Integer deleted = providerService.deleteProvider(id);

			return deleted;

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
	@Path("/updateProvider")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Integer update(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/updateProvider json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		ProviderModel providerModel = new ProviderModel();

		try {

			providerModel = mapper.readValue(jsonForm, ProviderModel.class);
			
			Integer status = providerService.updateProvider(providerModel.getCodigo(), providerModel.getCodigoAnterior(),
					providerModel.getNombre(), providerModel.getDireccion(), providerModel.getId());

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