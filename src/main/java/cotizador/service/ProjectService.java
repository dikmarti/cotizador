package cotizador.service;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.inject.Inject;

import org.apache.commons.collections.map.HashedMap;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.codehaus.jackson.map.ObjectMapper;

import cotizador.model.domain.Bloque;
import cotizador.model.domain.Metrado;
import cotizador.model.domain.Nivel;
import cotizador.model.domain.Proyecto;
import cotizador.model.domain.Sistema;
import cotizador.model.domain.enums.UnidadMedidaEnum;
import cotizador.model.domain.helpers.BloqueConfiguration;
import cotizador.model.domain.helpers.NivelConfiguration;
import cotizador.model.domain.helpers.ProductConfiguration;
import cotizador.model.domain.models.MetradoModel;
import cotizador.model.domain.models.ProjectModel;
import cotizador.model.repository.GenericRepository;

public class ProjectService {

	@Inject
	GenericRepository genericRepository;
	
	@Inject
	MetradoService metradoService;
	
	@Inject
	BloqueService bloqueService;
	
	@Inject
	NivelService nivelService;
	
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
				projectModel.setNombreProyecto(p.getNombreProyecto());
				projectModel.setFechaCreacion(p.getFechaCreacion() != null ? format.format(p.getFechaCreacion()) : "");
				projectModel.setFechaModificacion(p.getFechaModificacion() != null ? format.format(p.getFechaModificacion()) : "");
				projectModel.setFechaFin(p.getFechaFin() != null ? format.format(p.getFechaFin()) : "");
				
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
	
	/**
	 * Metodo que retorna los niveles de un proyecto de la base por id
	 * @param id
	 * @return
	 */
	public List<Nivel> findNivelesByIdProject(Integer id) {

		System.out.println("Method findNivelesByProjectId...");
		List<Object> allObject = genericRepository.getAllObjectFiltered("Metrado.findNivelesByIdProject", "idProyecto", id);

		List<Nivel> result = !allObject.isEmpty() ? (List<Nivel>) (Object) allObject : null;
		System.out.println("Lista metrados: " + result);

		return result;

	}
	
	public Integer generateVersion(String idProject) {
		System.out.println("Method generateVersion...");

		
		System.out.println("Duplicating project version from data base");
		if(!isValidProject(idProject)) {
			System.out.println("El sistema no tiene metrado..");
			return 1;
		}
		Proyecto project = findProjectById(Integer.parseInt(idProject));
		Proyecto newProject = duplicateProject(project);
		List<Nivel> levels = findNivelesByIdProject(Integer.parseInt(idProject));
		List<Nivel> newLevels = duplicateLevels(levels, newProject);
		
		System.out.println("Updating project version from data base");
		int status = genericRepository.executeUpdateQuery("UPDATE Proyecto u SET u.fechaFin = '" + new Date() + "', "
						+ "' WHERE u.id = '" + idProject + "'");
		
		System.out.println("finish system update");
		System.out.println("status: " + status);
		Integer result = status == 1 ? 0 : 2;
		
		return result;
		
	}
	
	private Proyecto duplicateProject(Proyecto oldProject) {
		Proyecto project = new Proyecto();
		
		project.setCargoContacto(oldProject.getCargoContacto());
		project.setCorreoContacto(oldProject.getCorreoContacto());
		project.setDireccion(oldProject.getDireccion());
		project.setFechaCreacion(new Date());
		project.setIdCrmMCO(oldProject.getIdCrmMCO());
		project.setLocalidad(oldProject.getLocalidad());
		project.setNombreContacto(oldProject.getNombreContacto());
		project.setNombreCliente(oldProject.getNombreCliente());
		project.setNombreProyecto(oldProject.getNombreProyecto());
		project.setRuc(oldProject.getRuc());
		project.setTelefonoContacto(oldProject.getTelefonoContacto());
		project.setTipoPrecio(oldProject.getTipoPrecio());
		
		Proyecto projectReturn = (Proyecto) genericRepository.addObject(project);

		return projectReturn;
	}
	
	private List<Nivel> duplicateLevels(List<Nivel> oldLevels, Proyecto project) {
		List<Nivel> levelsReturn = new ArrayList<Nivel>();
		
		for (Nivel nivel : oldLevels) {
			Nivel level = new Nivel();
			level.setDescripcion(nivel.getDescripcion());
			level.setNombre(nivel.getNombre());
			level.setOrden(nivel.getOrden());
			
			//TODO: ver donde se agrega el proyect xq ahora es bloque
			//level.setProyecto(project);
			
			Nivel newLevel = (Nivel) genericRepository.addObject(level);
			
			duplicateMetrado(nivel, newLevel);
			
			levelsReturn.add(newLevel);
		}
	
		return levelsReturn;
	}
	
	private void duplicateMetrado(Nivel oldLevel, Nivel level) {
		
		List<Metrado> allObject = (List<Metrado>) (Object) genericRepository
				.getAllObjectByQuery("SELECT u FROM Metrado m WHERE m.nivel.id = '"+ oldLevel +"'");
		
		for (Metrado metrado : allObject) {
			Metrado newMetrado = new Metrado();
			
			newMetrado.setCantidadProducto(metrado.getCantidadProducto());
			newMetrado.setIdParentProduct(metrado.getIdParentProduct());
			newMetrado.setMontoTotal(metrado.getMontoTotal());
			newMetrado.setNivel(level);
			newMetrado.setPrecio(metrado.getPrecio());
			newMetrado.setPrecioProducto(metrado.getPrecioProducto());
			
			genericRepository.addObject(newMetrado);
		}
	}
	
	private boolean isValidProject(String idProject) {
		System.out.println("Method isValidProject...");
		List<Object> allObject = genericRepository
				.getAllObjectByQuery("SELECT u FROM Metrado m, Nivel n WHERE n.proyecto.id = '" 
						+ idProject +"' AND m.nivel.id = n.id");

		Boolean result = !allObject.isEmpty() ? Boolean.FALSE : Boolean.TRUE;
		System.out.println("result: " + result);

		return result;
	}

	public File generateFile(String idProject) {
		try {
			Proyecto project = findProjectById(Integer.valueOf(idProject));
			
			String fileName = "Metrado Final.xls";
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet("Metrado");

			/**
			 * TODO: agregar cabecera estilos
			 */
			
			System.out.println("/get all metrado from dataBase by project");
			List<Metrado> allMetradoList = new ArrayList<Metrado>();
			Map<Integer, ProductConfiguration> productsMetrado = new HashMap<Integer, ProductConfiguration>();
			Map<Sistema, Map<Integer, ProductConfiguration>> productSystemMetrado = new HashMap<Sistema, Map<Integer, ProductConfiguration>>();

			try {
				
				allMetradoList = metradoService.getAllMetradoByProject(Integer.valueOf(idProject));
				
				List<BloqueConfiguration> bloqueConfigurations = new ArrayList<BloqueConfiguration>();
				BloqueConfiguration bloqueConfiguration = new BloqueConfiguration();
				
				List<NivelConfiguration> nivelConfigurations = new ArrayList<NivelConfiguration>();
				NivelConfiguration nivelConfiguration = new NivelConfiguration();
				
				Double total = 0.0;
				Double precioAcumProducto = 0.0;
				int tipoPrecio = project.getTipoPrecio();
				
				Sistema sistemaAnterior = new Sistema();
				
				List<Bloque> bloques = bloqueService.findBloqueByProject(Integer.valueOf(idProject));
				
				int maxCantNiveles = 0;
						
				for (Bloque bloque : bloques) {
					List<Nivel> listNivelesProject = nivelService.findNivelByBloque(Integer.valueOf(bloque.getId()));
					
					Collections.sort(listNivelesProject, new Comparator<Nivel>() {
					    @Override
					    public int compare(Nivel o1, Nivel o2) {
					        return Integer.valueOf(o1.getOrden()).compareTo(Integer.valueOf(o2.getOrden()));
					    }
					});	
					
					if (maxCantNiveles < listNivelesProject.size()) {
						maxCantNiveles = listNivelesProject.size();
					}
					
					bloqueConfiguration.setBloque(bloque);
					bloqueConfiguration.setNiveles(nivelConfigurations);
					
					bloqueConfigurations.add(bloqueConfiguration);
					
					bloqueConfiguration = new BloqueConfiguration();
					
					for (Metrado metrado : allMetradoList) {
						
						Double precioProducto = metrado.getPrecioProducto();
						Integer cantidadProducto = metrado.getCantidadProducto();
						double porcentajeResguardoProducto = metrado.getPrecio().getProducto().getPorcentajeResguardo();
						Double porcentajeHolguraTotal = 0.0;
						Double precioTotalPorNivel = 0.0;
						
						
						porcentajeHolguraTotal = (cantidadProducto * ( new Double (porcentajeResguardoProducto))) / 100.0;
						
						
						if (tipoPrecio > 0) {
							
							switch (tipoPrecio) {
								case 0:
									precioTotalPorNivel = metrado.getPrecio().getPrecioMinimo();
									break;
								case 1:
									precioTotalPorNivel = metrado.getPrecio().getPrecioMaximo();
									break;
								case 2:
									precioTotalPorNivel = metrado.getPrecio().getPrecioPromedio();
									break;
							}				
							
						} else {
							precioTotalPorNivel = precioProducto;
						}
						
						Double resultByNivel = (cantidadProducto + porcentajeHolguraTotal) * precioTotalPorNivel;
						
						total += resultByNivel;
						
						nivelConfiguration.setNivel(metrado.getNivel());
						nivelConfiguration.setPrecioTotalNivel(resultByNivel);
						
						Sistema sistema = metrado.getPrecio().getProducto().getSistema();
						int idProducto = metrado.getPrecio().getProducto().getId();
						
						if(sistemaAnterior.getId() != sistema.getId()) {
							productsMetrado = new HashMap<Integer, ProductConfiguration>();
						}
						
						if (!productsMetrado.containsKey(idProducto)) {

							ProductConfiguration productConfiguration = new ProductConfiguration(); 
							productConfiguration.setProducto(metrado.getPrecio().getProducto());
							productConfiguration.setPrecioTotalProducto(0.0);
							productsMetrado.put(idProducto, productConfiguration);
							precioAcumProducto = 0.0;
							nivelConfigurations = new ArrayList<NivelConfiguration>();
						}
							
						precioAcumProducto += resultByNivel;
						
						productsMetrado.get(idProducto).setPrecioTotalProducto(precioAcumProducto);
								
						nivelConfigurations.add(nivelConfiguration);
							
						nivelConfiguration = new NivelConfiguration();
											
						sistemaAnterior = sistema;
					
						productSystemMetrado.put(sistema, productsMetrado);
						
						productsMetrado.get(idProducto).getBloques().get(bloque.getId()).setNiveles(nivelConfigurations);
																
					}
										
					nivelConfigurations = new ArrayList<>();
				}
												
				// TODO: ver como se va a generr el archivo				
				//crearCabeceraNiveles(listNivelesProject, sheet);
				
				Boolean cabeceraNivelesCreada = false;
				int cantNivelesCreados = 0;
				Set<Entry<Sistema, Map<Integer, ProductConfiguration>>> entrySet = productSystemMetrado.entrySet();
				
				int fila = 8;
				int columna = 0;
				int columnasTotales = 0;
				/*
				for (Entry<Sistema, Map<Integer, ProductConfiguration>> entry : entrySet) {
					
					Sistema sistema = entry.getKey();
					Map<Integer, ProductConfiguration> productsBySystem = entry.getValue();
					
					// crear fila de sistema
					fila++;
					HSSFRow sistemaRow = sheet.createRow((short) fila);
					sistemaRow.createCell(0).setCellValue(sistema.getId());
					sistemaRow.createCell(1).setCellValue(sistema.getNombre());
								
					Set<Entry<Integer, ProductConfiguration>> entryProducts = productsBySystem.entrySet();
					
					
		
					for (Entry<Integer, ProductConfiguration> entry2 : entryProducts) {
						Integer idProduct = entry2.getKey();
						ProductConfiguration productConfiguration = entry2.getValue();
						
						List<NivelConfiguration> niveles = productConfiguration.getNiveles();
						
						Collections.sort(niveles, new Comparator<NivelConfiguration>() {
						    @Override
						    public int compare(NivelConfiguration o1, NivelConfiguration o2) {
						        return Integer.valueOf(o1.getNivel().getOrden()).compareTo(Integer.valueOf(o2.getNivel().getOrden()));
						    }
						});	
						
						columna = 0;
						
						// Escribir producto, unidad, niveles y el total por producto
						fila++;
						HSSFRow productoRow = sheet.createRow((short) fila);
						productoRow.createCell(columna).setCellValue(productConfiguration.getProducto().getIdProductoMCB());
						columna++;
						productoRow.createCell(columna).setCellValue(productConfiguration.getProducto().getNombre());
						columna++;
						productoRow.createCell(columna).setCellValue(getUnidadMedidaName(productConfiguration.getProducto().getUnidadMedida()));
						
						List<NivelConfiguration> nivelesProducto = productConfiguration.getNiveles();
						
						for (Nivel nivel : listNivelesProject) {
							columna++;
							for (NivelConfiguration nivelProd : nivelesProducto) {
								
								if(nivel.getId() == nivelProd.getNivel().getId()) {
									
									productoRow.createCell(columna).setCellValue(nivelProd.getPrecioTotalNivel());				
								}								
							}							
						}
						
						columna++;
						productoRow.createCell(maxCantNiveles+3).setCellValue(productConfiguration.getPrecioTotalProducto());
					}
				}
				
				*/
				// TODO: total se debe colocar al final del calculo en el excel
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("metradoList: " + allMetradoList);

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

	private void crearCabeceraNiveles(List<Nivel> listNivelesProject, HSSFSheet sheet) {
		
		HSSFRow cabeceraProducts = sheet.createRow((short) 8);
		cabeceraProducts.createCell(0).setCellValue("Codigo");
		cabeceraProducts.createCell(1).setCellValue("Descripción");
		cabeceraProducts.createCell(2).setCellValue("Unidad / Medida");
		
		int columna = 2;
		for (Nivel nivel : listNivelesProject) {
			columna++;
			cabeceraProducts.createCell(columna).setCellValue(nivel.getNombre());
		}
		
		columna++;
		cabeceraProducts.createCell(columna).setCellValue("TOTAL");
	
	}

	private String getUnidadMedidaName(int unidadMedida) {
		
		String unidad = String.valueOf(unidadMedida);
		
		if(UnidadMedidaEnum.LITROS.getValue().equals(unidad)) return "Litros";
		if(UnidadMedidaEnum.PULGADAS.getValue().equals(unidad)) return "Pulgadas"; 
		if(UnidadMedidaEnum.PIES.getValue().equals(unidad)) return "Pies"; 
		if(UnidadMedidaEnum.METROS.getValue().equals(unidad)) return "Metros"; 
		if(UnidadMedidaEnum.KILOMETROS.getValue().equals(unidad)) return "Kilómetros"; 
		if(UnidadMedidaEnum.YARDAS.getValue().equals(unidad)) return "Yardas"; 
		if(UnidadMedidaEnum.METROS_CUADRADOS.getValue().equals(unidad)) return "Metros cuadrados"; 
		if(UnidadMedidaEnum.METROS_CUBICOS.getValue().equals(unidad)) return "Metros cúbicos"; 
		if(UnidadMedidaEnum.ROLLOS.getValue().equals(unidad)) return "Rollos"; 
		if(UnidadMedidaEnum.UNIDAD.getValue().equals(unidad)) return "Unidad"; 
			
		return "";
	}


}
