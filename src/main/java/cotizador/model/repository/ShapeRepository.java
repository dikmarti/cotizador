package cotizador.model.repository;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import cotizador.model.domain.Cliente;
import cotizador.model.domain.shape.*;
 
public class ShapeRepository {
	
	EntityManager entityManager;
	
	
	public ShapeRepository() {

    	EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory( "persistence");
    	entityManager = entityManagerFactory.createEntityManager();
	}
	 
    public Shape addShape(Shape shape){
    	
    	entityManager.getTransaction().begin();	
    	Shape addShape = addShape(entityManager, shape);
    	
        entityManager.getTransaction().commit();
        entityManager.close();
        
       return addShape;
        
    }
    
    private Shape addShape(EntityManager entityManager, Shape shape){
        
    	entityManager.persist(shape);
    	entityManager.flush();
		
		return shape;
        
    }
    
    public Shape getShape(String id) {
    	
    	List<Shape> result = (List<Shape>)entityManager.createNamedQuery("Shape.findById").setParameter("id", Integer.parseInt(id))
    			.getResultList();
    	    	
    	entityManager.createQuery("SELECT c FROM Cliente c").getResultList();
    	entityManager.createQuery("SELECT m FROM Modulo m").getResultList();
    	entityManager.createQuery("SELECT n FROM Nivel n").getResultList();
    	entityManager.createQuery("SELECT p FROM Proveedor p").getResultList();
    	entityManager.createQuery("SELECT s FROM Sistema s").getResultList();
    	entityManager.createQuery("SELECT u FROM Usuario u").getResultList();
    	entityManager.createQuery("SELECT v FROM Validacion v").getResultList();
    	
    	entityManager.createQuery("SELECT p FROM Permiso p").getResultList();
    	entityManager.createQuery("SELECT p FROM Precio p").getResultList();
    	entityManager.createQuery("SELECT p FROM Producto p").getResultList();
    	entityManager.createQuery("SELECT p FROM Proyecto p").getResultList();
    	entityManager.createQuery("SELECT m FROM Metrado m").getResultList();
    	entityManager.createQuery("SELECT m FROM Marca m").getResultList();
    	
    	    	
    	return result.get(0);
    }
  
}
