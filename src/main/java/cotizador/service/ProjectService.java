package cotizador.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import cotizador.model.domain.Precio;
import cotizador.model.domain.Proyecto;
import cotizador.model.domain.models.PriceListResponseModel;
import cotizador.model.domain.models.ProjectModel;
import cotizador.model.repository.GenericRepository;

public class ProjectService {

	@Inject
	GenericRepository genericRepository;
	
	public static SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy HH:mm");
	
	/**
	 * Retorna todos los proyectos existentes en la base de datos
	 * @return
	 */
	public List<ProjectModel> retrieveAllProjects() {

		System.out.println("finding all projects from data base");

		List<Object> allObject = genericRepository.getAllObjectByQuery("SELECT u FROM Proyecto u");

		List<Proyecto> result = !allObject.isEmpty() ? (List<Proyecto>) (Object) allObject : null;
		List<ProjectModel> projectModels = new ArrayList<ProjectModel>();
		if(result != null && !result.isEmpty()) {
			for (Proyecto p : result) {
				ProjectModel projectModel = new ProjectModel();
				projectModel.setId(p.getId());
				projectModel.setIdCrmMCO(p.getIdCrmMCO());
				projectModel.setNombreCliente(p.getNombreCliente());
				projectModel.setRuc(p.getRuc());
				projectModel.setLocalidad(p.getLocalidad());
				projectModel.setNombre(p.getNombre());
				projectModel.setFechaCreacion(p.getFechaCreacion() != null ? format.format(p.getFechaCreacion()) : "");
				projectModel.setFechaModificacion(p.getFechaModificacion() != null ? format.format(p.getFechaModificacion()) : "");
				
				projectModels.add(projectModel);
			}
			return projectModels;
		}
		return null;
	}

	/**
	 * Metodo que registra un nuevo sistema a la base de datos
	 * @param nombre
	 * @param descripcion
	 * @param elementos
	 * @param materiales
	 * @return
	 */
	public Object createProject(Object object) {

		System.out.println("Creating project in data base");
		Object result = genericRepository.addObject(object);
		
		return  result;
	}

	/**
	 * Metodo que actualiza un sistema en la base de datos
	 * @param nombre
	 * @param descripcion
	 * @param elementos
	 * @param materiales
	 * @param id
	 * @return
	 */
	public Integer updateProject(Proyecto proyecto) {

		/*System.out.println("Method updateProject...");
		
		int status = genericRepository.executeUpdateQuery("UPDATE Proyecto u SET u.nombre = '" + nombre + "', "
						+ "u.descripcion = '" + descripcion 
						+ "', u.elementos = '" + elementos 
						+ "', u.materiales = '" + materiales + "' WHERE u.id = '" + id + "'");
		
		System.out.println("finish system update");
		System.out.println("status: " + status);
		Integer result = status == 1 ? 0 : 2;
		
		return result;*/
		
		return null;
	}


	/**
	 * Metodo que elimina un proveedor de la base de datos
	 * @param id
	 * @return
	 */
	public Boolean deleteSystem(Integer id) {

		System.out.println("Method deleteSystem...");

		int deleted = genericRepository.executeUpdateQuery("DELETE FROM Sistema u WHERE u.id = '" + id +"'");

		System.out.println("deleted: " + deleted);
		Boolean systemResult = deleted == 1 ? Boolean.TRUE : Boolean.FALSE;

		return  systemResult;
	}
	
	/**
	 * Metodo que retorna un proyecto de la base por id
	 * @param id
	 * @return
	 */
	public Proyecto findProjectById(Integer id) {

		System.out.println("Method findProjectById...");
		List<Object> allObject = genericRepository.getAllObjectFiltered("Proyecto.findById", "id", id);

		Proyecto result = !allObject.isEmpty() ? (Proyecto) (Object) allObject.get(0) : null;
		System.out.println("Proyecto: " + result);

		return result;

	}

}
