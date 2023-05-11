# CRUD-EJB-JSP-Servlet
# <a name="_ohsy8ma3sa8t"></a>**Projet de CRUD pour la gestion des clients et des comptes**
Ce projet a été réalisé dans le cadre d'un cours pour développer un CRUD (Create, Read, Update, Delete) permettant de gérer les clients et les comptes bancaires. Le CRUD a été développé en utilisant les technologies suivantes : Java, JSP, Servlets, Bootstrap, AJAX, jQuery, Sweet Alert et jQuery UI Autocomplete.
## <a name="_wf3vgoajho0w"></a>**Fonctionnalités**
- Gestion des clients :
  - Création d'un client avec les informations suivantes : ID, nom, prénom et adresse.
  - Affichage de la liste des clients existants.
  - Mise à jour des informations d'un client existant.
  - Suppression d'un client existant.
- Gestion des comptes :
  - Création d'un compte avec les informations suivantes : RIB (Relevé d'Identité Bancaire) et solde.
  - Association d'un compte à un client existant (relation ManyToOne).
  - Affichage de la liste des comptes existants.
  - Mise à jour des informations d'un compte existant.
  - Suppression d'un compte existant.
##
## <a name="_ye46hbgbfgkn"></a><a name="_232g0kuslxtf"></a><a name="_rz1tz6758687"></a><a name="_yh628y6uy6yl"></a>**Technologies utilisées**
- Java
- JSP (JavaServer Pages)
- Servlets
- Bootstrap (version 5.1) -[ ](https://getbootstrap.com/docs/5.1/getting-started/introduction/)[Documentation](https://getbootstrap.com/docs/5.1/getting-started/introduction/)
- AJAX
- jQuery -[ ](https://code.jquery.com/jquery-3.6.0.min.js)[Documentation](https://code.jquery.com/jquery-3.6.0.min.js)
- Sweet Alert -[ ](https://sweetalert.js.org/guides/)[Documentation](https://sweetalert.js.org/guides/)
- jQuery UI Autocomplete -[ ](https://www.codeproject.com/Articles/152558/jQuery-UI-Autocomplete-with-ID)[Documentation](https://www.codeproject.com/Articles/152558/jQuery-UI-Autocomplete-with-ID)
## <a name="_hlkr8ztd200n"></a>**Instructions pour l'utilisation**
1. Clonez ce dépôt dans votre environnement de développement.
2. Configurez votre serveur web (par exemple, Apache Tomcat) pour exécuter le projet Java.
3. Importez la base de données fournie (database.sql) pour créer la structure de la base de données.
4. Démarrez le serveur web et accédez à l'application dans votre navigateur.
5. Utilisez l'interface pour gérer les clients et les comptes.
6. Pour la suppression d'un compte ou d'un client, un contrôle sera affiché grâce à Sweet Alert pour confirmer l'action avant de la finaliser.
