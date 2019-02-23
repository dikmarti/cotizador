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
import cotizador.model.domain.Precio;
import cotizador.model.domain.models.MetradoListModel;
import cotizador.model.domain.models.MetradoModel;
import cotizador.service.MetradoService;
import cotizador.service.NivelService;
import cotizador.service.PriceListService;

@Path("/metrado")
@Produces(MediaType.TEXT_HTML)
public class MetradoController extends GenericController {

	@Inject
	MetradoService metradoService;
	
	@Inject
	NivelService nivelService;
	
	@Inject
	PriceListService priceListService;
	
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
			List<Object> listMetrado = new ArrayList<Object>();
			
			for (MetradoModel metradoModel : listaMetrados) {
				Metrado metrado = new Metrado();
				
				int idNivel = Integer.parseInt(metradoModel.getNivel());								
				metrado.setNivel(nivelService.findNivelById(idNivel));
				
				metrado.setCantidadProducto(Integer.parseInt(metradoModel.getCantidad()));
				
				int idPrecioLista = Integer.parseInt(metradoModel.getPrecioLista());
				metrado.setPrecio(priceListService.findById(idPrecioLista));
				metrado.setPrecioProducto(Double.parseDouble(metradoModel.getPrecio()));
				
				listMetrado.add(metrado);
			}
						
			List<Object> listResult = ((List<Object>) metradoService.addAllMetrado(listMetrado));
			
			return listResult != null && !listResult.isEmpty()  ? 0 : 2;

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
	public List<Metrado> allMetradoByNivel(String jsonForm, @Context HttpServletRequest httpRequest) {
		
		System.out.println("/byNivel get all metrado from dataBase by nivel");
		List<Metrado> allMetradoList = new ArrayList<Metrado>();
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Integer> nivelMap = new HashMap<String, Integer>();

		try {

			nivelMap = mapper.readValue(jsonForm, Map.class);
			Integer idNivel = nivelMap.get("idNivel");
			allMetradoList = metradoService.findAllMetrado(idNivel);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("metradoList: " + allMetradoList);
		return allMetradoList;
	}

}