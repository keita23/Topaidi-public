package fr.epsi.model;

import fr.epsi.entity.User;

public class UserModel implements Comparable<UserModel>{
	private User user;
	private Long nbIdea;
	
	public UserModel(User user, Long nbIdea) {
		this.setUser(user);
		this.setNbIdea(nbIdea);
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Long getNbIdea() {
		return nbIdea;
	}

	public void setNbIdea(Long nbIdea) {
		this.nbIdea = nbIdea;
	}

	public int compareTo(UserModel userMol) {
		return this.getNbIdea().compareTo(userMol.getNbIdea());
	}
}
