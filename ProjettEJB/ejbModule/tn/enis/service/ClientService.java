package tn.enis.service;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import tn.enis.dao.ClientDao;
import tn.enis.entity.Client;

/**
 * Session Bean implementation class ShopService
 */
@Stateless
@LocalBean
public class ClientService {
	@EJB
	private ClientDao clientDao;

	public void save(Client client) {
		clientDao.save(client);
	}

	public void delete(Client client) {
		clientDao.delete(client);
	}

	public void update(Client client) {
		clientDao.update(client);
	}

	public Client find(String cin) {
		return clientDao.find(cin);
	}

	public List<Client> findAll() {
		return clientDao.findAll();
	}
	public void delete(String cin) {
		clientDao.delete(cin);

	}
}
