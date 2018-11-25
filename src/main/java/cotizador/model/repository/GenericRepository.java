package cotizador.model.repository;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
 
public class GenericRepository {
	
	EntityManager entityManager;
	
	
	public GenericRepository() {

    	EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory( "persistence");
    	entityManager = entityManagerFactory.createEntityManager();
	}
	 
    public Object addObject(Object object){
    	
    	entityManager.getTransaction().begin();	
    	Object objectSaved = addObject(entityManager, object);
    	
        entityManager.getTransaction().commit();
        entityManager.close();
        
       return objectSaved;
        
    }
    
    private Object addObject(EntityManager entityManager, Object object){
        
    	entityManager.persist(object);
    	entityManager.flush();
		
		return object;
        
    }
    
    public Object getObjectById(String id, String query) {
    	
    	List<Object> result = (List<Object>)entityManager.createNamedQuery(query)
			    			.setParameter("id", Integer.parseInt(id))
			    			.getResultList();    	    	
        	    	
    	return result.get(0);
    }
    
    public List<Object> getAllObject(String query, String parameter, Object parameterValue) {
    	System.out.println(query);
    	System.out.println(parameter);
    	System.out.println(parameterValue);
    	System.out.println(entityManager.createNamedQuery(query)
			    			.setParameter(parameter, parameterValue)
			    			.getResultList());
    	
    	List<Object> result = (List<Object>)entityManager.createQuery("SELECT m FROM Modulo m")
			    			.getResultList();  	
        	    	
    	return result;
    }
    public List<Object> getAllObjectFiltered(String query, String[] parameters, Object[] parametersValues) {
    	
    	/*List<Object> result = (List<Object>)entityManager.createNamedQuery(query)
			    			.setParameter("id", Integer.parseInt(id))
			    			.getResultList();    */	    	
        	    	
    	return null;
    }
  
}
