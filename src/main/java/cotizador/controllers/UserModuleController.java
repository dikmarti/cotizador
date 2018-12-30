package cotizador.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.log4j.Logger;

import cotizador.model.domain.Usuario;
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
  
}