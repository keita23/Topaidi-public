package fr.epsi.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.NotSupportedException;
import javax.transaction.RollbackException;
import javax.transaction.SystemException;
import javax.transaction.UserTransaction;

import fr.epsi.entity.User;

public class UserDAO implements IUserDAO{
	private EntityManager em;
	private UserTransaction utx;
	
	public UserDAO(EntityManager em, UserTransaction utx) {
		this.em = em;
		this.utx = utx;
	}
	
	
	
	public List<User> getUsers() {
		return this.em.createQuery("select u from User u order by u.name", User.class)
				.getResultList();
	}

	public void addUser(User user) {
		try {
			this.utx.begin();
			this.em.persist(user);
			this.utx.commit();
		} catch (NotSupportedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SystemException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RollbackException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (HeuristicMixedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (HeuristicRollbackException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public User getUserById(Long id) throws NoResultException {
		return this.em.createQuery("select u from User u where u.id = :id", User.class)
				.setParameter("id", id)
				.getSingleResult();
	}

}
