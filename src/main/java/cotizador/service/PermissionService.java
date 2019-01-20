package cotizador.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import cotizador.controllers.models.PermisoResponseModel;
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
	
	public static SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy HH:mm");

	/**
	 * Retorna los permisos a modulos disponibles para un usuario
	 * @param login
	 * @return
	 */
	public List<PermisoResponseModel> permissionByUser(String login) {

		System.out.println("Method permissionByUser...");
		System.out.println("finding user permission from data base");
		
		List<Object> allObject = genericRepository.getAllObjectFiltered("Permiso.findByUser", "login", login);
		
		System.out.println("user permission found: " + allObject);
		
		@SuppressWarnings("unchecked")
		List<Permiso> permissionUser = !allObject.isEmpty() ? (List<Permiso>) (Object) allObject : null;
		List<PermisoResponseModel> permisoResponseModels = new ArrayList<PermisoResponseModel>();
		if(permissionUser != null && !permissionUser.isEmpty()) {
			for (Permiso p : permissionUser) {
				PermisoResponseModel permisoResponseModel = new PermisoResponseModel();
				permisoResponseModel.setid(p.getModulo().getId());
				permisoResponseModel.setNombre(p.getModulo().getNombre());
				permisoResponseModel.setFecha(format.format(p.getFechaAsignacion()));
				
				permisoResponseModels.add(permisoResponseModel);
			}
			return permisoResponseModels;
		}
		return null;
	}
	
	/**
	 * Retorna los modulos a los que el usuario no tiene permiso otorgado
	 * @param login
	 * @return
	 */
	public List<Modulo> modulesToUser(String login) {

		System.out.println("Method modulesToUser...");
		System.out.println("finding modules to user from data base");
		
		List<PermisoResponseModel> userPermissions = permissionByUser(login);
		List<Integer> userPermissionsModules = new ArrayList<Integer>();
		if (userPermissions != null && !userPermissions.isEmpty()) {
			
			for (PermisoResponseModel permiso : userPermissions) {
				userPermissionsModules.add(permiso.getId());
			}
			
		}
		System.out.println("User modules permissions: " + userPermissionsModules);
		
		System.out.println("finding all modules from data base");
		
		List<Modulo> allModules = moduleService.getAllModules(); 
		System.out.println("allModules: " + allModules);
		List<Modulo> modulesResult = new ArrayList<Modulo>();
		
		
		if(userPermissionsModules != null && !userPermissionsModules.isEmpty()) {
			for (Modulo modulo : allModules) {
				System.out.println("moduloUser: " + modulo.getNombre());
				System.out.println("allModulesfor: " + allModules);
				if(!userPermissionsModules.contains((Integer)modulo.getId())) {
					System.out.println("userPermissionsModules.contains(modulo.getId()): " + userPermissionsModules.contains(modulo.getId()));
					modulesResult.add(modulo);
				}
			}
			return modulesResult;
		}
		
		return allModules;
	}

	/**
	 * Metodo que agrega un permiso a un usuario en la base de datos
	 * @param login
	 * @param idModule
	 * @return
	 */
	public PermisoResponseModel addPermissionUser(String login, Integer idModule) {

		System.out.println("Method updatePermission...");
		System.out.println("finding user from data base");

		Usuario user = userService.findUserByLogin(login);
		
		System.out.println("finding module from data base");
		
		Modulo module = moduleService.getModuleById(idModule);
		
		Permiso permiso = new Permiso();
		permiso.setFechaAsignacion(new Date());
		permiso.setUsuario(user);
		permiso.setModulo(module);
		
		System.out.println("Creating permiso from data base");
		
		Permiso object = (Permiso) genericRepository.addObject(permiso);		
		
		System.out.println("finish permission create");
		
		if (object != null) {
			PermisoResponseModel permisoResponseModel = new PermisoResponseModel();
			permisoResponseModel.setid(object.getModulo().getId());
			permisoResponseModel.setNombre(object.getModulo().getNombre());
			permisoResponseModel.setFecha(format.format(object.getFechaAsignacion()));
			return permisoResponseModel;
		}
		
		return null;
	}
	
	/**
	 * Metodo que elimina un permiso a un usuario en la base de datos 
	 * @param login
	 * @param idModule
	 * @return
	 */
	public Boolean deletePermissionUser(String login, Integer idModule) {

		System.out.println("Method deletePermissionUser...");

		int deleted = genericRepository.executeUpdateQuery("DELETE FROM Permiso p WHERE p.usuario.id = '" + login 
						+"' AND p.modulo.id = '" + idModule + "'");

		System.out.println("permission user deleted: " + deleted);
		Boolean userResult = deleted == 1 ? Boolean.TRUE : Boolean.FALSE;

		return  userResult;
	}

}
