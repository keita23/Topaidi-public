package fr.epsi.service;

import java.util.List;

import javax.persistence.NoResultException;

import fr.epsi.entity.User;
import fr.epsi.model.UserModel;

public interface IUserService {
	public List<User> getUsers();
	public void addUser(User user);
	public User getUserById(Long id) throws NoResultException;
	public List<UserModel> getBrains();
}
