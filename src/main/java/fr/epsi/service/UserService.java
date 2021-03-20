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

import fr.epsi.entity.User;
import fr.epsi.model.UserModel;
import fr.epsi.repository.IdeaDAO;
import fr.epsi.repository.UserDAO;

@Stateless
@TransactionManagement(TransactionManagementType.BEAN)
public class UserService implements IUserService{
	@Resource
	private UserTransaction utx;
	@PersistenceContext
	private EntityManager em;
	
	
	public List<User> getUsers() {
		UserDAO uD = new UserDAO(em, utx);
		return uD.getUsers();
	}
	
	

	public void addUser(User user) {
		UserDAO uD = new UserDAO(em, utx);
		uD.addUser(user);
		
	}

	public User getUserById(Long id) throws NoResultException {
		UserDAO uD = new UserDAO(em, utx);
		return uD.getUserById(id);
	}



	public List<UserModel> getBrains() {
		//listes des 3 utilisteurs
		List<UserModel> brainsList = new ArrayList<UserModel>();
		
		
		//liste des utilisateurs
		List<User> users = this.getUsers();
		
		//liste pour contenir les 3 utilisateurs qui ont posté plus d'idées
		List<UserModel> usersModels = new ArrayList<UserModel>();
		
		//injection de IdeaDAO pour récupérer les idées
		IdeaDAO iD = new IdeaDAO(em, utx);
		
		for (int i = 0; i < users.size(); i++) {
			Long nbIdea = iD.getNbIdeaByUserId(users.get(i).getId()); // nombre d'idée par user
			UserModel ud = new UserModel(users.get(i), nbIdea); //création du model
			
			usersModels.add(ud);
		}
		
		//comparaison en fonction du nombre d'idée
		Collections.sort(usersModels, Collections.reverseOrder());
		
		//on stocke les 3 premiers utilisateurs
		for(int i = 0; i < usersModels.size(); i++) {
			if (i < 3) {
				brainsList.add(usersModels.get(i));
			}else {
				break;
			}
		}
		return brainsList;
	}

}
