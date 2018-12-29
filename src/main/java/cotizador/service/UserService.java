package cotizador.service;

import java.util.List;

import javax.inject.Inject;

import cotizador.model.domain.Usuario;
import cotizador.model.repository.GenericRepository;
import cotizador.utils.PasswordUtils;

public class UserService {

	@Inject
	GenericRepository genericRepository;
	
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
	
	public List<Usuario> retrieveAllUsers() {
		
		System.out.println("finding all user from data base");
		
		List<Object> allObject = genericRepository.getAllObject("SELECT u FROM Usuario u");
		
		List<Usuario> usersResult = !allObject.isEmpty() ? (List<Usuario>) (Object) allObject : null;
		
		return  usersResult;
	}
	
	
}
