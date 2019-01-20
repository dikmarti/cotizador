package cotizador.app;

import java.util.HashMap;
import java.util.Map;

public class ApplicationSecureMap {
	 public static final Map<String, String> applicationSecureMap = new HashMap<String, String>();
	    static {
	    	applicationSecureMap.put("Usuarios", "admUsuarios");
	        applicationSecureMap.put("Modulos", "admModulos");
	        applicationSecureMap.put("Permisos", "admPermisos");
	        applicationSecureMap.put("Sistemas", "admSistemas");
	        applicationSecureMap.put("Productos", "admProductos");
	        applicationSecureMap.put("Proveedores", "admProveedores");
	        applicationSecureMap.put("Modulos", "admModulos");
	        applicationSecureMap.put("Lista de Precios", "admListaPrecios");
	        applicationSecureMap.put("Metrado", "admMetrado");
	        // Paginas dentros de los modulos
	        applicationSecureMap.put("Metrado_formProyecto", "formProyecto");
	            
	    }
		public static Map<String, String> getApplicationsecuremap() {
			return applicationSecureMap;
		}    

}
