package tn.enis.entity;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.EqualsAndHashCode.Include;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
@ToString(exclude = { "compte" })

@Entity
@Table(name = "t_client")
public class Client implements Serializable /* Spec JEE */ {

	private static final long serialVersionUID = 1L;

	@Id // PK
	@Include
	private String cin;
	private String nom;
	private String prenom;
	private String adresse;
	// bidirectionnelle
	@OneToMany(mappedBy = "client", fetch = FetchType.EAGER)
	private List<Compte> comptes;

	public Client(String cin, String nom, String prenom, String adresse, List<Compte> comptes) {
		super();
		this.cin = cin;
		this.nom = nom;
		this.prenom = prenom;
		this.adresse = adresse;
		this.comptes = comptes;
	}

	public Client(String cin, String nom, String prenom, String adresse) {
		super();
		this.cin = cin;
		this.nom = nom;
		this.prenom = prenom;
		this.adresse = adresse;
	}

	// Hibernate.initialize(topics.getComments());

	public Client() {
		// TODO Auto-generated constructor stub
	}

	public String getCin() {
		return cin;
	}

	public void setCin(String cin) {
		this.cin = cin;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public List<Compte> getComptes() {
		return comptes;
	}

	public void setComptes(List<Compte> comptes) {
		this.comptes = comptes;
	}

	@Override
	public int hashCode() {
		return Objects.hash(cin);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Client other = (Client) obj;
		return Objects.equals(cin, other.cin);
	}

}
