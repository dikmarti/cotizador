package cotizador.controllers;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import cotizador.model.domain.Modulo;
import cotizador.service.ModuleService;

@Path("/modules")
@Produces(MediaType.TEXT_HTML)
public class ModuleController extends GenericController{

	@Inject
	ModuleService moduleService;

	@GET
    @Path("/all")	
	@Produces(MediaType.APPLICATION_JSON)
    public List<Modulo> getModules(@Context HttpServletRequest httpRequest) {
		
		HttpSession httpSession = httpRequest.getSession();
		String usuarioLogueado = (String) httpSession.getAttribute(USUARIO_SESSION);
   		
		System.out.println("usuario logueado " + usuarioLogueado);		
		
       List<Modulo> modules = moduleService.getModulesByUser(usuarioLogueado);       
        
        return modules;
    }
  
}