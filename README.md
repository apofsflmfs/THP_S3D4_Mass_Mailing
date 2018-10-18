# Introduction
Bienvenue sur ce repo d'envoi d'emails et de follow en maaaaaaaasse. 

### Equipe
Projet THP mené par le __groupe 3 de Montpellier__ :
* Herve Lee
* Arthur Vouloir
* Thierry Delongueville
* Clement Baldy

### Les grandes lignes du programme
Ce programme a pour objectif d'interpeler les mairies de 3 départements: __Aude__, __Hérault__ et __Gard__.
Pour cela il va
1. Scrapper les emails de toutes les mairies de ces 3 départements
2. Les stocker dans un CSV bien rangé
3. Envoyer un email à chaque mairie
4. Trouver les mairies sur Twitter et les follow pour pouvoir les interpeller un peu


### Lancer le programme
* clonez ou downloadez le repo Github
* taper les lignes suivantes:
```$ bundle install```
```$ ruby app.rb```

# Arborescence des programmes
1. Un programme `townhalls_scrapper` va scrapper les emails de toutes les mairies de ces départements
2. Un programme `townhalls_adder_to_db` va passer ces emails dans une base de données (townhalls.csv)
3. Un programme `townhalls_mailer.rb` va envoyer un email à chacune de ces mairies
4. Un programme `townhalls_follower.rb` va compléter `townhalls.csv` avec les handles Twitter des mairies et les follow sur Twitter


# Mode d'emploi
Lancez la commande `$ ruby app.rb`
Utilisez ensuite l'interface du terminal pour lancer les différents programmes.

### gem utilisées :
* Gmail
* twitter
* pry
* csv


# Travail réalisé

###email envoyé:  
*Texte à compléter*

###nombre de mairies contactées  
*à compléter*

###Nom du compte Twitter utilisé pour le bot  
@ArthurVouloir
