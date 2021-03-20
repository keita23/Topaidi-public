package fr.epsi.repository;

import java.util.List;

import javax.persistence.NoResultException;

import fr.epsi.entity.User;

public interface IUserDAO {
	public List<User> getUsers();
	public void addUser(User user);
	public User getUserById(Long id) throws NoResultException;
}
