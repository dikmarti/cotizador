package cotizador.service;

import java.awt.Desktop;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.activation.MimetypesFileTypeMap;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

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


	 /* Metodo que modifica un nivel a la base de datos
	 * @param object
	 * @return
	 */
	public void updateProject(Object object) {

		System.out.println("Modifying project in data base");
		genericRepository.updateObject(object);		
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
	
	public File generateFile(String idProject) {
		try {
			Proyecto project = findProjectById(Integer.valueOf(idProject));
			
			String fileName = "Metrado Final.xls";
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet("Metrado");

			HSSFRow rowhead = sheet.createRow((short) 0);
			rowhead.createCell(0).setCellValue("Id");
			rowhead.createCell(1).setCellValue("Nombre Proyecto");
			rowhead.createCell(2).setCellValue("Nombre Cliente");
			rowhead.createCell(3).setCellValue("Localidad");

			HSSFRow row = sheet.createRow((short) 1);
			row.createCell(0).setCellValue(project.getId());
			row.createCell(1).setCellValue(project.getNombre());
			row.createCell(2).setCellValue(project.getNombreCliente());
			row.createCell(3).setCellValue(project.getLocalidad());

			FileOutputStream fileOut = new FileOutputStream(fileName);
			workbook.write(fileOut);
			fileOut.close();
			System.out.println("excel file has been generated!");

			//Code to download
			File fileToDownload = new File(fileName);
			return fileToDownload;

		} catch (Exception e) {
			System.out.println("Error al crear el archivo: " + e);
		}
		
		return null;
	}

}
