package test.app;

import org.glassfish.jersey.server.ResourceConfig;

public class TestApplication extends ResourceConfig {
    public TestApplication() {
        // Define the package which contains the service classes.
        packages("test");
        register(new TestBinder());  
    }
}