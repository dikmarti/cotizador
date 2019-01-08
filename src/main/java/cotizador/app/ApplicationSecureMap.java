package cotizador.app;

import java.util.HashMap;
import java.util.Map;

public class ApplicationSecureMap {
	 public static final Map<String, String> applicationSecureMap = new HashMap<String, String>();
	    static {
//Ajustar nombre jsp adm usuarios
	    	applicationSecureMap.put("Usuarios", "Cotizador/admUsuarios");
	        applicationSecureMap.put("Modulos", "Cotizador/admModulos");
	        applicationSecureMap.put("Permisos", "Cotizador/admPermisos");
	        applicationSecureMap.put("Sistemas", "Cotizador/admSistemas");
	        applicationSecureMap.put("Productos", "Cotizador/admProductos");
	        applicationSecureMap.put("Proveedores", "Cotizador/admProveedores");
	        applicationSecureMap.put("Modulos", "Cotizador/admModulos");
	        applicationSecureMap.put("Lista de Precios", "Cotizador/admListaPrecios");
	        applicationSecureMap.put("Metrado", "Cotizador/admMetrado");
	            
	    }
		public static Map<String, String> getApplicationsecuremap() {
			return applicationSecureMap;
		}    

}
