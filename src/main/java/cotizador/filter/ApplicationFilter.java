package cotizador.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.ext.Provider;

@Provider
public class ApplicationFilter implements Filter {
    	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		System.out.println("BEGIN filter");
		
		System.out.println("request uri" + ((HttpServletRequest) request).getRequestURI());
		//OJO con resources
		
		// verificar uri 
		//1.- viene del jsp verificar mapa y desp verificar logueado
		//2.- viene del request de un rest verificar si esta logueado
		
		//desp si el user esta logueado verificar q modulos tiene acceso
		
		chain.doFilter(request, response);
		
	}
}