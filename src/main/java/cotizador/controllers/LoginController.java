package cotizador.controllers;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import cotizador.model.domain.Usuario;
import cotizador.model.domain.models.LoginModel;
import cotizador.model.domain.shape.type.Circle;
import cotizador.service.LoginService;

@Path("/login")
@Produces(MediaType.TEXT_HTML)
public class LoginController {
	
	Logger log = Logger.getLogger(LoginController.class); 

	@Inject
	LoginService loginService;

	@POST
    @Path("/in")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
    public Usuario login(String jsonForm, @Context HttpServletRequest httpRequest) {
		
		
        System.out.println("/Login json form " + jsonForm);
    	ObjectMapper mapper=new ObjectMapper();
    	LoginModel loginForm = new LoginModel();
    	Usuario usuario = new Usuario();
    	
		try {
			
			loginForm = mapper.readValue(jsonForm, LoginModel.class);
			usuario = loginService.login(loginForm.getUsuario(), loginForm.getClave());
			
			if(usuario != null) {
				
				HttpSession httpSession = httpRequest.getSession();
				httpSession.setAttribute("usuario", usuario);
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
        
        return usuario;
    }
	
	
  
}