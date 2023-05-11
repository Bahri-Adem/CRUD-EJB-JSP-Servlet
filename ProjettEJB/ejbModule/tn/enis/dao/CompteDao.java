package tn.enis.dao;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import tn.enis.entity.Compte;

/**
 * Session Bean implementation class CompteDao
 */
@Singleton
@LocalBean
public class CompteDao {

	@PersistenceContext
	private EntityManager em;

	public void save(Compte compte) {
		em.persist(compte);
	}

	public void remove(Compte compte) {
		em.remove(em.contains(compte) ? compte : em.merge(compte));
		// em.remove(compte);
	}

	public void update(Compte compte) {
		em.merge(compte);
	}

	public Compte find(long rib) {
		return em.find(Compte.class, rib);
	}

	public List<Compte> findAll() {
		return em.createQuery("select c from Compte c", Compte.class).getResultList();
	}

	public List<Compte> findAllByCin(String cin) {
		return em.createQuery("select c from Compte c where id_client=':cin'", Compte.class).setParameter("cin", cin)
				.getResultList();
	}

	public void remove(long rib) {
		Compte compte = em.find(Compte.class, rib);
		em.remove(compte);
	}

	public CompteDao() {
		// TODO Auto-generated constructor stub
	}

}
