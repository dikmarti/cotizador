package cotizador.controllers;

import java.io.IOException;
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
import cotizador.model.domain.models.NivelModel;
import cotizador.service.BloqueService;
import cotizador.service.NivelService;
import cotizador.service.ProjectService;

@Path("/nivel")
@Produces(MediaType.TEXT_HTML)
public class NivelController extends GenericController {

	@Inject
	NivelService nivelService;
	
	@Inject
	BloqueService bloqueService;
	
	@POST
	@Path("/createNivel")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Integer create(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/createnivel json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		NivelModel nivelModel = new NivelModel();

		try {

			nivelModel = mapper.readValue(jsonForm, NivelModel.class);
			Nivel nivel = new Nivel();
			
			nivel.setDescripcion(nivelModel.getDescripcion());
			nivel.setNombre(nivelModel.getNombre());
			nivel.setOrden(Integer.parseInt(nivelModel.getOrden()));
			
			Bloque bloque = bloqueService.findBloqueById(Integer.parseInt(nivelModel.getIdBloque()));
			nivel.setBloque(bloque);
			
			Integer idNivel = null;
			String idNiv = nivelModel.getId();
			
			if(idNiv == null || idNiv.isEmpty()) {
				idNivel = ((Nivel) nivelService.createNivel(nivel)).getId();	
			} else {
				nivel.setId(Integer.parseInt(idNiv));
				nivelService.updateNivel(nivel);
				idNivel = nivel.getId();				
			}			

			return idNivel;

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
	@Path("/deleteNivel")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Boolean delete(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/deleteNivel json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Integer> providerMap = new HashMap<String, Integer>();

		try {

			providerMap = mapper.readValue(jsonForm, Map.class);
			Integer id = providerMap.get("idNivel");
			Boolean deleted = nivelService.deleteNivel(id);

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


}