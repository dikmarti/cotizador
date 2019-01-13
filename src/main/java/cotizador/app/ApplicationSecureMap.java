package cotizador.app;

import java.util.HashMap;
import java.util.Map;

public class ApplicationSecureMap {
	 public static final Map<String, String> applicationSecureMap = new HashMap<String, String>();
	    static {
//Ajustar nombre jsp adm usuarios
	    	applicationSecureMap.put("Usuarios", "testTemplateTable");
	        applicationSecureMap.put("Modulos", "admModulos");
	        applicationSecureMap.put("Permisos", "admPermisos");
	        applicationSecureMap.put("Sistemas", "admSistemas");
	        applicationSecureMap.put("Productos", "admProductos");
	        applicationSecureMap.put("Proveedores", "admProveedores");
	        applicationSecureMap.put("Modulos", "admModulos");
	        applicationSecureMap.put("Lista de Precios", "admListaPrecios");
	        applicationSecureMap.put("Metrado", "admMetrado");
	            
	    }
		public static Map<String, String> getApplicationsecuremap() {
			return applicationSecureMap;
		}    

}
