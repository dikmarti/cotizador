package cotizador.controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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
import cotizador.service.UserService;

@Path("/login")
@Produces(MediaType.TEXT_HTML)
public class LoginController extends GenericController{
	
	@Inject
	UserService userService;

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
			usuario = userService.login(loginForm.getUsuario(), loginForm.getClave());
			
			if(usuario != null) {				
				HttpSession httpSession = httpRequest.getSession();
				httpSession.setAttribute(USUARIO_SESSION, usuario.getLogin());
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
	
	@POST
    @Path("/out")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
    public Usuario logout(String jsonForm, @Context HttpServletRequest httpRequest) {
		
		ObjectMapper mapper=new ObjectMapper();
		try {
			String usuario = mapper.readValue(jsonForm, String.class);
			
			 System.out.println("/Logout json " + usuario);
		    	
		        if(usuario != null && !usuario.isEmpty()) {
		        	
		        	   System.out.println("/usuario no vacio " + usuario);
		        	HttpSession httpSession = httpRequest.getSession();
					String usuarioLogueado = (String) httpSession.getAttribute(USUARIO_SESSION);
					
					System.out.println("/usuario loggedd " + usuarioLogueado);
					
					if(usuario.equals(usuarioLogueado)) {
						
						System.out.println("/usuario session equals json " + usuario);
						httpSession.removeAttribute(USUARIO_SESSION);
						httpSession.removeAttribute("all_modules_json");
						httpSession.removeAttribute("menu_"+ usuarioLogueado);
						httpSession.removeAttribute("index_modules_json");	

					}
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
		}       
              
        return new Usuario();
    }
	
	@SuppressWarnings("unchecked")
	@POST
    @Path("/changePassword")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
    public Integer changePass(String jsonForm, @Context HttpServletRequest httpRequest) {
		
        System.out.println("/changePassword json form " + jsonForm);
    	ObjectMapper mapper=new ObjectMapper();
    	Map<String, String> map = new HashMap<String, String>();
    	
		try {
			
			map = mapper.readValue(jsonForm, Map.class);
			String usuario = map.get("usuario");
			String clave = map.get("clave");
			String claveNueva = map.get("claveNueva");
			
			Integer status = userService.changePassword(usuario, clave, claveNueva);
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