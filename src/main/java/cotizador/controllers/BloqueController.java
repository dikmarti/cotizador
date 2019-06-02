package cotizador.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import cotizador.model.domain.Bloque;
import cotizador.model.domain.Nivel;
import cotizador.model.domain.Proyecto;
import cotizador.model.domain.models.BloqueModel;
import cotizador.service.BloqueService;
import cotizador.service.NivelService;
import cotizador.service.ProjectService;

@Path("/bloque")
@Produces(MediaType.TEXT_HTML)
public class BloqueController extends GenericController {

	@Inject
	BloqueService bloqueService;
	
	@Inject
	ProjectService projectService;
	
	@Inject
	NivelService nivelService;
	
	@POST
	@Path("/createBloque")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Integer create(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/create bloque json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		BloqueModel bloqueModel = new BloqueModel();

		try {

			bloqueModel = mapper.readValue(jsonForm, BloqueModel.class);
			Bloque bloque = new Bloque();
			Proyecto proyecto = projectService.findProjectById(Integer.parseInt(bloqueModel.getIdProyecto()));
			
			bloque.setDescripcion(bloqueModel.getDescripcion());
			bloque.setNombre(bloqueModel.getNombre());
			bloque.setProyecto(proyecto);
						
			Integer idBloque = null;
			String idBloq = bloqueModel.getId();
			
			if(idBloq == null || idBloq.isEmpty()) {
				idBloque = ((Bloque) bloqueService.createBloque(bloque)).getId();	
			} else {
				bloque.setId(Integer.parseInt(idBloq));
				bloqueService.updateBloque(bloque);
				idBloque = bloque.getId();				
			}			

			return idBloque;

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
	@Path("/deleteBloque")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Boolean delete(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/deleteBloque json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Integer> providerMap = new HashMap<String, Integer>();

		try {

			providerMap = mapper.readValue(jsonForm, Map.class);
			Integer id = providerMap.get("idBloque");
			
			nivelService.deleteNivelByIdBloque(id);
			
			Boolean deleted = bloqueService.deleteBloque(id);

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
	@Path("/findBloqueByProject")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<BloqueModel> finBloqueByProject(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/findBloqueByProject json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, String> map = new HashMap<String, String>();
		List<BloqueModel> bloqueModelList = new ArrayList<BloqueModel>();
		
		try {

			map = mapper.readValue(jsonForm, Map.class);
			Integer idProject = Integer.valueOf(map.get("idProject"));
			List<Bloque> bloques = bloqueService.findBloqueByProject(idProject);
			System.out.println("bloques: " + bloques);
			BloqueModel bloqueModel = new BloqueModel();
			for (Bloque bloque : bloques) {
				
				List<Nivel> niveles = nivelService.findNivelByBloque(bloque.getId());
				
				bloqueModel.setId(String.valueOf(bloque.getId()));
				bloqueModel.setDescripcion(bloque.getDescripcion());
				bloqueModel.setNombre(bloque.getNombre());
				bloqueModel.setIdProyecto(String.valueOf(bloque.getProyecto().getId()));
				bloqueModel.setNiveles(niveles);
				
				bloqueModelList.add(bloqueModel);
				bloqueModel = new BloqueModel();
				
			}
			
			return bloqueModelList;

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