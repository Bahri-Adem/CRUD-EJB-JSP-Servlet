package tn.enis.dao;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Singleton;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import tn.enis.entity.Client;

/**
 * Session Bean implementation class CompteDao
 */
@Singleton
@LocalBean
public class ClientDao {

	@PersistenceContext
	private EntityManager em;

	public void save(Client client) {
		em.persist(client);
	}

	public void delete(Client client) {
		em.remove(em.contains(client) ? client : em.merge(client));
	}

	public void update(Client client) {
		em.merge(client);
	}

	public Client find(String cin) {
		return em.find(Client.class, cin);
	}

	public List<Client> findAll() {
		return em.createQuery("select c from Client c", Client.class).getResultList();
	}

	public void delete(String cin) {
		Client client = em.find(Client.class, cin);
		em.remove(client);

	}
	public ClientDao() {
		// TODO Auto-generated constructor stub
	}

}
