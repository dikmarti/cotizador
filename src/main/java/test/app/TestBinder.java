package test.app;

import org.glassfish.hk2.utilities.binding.AbstractBinder;

import test.dao.shape.ShapeDAO;

public class TestBinder extends AbstractBinder {
    @Override
    protected void configure() {
        bind(ShapeDAO.class).to(ShapeDAO.class); 
    }
}
