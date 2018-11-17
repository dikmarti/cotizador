package cotizador.app;

import org.glassfish.jersey.server.ResourceConfig;

public class ApplicationInitializing extends ResourceConfig {
    public ApplicationInitializing() {
        // Define the package which contains the service classes.
        packages("cotizador");
        register(new BinderApplication());  
    }
}