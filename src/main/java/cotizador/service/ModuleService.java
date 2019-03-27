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
		genericRepository.getAllObjectByQuery("SELECT m FROM RelacionProducto m");
		
		/*genericRepository.getAllObjectByQuery("SELECT m FROM Proyecto m");
			genericRepository.getAllObjectByQuery("SELECT m FROM Sistema m");
		genericRepository.getAllObjectByQuery("SELECT m FROM Proyecto m");*/
		genericRepository.getAllObjectByQuery("SELECT m FROM Marca m");
		genericRepository.getAllObjectByQuery("SELECT m FROM Producto m");
		genericRepository.getAllObjectByQuery("SELECT m FROM Sistema m");
	
		
		return  result;
	}
	
	public Modulo getModuleById(Integer id) {
		
		List<Object> allObject = genericRepository.getAllObjectFiltered("Modulo.findById", "id", id);

		@SuppressWarnings("unchecked")
		Modulo result = !allObject.isEmpty() ? (Modulo) (Object) allObject.get(0) : null;						
	
		return  result;
	}
	
	/**
	 * Metodo que actualiza un modulo en la base de datos
	 * @param id
	 * @param nombre
	 * @param descripcion
	 * @return
	 */
	public Integer updateModule(String id, String descripcion, int orden) {

		System.out.println("Method updateModule...");
		System.out.println("Updating module from data base");


		int status = genericRepository.executeUpdateQuery("UPDATE Modulo u SET "
						+ "u.descripcion = '" + descripcion 
						+ "', u.orden = '" + orden 
						+ "' WHERE u.id = '" + id + "'");
		
		System.out.println("finish module update");
		System.out.println("status: " + status);
		Integer result = status == 1 ? 0 : 2;
		
		return result;
	}
	
	
}
