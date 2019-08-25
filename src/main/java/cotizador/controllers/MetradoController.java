package cotizador.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import cotizador.model.domain.Metrado;
import cotizador.model.domain.RelacionProducto;
import cotizador.model.domain.models.MetradoListModel;
import cotizador.model.domain.models.MetradoModel;
import cotizador.service.MetradoService;
import cotizador.service.NivelService;
import cotizador.service.PriceListService;
import cotizador.service.ProjectService;
import cotizador.service.RelationService;

@Path("/metrado")
@Produces(MediaType.TEXT_HTML)
public class MetradoController extends GenericController {

	@Inject
	MetradoService metradoService;
	
	@Inject
	NivelService nivelService;
	
	@Inject
	PriceListService priceListService;
	
	@Inject
	RelationService relationService;
	
	@Inject
	ProjectService projectService;
	
	@POST
	@Path("/create")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Integer create(String jsonForm, @Context HttpServletRequest httpRequest) {

		System.out.println("/createMetrado json form " + jsonForm);
		ObjectMapper mapper = new ObjectMapper();
		
		MetradoListModel metradoListModel = new MetradoListModel();

		try {

			metradoListModel = mapper.readValue(jsonForm, MetradoListModel.class);
			
			MetradoModel[] listaMetrados = metradoListModel.getListaMetrados();
						
			List<Object> listMetradoNew = new ArrayList<Object>();
			List<Object> listMetradoModify = new ArrayList<Object>();
			
			
			for (MetradoModel metradoModel : listaMetrados) {
				Metrado metrado = new Metrado();
				
				int idNivel = Integer.parseInt(metradoModel.getNivel());								
				metrado.setNivel(nivelService.findNivelById(idNivel));
				
				metrado.setCantidadProducto(Integer.parseInt(metradoModel.getCantidad()));
				
				int idPrecioLista = Integer.parseInt(metradoModel.getPrecioLista());
				metrado.setPrecio(priceListService.findById(idPrecioLista));
				metrado.setPrecioProducto(Double.parseDouble(metradoModel.getPrecio()));
				
				if(metradoModel.getIdParentProduct() != null) {
					metrado.setIdParentProduct(Integer.parseInt(metradoModel.getIdParentProduct()));
				}				
				
				if(metradoModel.getId() != null && !metradoModel.getId().isEmpty()) {
					metrado.setId(Integer.parseInt(metradoModel.getId()));
					listMetradoModify.add(metrado);
				} else {
					listMetradoNew.add(metrado);	
				}
				
			}
			
			String listaProductosEliminados = metradoListModel.getListaMetradoEliminados();
			String eliminadosFinal = "";
			if(listaProductosEliminados != null && !listaProductosEliminados.isEmpty()) {
				String[] productosEliminados = listaProductosEliminados.split(",");
				
				Boolean isFirst = true;
				for (String prod : productosEliminados) {
					
					if (prod != null && !prod.isEmpty()) {
						
						eliminadosFinal += isFirst ? prod : "," + prod;						
						isFirst = false;
					}
				}
				
				metradoService.removeAllListId(eliminadosFinal);
			}
				
			List<Object> listResultNew = ((List<Object>) metradoService.addAllMetrado(listMetradoNew));
			List<Object> listResultModify = ((List<Object>) metradoService.modifyAllMetrado(listMetradoModify));			
			
			return listResultNew != null && listResultModify != null && (!listResultNew.isEmpty() || !listResultModify.isEmpty())   ? 0 : 2;

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
	@Path("/findByNivel")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<MetradoModel> allMetradoByNivel(String jsonForm, @Context HttpServletRequest httpRequest) {
		
		System.out.println("/byNivel get all metrado from dataBase by nivel");
		List<Metrado> allMetradoList = new ArrayList<Metrado>();
		ObjectMapper mapper = new ObjectMapper();
		Map<String, String> nivelMap = new HashMap<String, String>();
		List<MetradoModel> listMetradoModel = new ArrayList<MetradoModel>();

		try {
			System.out.println("ID NIVEL " + nivelMap.get("idNivel"));
			nivelMap = mapper.readValue(jsonForm, Map.class);
			Integer idNivel = Integer.valueOf(nivelMap.get("idNivel"));
			allMetradoList = metradoService.findAllMetrado(idNivel);
			
			if(allMetradoList != null) {
			
				for (Metrado metrado : allMetradoList) {
					MetradoModel metradoModel = new MetradoModel();
					metradoModel.setId(Integer.toString(metrado.getId()));
					metradoModel.setNivel(Integer.toString(metrado.getNivel().getId()));
					metradoModel.setSistema(Integer.toString(metrado.getPrecio().getProducto().getSistema().getId()));
					metradoModel.setProducto(Integer.toString(metrado.getPrecio().getProducto().getId()));
					metradoModel.setProveedor(Integer.toString(metrado.getPrecio().getProveedor().getId()));
					metradoModel.setPrecio(Double.toString(metrado.getPrecioProducto()));
					metradoModel.setCantidad(Integer.toString(metrado.getCantidadProducto()));
					metradoModel.setPrecioLista(Integer.toString(metrado.getPrecio().getId()));
					metradoModel.setNombreProducto(metrado.getPrecio().getProducto().getNombre());
					metradoModel.setNombreProveedor(metrado.getPrecio().getProveedor().getNombre());
					metradoModel.setNombreSistema(metrado.getPrecio().getProducto().getSistema().getNombre());
					
					if(metrado.getIdParentProduct() != null) {
						
						metradoModel.setIdParentProduct(Integer.toString(metrado.getIdParentProduct()));					
						RelacionProducto relacionProducto = relationService.findRelationByProducts(metrado.getPrecio().getProducto().getId(), metrado.getIdParentProduct());
						
						metradoModel.setFactor(relacionProducto.getFactor());
						metradoModel.setOperacion(Integer.toString(relacionProducto.getOperacion()));					
					}
					
					listMetradoModel.add(metradoModel);
				}
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("metradoList: " + allMetradoList);
		return listMetradoModel;
	}

	
}