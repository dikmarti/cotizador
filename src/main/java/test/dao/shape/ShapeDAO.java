package test.dao.shape;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import test.dao.shape.type.Circle;
import test.dao.shape.type.ShapeType;
import test.dao.shape.type.Square;
import test.dao.shape.type.Triangle;
 
public class ShapeDAO {
	
	EntityManager entityManager;
	
	
	public ShapeDAO() {

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
    	    	
    	return result.get(0);
    }
  
}
