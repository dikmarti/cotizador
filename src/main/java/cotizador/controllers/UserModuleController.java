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

import cotizador.model.domain.Usuario;
import cotizador.model.domain.models.UserModel;
import cotizador.service.UserService;

@Path("/userModule")
@Produces(MediaType.TEXT_HTML)
public class UserModuleController extends GenericController {

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
	public Integer create(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/create json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		UserModel userModel = new UserModel();

		try {

			userModel = mapper.readValue(jsonForm, UserModel.class);
			Integer status = userService.createUser(userModel.getNombre(), userModel.getLogin(), userModel.getClave(),
					userModel.getEmail(), userModel.getTelefono(), userModel.getDireccion(), userModel.getCargo(),
					userModel.getTipoUsuario());
			
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

	@SuppressWarnings("unchecked")
	@POST
	@Path("/delete")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Boolean delete(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/delete json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, String> userLogin = new HashMap<String, String>();

		try {

			userLogin = mapper.readValue(jsonForm, Map.class);
			String login = userLogin.get("login");
			Boolean deleted = userService.deleteUser(login);

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

	@POST
	@Path("/update")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Integer update(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/update json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		UserModel userModel = new UserModel();

		try {

			userModel = mapper.readValue(jsonForm, UserModel.class);
			
			Integer status = userService.updateUser(userModel.getNombre(), userModel.getLogin(), userModel.getLoginAnterior(), userModel.getEmail(), 
					userModel.getTelefono(), userModel.getDireccion(), userModel.getCargo(), userModel.getClave(), userModel.getTipoUsuario());

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