package cotizador.controllers;

import java.util.List;

import javax.inject.Inject;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;

import cotizador.model.domain.shape.Shape;
import cotizador.model.repository.ShapeRepository;
import cotizador.service.GenericService;
import cotizador.model.domain.shape.model.ShapeRootModel;
import cotizador.model.domain.shape.type.Circle;
import cotizador.model.domain.shape.type.Square;
import cotizador.model.domain.shape.type.Triangle;

@Path("/login")
@Produces(MediaType.TEXT_HTML)
public class LoginController {
	
	Logger log = Logger.getLogger(LoginController.class); 

	@Inject
	GenericService genericService;

	@POST
    @Path("/in")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
    public String index(String jsonForm) {
   
        System.out.println("/Login json form " + jsonForm);
        
        return jsonForm;
    }
	
	
  
}