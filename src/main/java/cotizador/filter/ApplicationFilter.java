package cotizador.filter;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.ext.Provider;

import cotizador.app.ApplicationSecureMap;
import cotizador.controllers.GenericController;
import cotizador.controllers.models.ModuloResponseModel;
import cotizador.model.domain.Modulo;

@Provider
public class ApplicationFilter implements Filter {
    	
	private Pattern patternResources = Pattern.compile("(.)*((/resources/)|(/index)|(/login)|(/rest))(.)*");
	private ApplicationSecureMap appMap;
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
				
		String uri = ((HttpServletRequest) request).getRequestURI();
		
		System.out.println("request uri" + uri);
		
		Matcher matcher = patternResources.matcher(uri);
		//OJO con resources
				
		if(matcher.matches()) {
			//System.out.println("Es resources , login o index");
			chain.doFilter(request, response);
			return;
		}
		
		HttpSession httpSession = ((HttpServletRequest)request).getSession();
		String usuarioLogueado = (String) httpSession.getAttribute(GenericController.USUARIO_SESSION);
		
		appMap = new ApplicationSecureMap();
		Map<String, String> applicationsecuremap = appMap.getApplicationsecuremap();
		
	  if(usuarioLogueado != null && !usuarioLogueado.isEmpty()) {
		  List<ModuloResponseModel> modulesSession = (List<ModuloResponseModel>) httpSession.getAttribute("menu_"+usuarioLogueado);
		  
		  for (ModuloResponseModel modulo : modulesSession) {
			
			  String uriModule = ((HttpServletRequest) request).getContextPath() + "/" + applicationsecuremap.get(modulo.getNombre());
			  
			  if(uriModule.equals(uri)) {
				  chain.doFilter(request, response);
				  return;
			  }	else {
				  // Si la uri es una pagina dentro de un modulo
				  int lastIndexOf = uri.lastIndexOf('/');					  
				  String uriPage = uri.substring(lastIndexOf+1);
				  
				  String uriPermited = applicationsecuremap.get( modulo.getNombre() + "_" + uriPage);
				  
				  if(uriPermited != null) {
					  chain.doFilter(request, response);
					  return;
				  }			 		 
			  }	 
	  		
		  }
		  
	  }
		  //System.out.println("context path " + ((HttpServletRequest) request).getContextPath());
	  HttpServletResponse httpResponse = (HttpServletResponse) response;
	  httpResponse.sendRedirect(((HttpServletRequest) request).getContextPath() + "/index");
 
		chain.doFilter(request, response);
	}
}