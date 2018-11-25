package cotizador.app;

import org.glassfish.hk2.utilities.binding.AbstractBinder;

import cotizador.model.repository.GenericRepository;
import cotizador.model.repository.ShapeRepository;
import cotizador.service.GenericService;

public class BinderApplication extends AbstractBinder {
    @Override
    protected void configure() {
        bind(ShapeRepository.class).to(ShapeRepository.class); 
        bind(GenericRepository.class).to(GenericRepository.class);
        bind(GenericService.class).to(GenericService.class);
    }
}
