package cotizador.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import cotizador.model.domain.Modulo;
import cotizador.model.domain.Permiso;
import cotizador.model.domain.Usuario;
import cotizador.model.repository.GenericRepository;

public class PermissionService {

	@Inject
	GenericRepository genericRepository;
	
	@Inject
	UserService userService;
	
	@Inject
	ModuleService moduleService;

	/**
	 * Retorna los permisos a modulos disponibles para un usuario
	 * @param login
	 * @return
	 */
	public List<Permiso> permissionByUser(String login) {

		System.out.println("Method permissionByUser...");
		System.out.println("finding user from data base");
		
		Usuario user = userService.findUserByLogin(login);
		
		if(user == null) {
			return null;
		}
		
		System.out.println("finding user permission from data base");
		
		List<Object> allObject = genericRepository.getAllObjectFiltered("Permiso.findByUser", "login", user.getLogin());
		
		System.out.println("user permission found: " + allObject);
		
		@SuppressWarnings("unchecked")
		List<Permiso> permissionUser = !allObject.isEmpty() ? (List<Permiso>) (Object) allObject : null;
		
		return permissionUser;
	}
	
	/**
	 * Retorna los modulos a los que el usuario no tiene permiso otorgado
	 * @param login
	 * @return
	 */
	public List<Modulo> modulesToUser(String login) {

		System.out.println("Method modulesToUser...");
		System.out.println("finding modules to user from data base");
		
		List<Permiso> userPermissions = permissionByUser(login);
		List<Modulo> userPermissionsModules = new ArrayList<Modulo>();
		if (userPermissions != null && !userPermissions.isEmpty()) {
			
			for (Permiso permiso : userPermissions) {
				userPermissionsModules.add(permiso.getModulo());
			}
			
		}
		System.out.println("User modules permissions: " + userPermissionsModules);
		
		System.out.println("finding all modules from data base");
		
		List<Modulo> allModules = moduleService.getAllModules(); 
		System.out.println("allModules: " + allModules);
		List<Modulo> modulesResult = new ArrayList<Modulo>();
		
		
		if(userPermissionsModules != null && !userPermissionsModules.isEmpty()) {
			for (Modulo moduloUser : userPermissionsModules) {
				System.out.println("moduloUser: " + moduloUser.getNombre());
				System.out.println("allModulesfor: " + allModules);
				if(allModules.contains(moduloUser)) {
					System.out.println("allModules.contains(moduloUser): " + allModules.contains(moduloUser));
					allModules.remove(moduloUser);
				}
			}
			return allModules;
		}
		
		return allModules;
	}

	/**
	 * Metodo que actualiza los permisos de un usuario en la base de datos
	 * @param usuario
	 * @param login
	 * @param clave
	 * @param email
	 * @param telefono
	 * @param direccion
	 * @param cargo
	 * @param tipoUsuario
	 * @return
	 */
	public Integer updatePermission(String login) {

		System.out.println("Method updatePermission...");
		System.out.println("Updating user permission from data base");
		
		int status = genericRepository.executeUpdateQuery("UPDATE Permiso u SET u.login = '" + login + "' WHERE u.login = '" + login + "'");
		
		System.out.println("finish user permission update");
		System.out.println("status: " + status);
		Integer result = status == 1 ? 0 : 2;
		
		return result;
	}

}
