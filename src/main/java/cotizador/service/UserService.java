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
	public Boolean createUser(String usuario, String login, String clave, String email, String telefono, String direccion,
			String cargo, int tipoUsuario) {
		
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
		
		Boolean userResult = object != null ? Boolean.TRUE : Boolean.FALSE;
		
		return  userResult;
	}
	
	
}
