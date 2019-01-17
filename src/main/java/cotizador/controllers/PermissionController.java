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

import cotizador.model.domain.Permiso;
import cotizador.model.domain.Usuario;
import cotizador.model.domain.models.UserModel;
import cotizador.service.PermissionService;
import cotizador.service.UserService;

@Path("/permission")
@Produces(MediaType.TEXT_HTML)
public class PermissionController extends GenericController {

	@Inject
	PermissionService permissionService;

	@POST
	@Path("/updatePermission")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Integer update(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/update json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		UserModel userModel = new UserModel();

		try {

			userModel = mapper.readValue(jsonForm, UserModel.class);
			
			Integer status = permissionService.updatePermission(userModel.getLogin());

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
	
	@POST
	@Path("/retrieveUserPermission")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Permiso> getUserPermission(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/retrieveUserPermission json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		UserModel userModel = new UserModel();

		try {

			userModel = mapper.readValue(jsonForm, UserModel.class);
			
			List<Permiso> permission = permissionService.permissionByUser(userModel.getLogin());
			
			if(permission == null) {
				return null;
			}
			
			return permission;
			
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