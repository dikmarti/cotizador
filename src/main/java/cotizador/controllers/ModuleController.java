package cotizador.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import cotizador.app.ApplicationSecureMap;
import cotizador.controllers.models.ModuloResponseModel;
import cotizador.model.domain.Modulo;
import cotizador.model.domain.models.UserModel;
import cotizador.service.ModuleService;

@Path("/modules")
@Produces(MediaType.TEXT_HTML)
public class ModuleController extends GenericController{

	@Inject
	ModuleService moduleService;

	@GET
    @Path("/all")	
	@Produces(MediaType.APPLICATION_JSON)
    public List<ModuloResponseModel> getModules(@Context HttpServletRequest httpRequest) {
		
		HttpSession httpSession = httpRequest.getSession();
		String usuarioLogueado = (String) httpSession.getAttribute(USUARIO_SESSION);
   						
		List<ModuloResponseModel> modules = new ArrayList<ModuloResponseModel>();
		
		List<Modulo> modulesByUser = new ArrayList<Modulo>();
		
		if(usuarioLogueado != null && !usuarioLogueado.isEmpty()) {
			
			List<ModuloResponseModel> modulesSession = (List<ModuloResponseModel>) httpSession.getAttribute("menu_"+usuarioLogueado);
			
			if(modulesSession != null && !modulesSession.isEmpty()) {
				modules = modulesSession;
			} else {
				modulesByUser = moduleService.getModulesByUser(usuarioLogueado); 
				
				ApplicationSecureMap appMap = new ApplicationSecureMap();
				Map<String, String> applicationsecuremap = appMap.getApplicationsecuremap();
				ModuloResponseModel moduloResponseModel = new ModuloResponseModel();
				
				for (Modulo moduloUser : modulesByUser) {
					String urlModulo = applicationsecuremap.get(moduloUser.getNombre());
					
					moduloResponseModel.setDescripcion(moduloUser.getNombre());
					moduloResponseModel.setNombre(moduloUser.getNombre());
					moduloResponseModel.setTipoModulo(moduloUser.getTipoModulo());
					moduloResponseModel.setUrl(urlModulo);
					
					modules.add(moduloResponseModel);					
					moduloResponseModel  = new ModuloResponseModel();
				}
				
				if(!modules.isEmpty()) { 
					
					ObjectMapper mapper = new ObjectMapper(); 
					String jsonModules = "";					
					
					try {
						
						jsonModules = mapper.writeValueAsString(modules);
						System.out.println("all_modules_json : "+ jsonModules);
						httpSession.setAttribute("all_modules_json" , jsonModules);
						httpSession.setAttribute("menu_"+ usuarioLogueado, modules);
						
					} catch (JsonGenerationException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (JsonMappingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				}
			}			
		}		
                     
        return modules;
    }
	
	@GET
    @Path("/allModules")	
	@Produces(MediaType.APPLICATION_JSON)
    public List<ModuloResponseModel> getAllModules(@Context HttpServletRequest httpRequest) {
		
		HttpSession httpSession = httpRequest.getSession();
		List<Modulo> allModules = moduleService.getAllModules(); 
		List<ModuloResponseModel> modules = new ArrayList<ModuloResponseModel>();
		
		ApplicationSecureMap appMap = new ApplicationSecureMap();
		Map<String, String> applicationsecuremap = appMap.getApplicationsecuremap();
		ModuloResponseModel moduloResponseModel = new ModuloResponseModel();
		
		for (Modulo modulo : allModules) {
			String urlModulo = applicationsecuremap.get(modulo.getNombre());
			
			moduloResponseModel.setDescripcion(modulo.getNombre());
			moduloResponseModel.setNombre(modulo.getNombre());
			moduloResponseModel.setTipoModulo(modulo.getTipoModulo());
			moduloResponseModel.setUrl(urlModulo);
			moduloResponseModel.setId(modulo.getId());
			
			modules.add(moduloResponseModel);					
			moduloResponseModel  = new ModuloResponseModel();
		}
		
		ObjectMapper mapper = new ObjectMapper(); 
		String jsonModules = "";					
		
		try {
			
			jsonModules = mapper.writeValueAsString(modules);
			System.out.println("json index modules " + jsonModules);
			httpSession.setAttribute("index_modules_json", jsonModules);		
			
		} catch (JsonGenerationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return modules;
	}
	
	@POST
	@Path("/updateModule")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Integer update(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/update json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, String> data = new HashMap<String, String>();

		try {

			data = mapper.readValue(jsonForm, Map.class);
			String id = data.get("id");
			String nombre = data.get("nombre");
			String descripcion = data.get("descripcion");
			
			Integer status = moduleService.updateModule(id, nombre, descripcion);

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