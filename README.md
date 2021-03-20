# Topaidi
Pour tester les algorithmes (classement Tops, classement Buzz et classement Brains)
Il faut importer la base de données dans le dossier (data/data-topaidi.sql)
Cette basse donnée contient les données suivantes :
- Les catégories des idées
- ideés
- votes
- utilisateurs


Ces données permettront de vérifier les algos demander dans le projet.
NB : je n'ai pas eu le temps de faire tous formulaires d'insertion (d'idée, de catégorie, vote).

J'ai mis en place la partie sécurité mais pour une raison que j'ignore le fichier standalone.xml n'a pas été généré correctement donc l'authentification rejetée. Je pense qu'avec votre standalone.xml ça doit marcher.

Au cas où l'authentification ne marche pas vous pouvez désactiver la partie sécurité dans le fichier web.xml pour tester le reste du programme.