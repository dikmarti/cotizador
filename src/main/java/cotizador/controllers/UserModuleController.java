package cotizador.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import cotizador.model.domain.Usuario;
import cotizador.model.domain.models.LoginModel;
import cotizador.model.domain.models.UserModel;
import cotizador.service.UserService;

@Path("/userModule")
@Produces(MediaType.TEXT_HTML)
public class UserModuleController extends GenericController{

	@Inject
	UserService userService;

	@GET
    @Path("/all")
	@Produces(MediaType.APPLICATION_JSON)
    public List<Usuario> allUsers() {
		
        System.out.println("/allUsers get all user from dataBase");
    	List<Usuario> allUsers = new ArrayList<Usuario>();
    	
		try {
			allUsers = userService.retrieveAllUsers();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}       
      System.out.println("allUsers: " + allUsers);
        return allUsers;
    }
	
	@POST
    @Path("/create")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
    public Boolean create(String jsonForm, @Context HttpServletRequest httpRequest) {
		
        System.out.println("/create json form " + jsonForm);
    	ObjectMapper mapper=new ObjectMapper();
    	UserModel userModel = new UserModel();
    	
		try {
			
			userModel = mapper.readValue(jsonForm, UserModel.class);
			Boolean created = userService.createUser(userModel.getNombre(), userModel.getLogin(), userModel.getClave(),
					userModel.getEmail(), userModel.getTelefono(), userModel.getDireccion(), userModel.getCargo(), 
					userModel.getTipoUsuario());
			
			if(created) {				
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