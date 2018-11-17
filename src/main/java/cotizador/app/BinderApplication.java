package cotizador.app;

import org.glassfish.hk2.utilities.binding.AbstractBinder;
import cotizador.model.repository.ShapeRepository;

public class BinderApplication extends AbstractBinder {
    @Override
    protected void configure() {
        bind(ShapeRepository.class).to(ShapeRepository.class); 
    }
}
