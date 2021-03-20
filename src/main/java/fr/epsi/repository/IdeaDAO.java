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

import fr.epsi.entity.Idea;
import fr.epsi.entity.User;

public class IdeaDAO implements IIdeaDAO{
	private EntityManager em;
	private UserTransaction utx;
	
	public IdeaDAO(EntityManager em, UserTransaction utx) {
		this.em = em;
		this.utx = utx;
	}
	
	public List<Idea> getIdeas() {
		return this.em.createQuery("select i from Idea i order by i.title", Idea.class)
				.getResultList();
	}

	public void addIdea(Idea idea) {
		try {
			this.utx.begin();
			this.em.persist(idea);
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

	public Idea getIdeaById(Long id) throws NoResultException {
		return this.em.createQuery("select i from Idea i where i.id = :id", Idea.class)
				.setParameter("id", id)
				.getSingleResult();
	}

	public Long getNbVoteIdea(Long id, String note) {
		Long tops = 0L;
		tops = (Long) this.em.
				createQuery("select count(v) from Idea i join i.votes v where v.note = :note and i.id = :id ")
				.setParameter("note", note)
				.setParameter("id", id)
				.getSingleResult();
		return tops;
	}
	
	public Long getNbIdeaByUserId(Long id) {
		Long nbIdea = 0L;
		nbIdea = (Long) this.em.
				createQuery("select count(i) from Idea i where i.user.id = :id")
				.setParameter("id", id)
				.getSingleResult();
		
		return nbIdea;
	}

}
