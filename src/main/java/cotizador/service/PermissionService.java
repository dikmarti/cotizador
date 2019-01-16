package cotizador.service;

import javax.inject.Inject;

import cotizador.model.repository.GenericRepository;

public class PermissionService {

	@Inject
	GenericRepository genericRepository;


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
