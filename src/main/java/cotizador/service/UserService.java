package cotizador.service;

import java.util.List;

import javax.inject.Inject;

import cotizador.model.domain.Usuario;
import cotizador.model.repository.GenericRepository;
import cotizador.utils.PasswordUtils;

public class UserService {

	@Inject
	GenericRepository genericRepository;

	/**
	 * Metodo que buscar un usuario en la base de datos
	 * 
	 * @param usuario
	 * @param clave
	 * @return
	 */
	public Usuario login(String usuario, String clave) {

		char[] charArrayPassword = clave.toCharArray();
		byte[] salt = new byte[20];	

		String claveEncriptada = PasswordUtils.hashPassword(charArrayPassword, salt);

		System.out.println("pass: " + claveEncriptada);

		List<Object> allObject = genericRepository.getAllObject("SELECT u FROM Usuario u WHERE u.login = '" + 
				usuario + "' AND u.clave = '" + claveEncriptada + "'");

		Usuario usuarioResult = !allObject.isEmpty() ? (Usuario)allObject.get(0) : null;

		return  usuarioResult;
	}

	/**
	 * Metodo que retorna la data de los usuarios existentes en la base de datos
	 * 
	 * @return
	 */
	public List<Usuario> retrieveAllUsers() {

		System.out.println("finding all user from data base");

		List<Object> allObject = genericRepository.getAllObject("SELECT u FROM Usuario u");

		List<Usuario> usersResult = !allObject.isEmpty() ? (List<Usuario>) (Object) allObject : null;

		return  usersResult;
	}

	/**
	 * Metodo que registra un nuevo usuario a la base de datos
	 * 
	 * @return
	 */
	public Integer createUser(String usuario, String login, String clave, String email, String telefono, String direccion,
			String cargo, int tipoUsuario) {

		System.out.println("Method createUser...");

		System.out.println("Verificando si el login no existe...");

		if(!validLogin(login)) {
			System.out.println("Ya existe login");
			return 1;
		}

		Usuario user = new Usuario();
		user.setNombre(usuario);
		user.setLogin(login);

		char[] charArrayPassword = clave.toCharArray();
		byte[] salt = new byte[20];	

		String claveEncriptada = PasswordUtils.hashPassword(charArrayPassword, salt);

		user.setClave(claveEncriptada);
		user.setEmail(email);
		user.setTelefono(telefono);
		user.setDireccion(direccion);
		user.setCargo(cargo);
		user.setTipoUsuario(tipoUsuario);

		System.out.println("Creating user from data base");
		Object object = genericRepository.addObject(user);

		Integer userResult = object != null ? 0 : 2;
		System.out.println("userResult: " + userResult);

		return  userResult;
	}

	/**
	 * Metodo que actualiza un usuario en la base de datos
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
	public void updateUser(String usuario, String login, String clave, String email, String telefono, String direccion,
			String cargo, int tipoUsuario) {

		System.out.println("Method updateUser...");

		Usuario user = new Usuario();
		user.setNombre(usuario);
		user.setLogin(login);

		char[] charArrayPassword = clave.toCharArray();
		byte[] salt = new byte[20];	

		String claveEncriptada = PasswordUtils.hashPassword(charArrayPassword, salt);

		user.setClave(claveEncriptada);
		user.setEmail(email);
		user.setTelefono(telefono);
		user.setDireccion(direccion);
		user.setCargo(cargo);
		user.setTipoUsuario(tipoUsuario);

		System.out.println("Updating user from data base");

		genericRepository.updateObject(user);

		System.out.println("finish user update");

	}

	/**
	 * Metodo que elimina un usuario de la base de datos
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
	public Boolean deleteUser(String login) {

		System.out.println("Method deleteUser...");

		int deleted = genericRepository.removeUserByLogin("DELETE FROM Usuario u WHERE u.login = '" + login +"'");

		System.out.println("deleted: " + deleted);
		Boolean userResult = deleted == 1 ? Boolean.TRUE : Boolean.FALSE;

		return  userResult;
	}

	public Boolean validLogin(String login) {

		System.out.println("Method validLogin...");
		List<Object> allObject = genericRepository.getAllObject("SELECT u FROM Usuario u WHERE u.login = '" + login +"'");

		Boolean result = !allObject.isEmpty() ? Boolean.FALSE : Boolean.TRUE;
		System.out.println("result: " + result);

		return result;

	}


}
