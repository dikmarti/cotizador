package cotizador.app;

import org.glassfish.hk2.utilities.binding.AbstractBinder;

import cotizador.model.repository.GenericRepository;
import cotizador.model.repository.ShapeRepository;
import cotizador.service.GenericService;
import cotizador.service.ModuleService;
import cotizador.service.PermissionService;
import cotizador.service.ProviderService;
import cotizador.service.SystemService;
import cotizador.service.UserService;

public class BinderApplication extends AbstractBinder {
    @Override
    protected void configure() {
        bind(ShapeRepository.class).to(ShapeRepository.class); 
        bind(GenericRepository.class).to(GenericRepository.class);
        bind(GenericService.class).to(GenericService.class);
        bind(UserService.class).to(UserService.class);
        bind(ModuleService.class).to(ModuleService.class);
        bind(PermissionService.class).to(PermissionService.class);
        bind(ProviderService.class).to(ProviderService.class);
        bind(SystemService.class).to(SystemService.class); 
    }
}
