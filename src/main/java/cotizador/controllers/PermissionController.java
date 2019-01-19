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

import cotizador.controllers.models.PermisoResponseModel;
import cotizador.model.domain.Modulo;
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
	@Path("/addPermission")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public PermisoResponseModel create(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/update json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, String> data = new HashMap<String, String>();

		try {

			data = mapper.readValue(jsonForm, Map.class);
			String login = data.get("login");
			String module = data.get("modulo");
			
			PermisoResponseModel permiso = permissionService.addPermissionUser(login, Integer.valueOf(module));

			System.out.println("permiso: " + permiso);
			if(permiso != null) {
				return permiso;
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
	@Path("/retrieveUserPermission")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<PermisoResponseModel> getUserPermission(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/retrieveUserPermission json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, String> userLogin = new HashMap<String, String>();

		try {

			userLogin = mapper.readValue(jsonForm, Map.class);
			String login = userLogin.get("login");
			
			List<PermisoResponseModel> permission = permissionService.permissionByUser(login);
			
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
	
	@SuppressWarnings("unchecked")
	@POST
	@Path("/modulesToUser")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Modulo> getModulesToUser(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/modulesToUser json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, String> userLogin = new HashMap<String, String>();

		try {

			userLogin = mapper.readValue(jsonForm, Map.class);
			String login = userLogin.get("login");
			
			List<Modulo> modules = permissionService.modulesToUser(login);
			
			if(modules == null) {
				return null;
			}
			
			return modules;
			
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