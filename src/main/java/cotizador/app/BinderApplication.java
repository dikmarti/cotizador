package cotizador.app;

import org.glassfish.hk2.utilities.binding.AbstractBinder;


import cotizador.dao.shape.ShapeDAO;

public class BinderApplication extends AbstractBinder {
    @Override
    protected void configure() {
        bind(ShapeDAO.class).to(ShapeDAO.class); 
    }
}
