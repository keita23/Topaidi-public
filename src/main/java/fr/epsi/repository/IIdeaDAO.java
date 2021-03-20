package fr.epsi.repository;

import java.util.List;

import javax.persistence.NoResultException;

import fr.epsi.entity.Idea;

public interface IIdeaDAO {
	public List<Idea> getIdeas();
	public void addIdea(Idea idea);
	public Idea getIdeaById(Long id) throws NoResultException;
	/**
	 * Return le nombre de vote par type de vote (Top ou Flop) en fonction de l'idée
	 * @param id (id du idée)
	 * @param note (Top ou Flop)
	 * @return nombre de vote
	 */
	public Long getNbVoteIdea(Long id, String note);
	
	public Long getNbIdeaByUserId(Long id);
}
