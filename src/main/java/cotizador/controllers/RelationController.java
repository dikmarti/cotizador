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

import cotizador.model.domain.RelacionProducto;
import cotizador.model.domain.models.RelationModel;
import cotizador.service.RelationService;

@Path("/relation")
@Produces(MediaType.TEXT_HTML)
public class RelationController extends GenericController {

	@Inject
	RelationService relationService;
	
	@GET
	@Path("/all")
	@Produces(MediaType.APPLICATION_JSON)
	public List<RelacionProducto> allProviders() {

		System.out.println("/all get all relationProduct from dataBase");
		List<RelacionProducto> allRelations = new ArrayList<RelacionProducto>();

		try {
			allRelations = relationService.retrieveAllRelation();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("allRelations: " + allRelations);
		return allRelations;
	}

	@POST
	@Path("/createRelation")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Integer create(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/createRelation json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		RelationModel relationModel = new RelationModel();

		try {

			relationModel = mapper.readValue(jsonForm, RelationModel.class);
			Integer status = relationService.createRelation(relationModel.getSistema(), relationModel.getProducto(), 
					relationModel.getProductoRelacion(), relationModel.getFactor(), relationModel.getOperacion());
			
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
	@Path("/deleteRelation")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Boolean delete(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/deleteRelation json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Integer> relationMap = new HashMap<String, Integer>();

		try {

			relationMap = mapper.readValue(jsonForm, Map.class);
			Integer id = relationMap.get("id");
			
			Boolean deleted = relationService.deleteRelation(id);

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

	@SuppressWarnings("unchecked")
	@POST
	@Path("/updateRelation")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Integer update(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/updateSystem json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, String> relationMap = new HashMap<String, String>();

		try {

			relationMap = mapper.readValue(jsonForm, Map.class);
			Integer id = Integer.parseInt(relationMap.get("id"));
			String factor = relationMap.get("factor");
			Integer operacion = Integer.parseInt(relationMap.get("operacion"));
			
			Integer status = relationService.updateRelation(factor, operacion, id);

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