package cotizador.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import cotizador.model.domain.Modulo;
import cotizador.model.domain.Permiso;
import cotizador.model.domain.Usuario;
import cotizador.model.repository.GenericRepository;
import cotizador.utils.PasswordUtils;

public class ModuleService {

	@Inject
	GenericRepository genericRepository;
		
	public List<Permiso> getPermissionsByUser(String login) {
		
		List<Object> allObject = genericRepository.getAllObjectFiltered("Permiso.findByUser", "login", login);

		@SuppressWarnings("unchecked")
		List<Permiso> permissionResult = !allObject.isEmpty() ? (List<Permiso>) (Object) allObject : new ArrayList<Permiso>();
						
		return  permissionResult;
	}
	
	public List<Modulo> getModulesByUser(String login) {
		
		List<Permiso> permissionsByUser = getPermissionsByUser(login);
		
		List<Modulo> moduleList = new ArrayList<Modulo>(); 
		
		for (Permiso permiso : permissionsByUser) {
			moduleList.add(permiso.getModulo());
		}
		
		return  moduleList;
	}
	
	public List<Modulo> getAllModules() {
		
		List<Object> allObject = genericRepository.getAllObjectByNameQuery("Modulo.findAll");

		@SuppressWarnings("unchecked")
		List<Modulo> result = !allObject.isEmpty() ? (List<Modulo>) (Object) allObject : new ArrayList<Modulo>();						
	
		return  result;
	}
	
	
}
