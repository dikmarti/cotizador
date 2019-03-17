package cotizador.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
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

import cotizador.model.domain.Nivel;
import cotizador.model.domain.Proyecto;
import cotizador.model.domain.models.ProjectModel;
import cotizador.service.ProjectService;

@Path("/project")
@Produces(MediaType.TEXT_HTML)
public class ProjectController extends GenericController {

	@Inject
	ProjectService projectService;
	
	@POST
	@Path("/createProject")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Integer create(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/createProject json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		ProjectModel projectModel = new ProjectModel();

		try {

			projectModel = mapper.readValue(jsonForm, ProjectModel.class);
			Proyecto proyecto = new Proyecto();
			
			proyecto.setIdCrmMCO(projectModel.getIdCrmMCO());
			proyecto.setNombreCliente(projectModel.getNombreCliente());
			proyecto.setRuc(projectModel.getRuc());
			proyecto.setNombre(projectModel.getNombre());
			proyecto.setLocalidad(projectModel.getLocalidad());
			proyecto.setMontoInversion(Double.parseDouble(projectModel.getMontoInversion()));
			proyecto.setMontoPresupuesto(Double.parseDouble(projectModel.getMontoPresupuesto()));
			proyecto.setNivelConstruccion(projectModel.getNivelConstruccion());
			proyecto.setAreaConstruccion(Float.parseFloat(projectModel.getAreaConstruccion()));
			proyecto.setSoporte(projectModel.getSoporte().equals("0") ? false : true);
			proyecto.setGarantia(projectModel.getGarantia().equals("0") ? false : true);
			proyecto.setTipoProyecto(projectModel.getTipoProyecto());
			proyecto.setCategoriaConstruccion(projectModel.getCategoriaConstruccion());
			proyecto.setPorcentajeHolgura(Float.parseFloat(projectModel.getPorcentajeHolgura()));
			proyecto.setTipoPrecio(Integer.parseInt(projectModel.getTipoPrecio()));
			proyecto.setFechaCreacion(new Date());
			
			Integer idProyecto = null;
			int idProj = projectModel.getId();
			
			if(idProj == 0) {
				idProyecto = ((Proyecto) projectService.createProject(proyecto)).getId();	
			} else {
				proyecto.setId(idProj);
				projectService.updateProject(proyecto);
				idProyecto = proyecto.getId();				
			}	
			
			return idProyecto;

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
	@Path("/deleteSystem")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Boolean delete(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/deleteSystem json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Integer> providerMap = new HashMap<String, Integer>();

		try {

			providerMap = mapper.readValue(jsonForm, Map.class);
			Integer id = providerMap.get("id");
			Boolean deleted = projectService.deleteSystem(id);

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
	
	@GET
	@Path("/all")
	@Produces(MediaType.APPLICATION_JSON)
	public List<ProjectModel> allProjects() {

		System.out.println("/all get all project from dataBase");
		List<ProjectModel> allProjects = new ArrayList<ProjectModel>();

		try {
			allProjects = projectService.retrieveAllProjects();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("allProjects: " + allProjects);
		return allProjects;
	}
	
	@SuppressWarnings("unchecked")
	@POST
	@Path("/byId")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Proyecto getProyectById(String jsonForm, @Context HttpServletRequest httpRequest) {
		
		System.out.println("/byId get project by id");
		Proyecto proyecto = new Proyecto();
		ObjectMapper mapper = new ObjectMapper();
		Map<String, String> providerMap = new HashMap<String, String>();

		try {

			providerMap = mapper.readValue(jsonForm, Map.class);
			Integer idProject = Integer.parseInt(providerMap.get("idProyecto"));
			proyecto = projectService.findProjectById(idProject);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("proyecto: " + proyecto);
		return proyecto;
	}
	
	
/*
	@POST
	@Path("/updateSystem")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Integer update(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/updateSystem json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		SystemModel systemModel = new SystemModel();

		try {

			systemModel = mapper.readValue(jsonForm, SystemModel.class);
			
			Integer status = projectService.updateSystem(systemModel.getNombre(), systemModel.getDescripcion(),
					systemModel.getElementos(), systemModel.getMateriales(), systemModel.getId());

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
*/

}