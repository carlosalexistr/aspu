package co.edu.ufps.aspu.factory;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class PersistenceManager {
	private static final PersistenceManager singleton = new PersistenceManager();
	protected EntityManagerFactory emf;
	public static final boolean DEBUG = true;
	public static PersistenceManager getInstance() {
	    
	    return singleton;
	  }
	private PersistenceManager() {
	  }
	 
	  public EntityManagerFactory getEntityManagerFactory() {
	    
	    if (emf == null)
	      createEntityManagerFactory();
	    return emf;
	  }
	  public EntityManager getEntityManager() {
		  if (emf == null) {
			  createEntityManagerFactory();
		  }
		      
		return emf.createEntityManager();
		  
	  }
	  
	  public void closeEntityManagerFactory() {
	    
	    if (emf != null) {
	      emf.close();
	      emf = null;
	      if (DEBUG)
	        System.out.println("n*** Persistence finished at " + new java.util.Date());
	    }
	  }
	  
	  protected void createEntityManagerFactory() {
	    
	    this.emf = Persistence.createEntityManagerFactory("PERSISTENCE");
	    if (DEBUG)
	      System.out.println("n*** Persistence started at " + new java.util.Date());
	  }
}
