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
    
    public List<Object> addAllObject(List<Object> listObject){
    	
    	entityManager.getTransaction().begin();	
    	List<Object> objectSaved = addAllObject(entityManager, listObject);
    	
        entityManager.getTransaction().commit();
        //entityManager.close();
        
       return objectSaved;
        
    }
    
    public List<Object> modifyAllObject(List<Object> listObject){
    	
    	entityManager.getTransaction().begin();	
    	List<Object> objectSaved = modifyAllObject(entityManager, listObject);
    	
        entityManager.getTransaction().commit();
        //entityManager.close();
        
       return objectSaved;
        
    }
    
    public void updateObject(Object object){
    	
    	entityManager.getTransaction().begin();	
    	entityManager.merge(object);
        entityManager.getTransaction().commit();
        entityManager.close();
        
    }
    
    public Object removeObject(Object object){
    	
    	entityManager.getTransaction().begin();	
    	Object objectRemoved = removeObject(entityManager, object);
    	
        entityManager.getTransaction().commit();
        entityManager.close();
        
       return objectRemoved;
        
    }
    
    private List<Object> addAllObject(EntityManager entityManager, List<Object> listObject){
        
    	for (Object object : listObject) {
    		entityManager.persist(object);
        	entityManager.flush();
		}
    	
		return listObject;
        
    }
    
    private List<Object> modifyAllObject(EntityManager entityManager, List<Object> listObject){
        
    	for (Object object : listObject) {
    		entityManager.merge(object);
        	entityManager.flush();
		}
    	
		return listObject;
    }    

    private Object addObject(EntityManager entityManager, Object object){
        
    	entityManager.persist(object);
    	entityManager.flush();
		
		return object;
        
    }
    
    private Object removeObject(EntityManager entityManager, Object object){
        
    	entityManager.remove(object);
    	entityManager.flush();
		
		return object;
        
    }
    
    public int executeUpdateQuery(String query){
    	
    	entityManager.getTransaction().begin();	
    	int result = entityManager.createQuery(query).executeUpdate();  	

    	entityManager.getTransaction().commit();
        entityManager.close();
        	    	
    	return result;
    	
    }
    
    public Object getObjectById(String id, String query) {
    	
    	@SuppressWarnings("unchecked")
		List<Object> result = (List<Object>)entityManager.createNamedQuery(query)
			    			.setParameter("id", Integer.parseInt(id))
			    			.getResultList();    	    	
        	    	
    	return result.get(0);
    }

    public Object removeObjectByListId(String listId, String query) {
    	
    	@SuppressWarnings("unchecked")
		List<Object> result = (List<Object>)entityManager.createNamedQuery(query)
			    			.setParameter("id", listId)
			    			.getResultList();    	    	
        	    	
    	return result.get(0);
    }
    
    public List<Object> getAllObjectByNameQuery(String query) {
     	
    	@SuppressWarnings("unchecked")
		List<Object> result = (List<Object>)entityManager.createNamedQuery(query)
			    			.getResultList();  	
        	    	
    	return result;
    }
    
    public List<Object> getAllObjectByQuery(String query) {
     	
    	@SuppressWarnings("unchecked")
		List<Object> result = (List<Object>)entityManager.createQuery(query)
			    			.getResultList();  	
        	    	
    	return result;
    
    }
    
    public List<Object> getAllObjectFiltered(String query, String filter, Object parameterValue) {
    	
    	System.out.println("query " + query);
    	System.out.println("filter " + filter);
    	System.out.println("parameterValue " + parameterValue);
    	
    	@SuppressWarnings("unchecked")
		List<Object> result = (List<Object>)entityManager.createNamedQuery(query)
			    			.setParameter(filter, parameterValue)
			    			.getResultList();   

    	System.out.println("result " + result);
    	return result;
    }
    
    public List<Object> getAllObjectFilteredParams(String query, String filter, String filterTwo, Object parameterValueTwo, Object parameterValue) {
    	
    	System.out.println("query " + query);
    	System.out.println("filter " + filter);
    	System.out.println("parameterValue " + parameterValue);
    	
    	@SuppressWarnings("unchecked")
		List<Object> result = (List<Object>)entityManager.createNamedQuery(query)
			    			.setParameter(filter, parameterValue)
			    			.setParameter(filterTwo, parameterValueTwo)
			    			.getResultList();   

    	System.out.println("result " + result);
    	return result;
    }
}
