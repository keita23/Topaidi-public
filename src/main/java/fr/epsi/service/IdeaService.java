package fr.epsi.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;
import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.transaction.UserTransaction;

import fr.epsi.entity.Idea;
import fr.epsi.model.BuzzIdeaModel;
import fr.epsi.model.IdeaModel;
import fr.epsi.repository.IdeaDAO;

@Stateless
@TransactionManagement(TransactionManagementType.BEAN)
public class IdeaService implements IIdeaService{

	@Resource
	private UserTransaction utx;
	@PersistenceContext
	private EntityManager em;
	
	public List<Idea> getIdeas() {
		IdeaDAO iD = new IdeaDAO(em, utx);
		return iD.getIdeas();
	}

	public void addIdea(Idea idea) {
		IdeaDAO iD = new IdeaDAO(em, utx);
		iD.addIdea(idea);
	}

	public Idea getIdeaById(Long id) throws NoResultException {
		IdeaDAO iD = new IdeaDAO(em, utx);
		return iD.getIdeaById(id);
	}

	public List<IdeaModel> getTopsIdeas() {
		// une liste vide pour les 3 idées
		List<IdeaModel> ideas = new ArrayList<IdeaModel>();
		
		//la liste des idées de la base de donnéee
		List<Idea> listIdeas = this.getIdeas();
		
		List<IdeaModel> ideaModels = new ArrayList<IdeaModel>(); // liste des idées avec leurs pourcentages et vote top total
		
		for (int i = 0; i < listIdeas.size(); i++) {
			Long top = this.getNbVoteIdea(listIdeas.get(i).getId(), "Top"); //top total
			Long flop = this.getNbVoteIdea(listIdeas.get(i).getId(), "Flop"); //flop total
			Double votePourcent = 0D;
			
			if (top != 0) {
				votePourcent = ((double)top/(double)(top+ flop))*100;
				votePourcent = Math.ceil(votePourcent*1000)/1000;
			}
			
			IdeaModel ideaModel = new IdeaModel(listIdeas.get(i), votePourcent, top);
			//ajout de l'idée dans la liste de modele d'idée
			ideaModels.add(ideaModel);
		}
		
		//on classe les idées par order de  pourcentage décroissant/de vote/date de poste de l'idée
		Collections.sort(ideaModels, Collections.reverseOrder());
		//on stocke les 3 premières idées
		for(int i = 0; i < ideaModels.size(); i++) {
			if (i < 3) {
				ideas.add(ideaModels.get(i));
			}else {
				break;
			}
		}
		return ideas;
	}
	
	public List<BuzzIdeaModel> getBuzzIdeas() {
		//liste pour les 3 idées buzz
		List<BuzzIdeaModel> ideas = new ArrayList<BuzzIdeaModel>();
		
		//la liste des idées de la base de donnéee
		List<Idea> listIdeas = this.getIdeas();
		
		List<BuzzIdeaModel> buzzIdeaModels = new ArrayList<BuzzIdeaModel>(); // liste des idées avec nombre de vote
		
		
		for (int i = 0; i < listIdeas.size(); i++) {
			Long top = this.getNbVoteIdea(listIdeas.get(i).getId(), "Top"); //top total

			
			BuzzIdeaModel ideaModel = new BuzzIdeaModel(listIdeas.get(i),top);
			//ajout de l'idée dans la liste de modele d'idée
			buzzIdeaModels.add(ideaModel);
		}
		
		//comparaison pour avoir les 3 idées buzz
		
		Collections.sort(buzzIdeaModels, Collections.reverseOrder());
		
		for (int i = 0; i < buzzIdeaModels.size(); i++) {
			if (i < 3) {
				ideas.add(buzzIdeaModels.get(i));
			}else {
				break;
			}
		}
		
		return ideas;
	}

	public Long getNbVoteIdea(Long id, String note) {
		IdeaDAO iD = new IdeaDAO(em, utx);
		return iD.getNbVoteIdea(id, note);
	}


}
