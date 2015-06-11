title: Modèle relationnel de données

## Chapitre III − Modèle relationnel de données

C'est l'interpretation d'un modèle de donnée afin de le rendre compatible 
avec un SGBD. (Système de Gestion de Bases de Données). 

Exemples de SGBD:

Open source:

* PostgreSQL
* Mysql

Propriétaire

* Access
* Microsoft SQL server
* Oracle

### I − Du MCD au Schémas relationnel 

On parle aussi de MLD, Modèle Logique de données. (=Schémas relationnel). 

Les propriétés deviennent des champs; les entités deviennent des tables, 
les identifiants d'associations deviennent des clés primaires, et la 
liaison des tables se fait avec des clés étrangères. Celles-ci seront soit 
simples, soit concaténées. Une occurence de propriété deviens une valeur 
et une occurence d'entité-association deviens un tuple (*uplet or n-uplet*). 

La traduction d'entités en tables: 

notation:

~~~
TABLE(_champid_, ... , champn)
# (champid est souligné)
~~~

Traduction des CIF en tables: 

Toute CIF (relation de 1 à 1) sera forcement traduite en un seul champ de 
type clé étrangère et sera ajoutée à la table originelle de la CIF. (*NB: 
l'entité la plus proche de la cardinalité 1,1*). Une clé étrangère est 
toujours suivie d'un dièse. 

~~~
JOCKEY(_id_jockey_, nom_jockey, prenom_jockey, id_cheval# )
                               clé étrangère ---^
~~~

Traduction des CIM en tables

Tout identifiant de CIM va devenir une clé primaire concatenée, composée 
d'un ensemble de clés étrangères. Si elle est porteuse de proprietés, 
elles deviendront des champs. 

~~~
PARTICIPER(_(id_course#, id_cheval#, date)_ , classement)
~~~

### II − Méthodologie

Un schémas relationnel joint des tables. Il ne peut y avoir de tables 
isolées dans un MLD. Elles sont forcement jointes craces aux ex-CIF ou CIM. 

Il y a trois regles à respecter:

* On ne peut joindre qu'une clé primaire avec une clé étrangère si 
    elles sont communes. 
* Les clés étrangères associées doivent forcement être de même type. 
* Toute clé étrangère doit partager ses valeurs avec la clé étrangère 
dont elle est issue. (*Contraite d'integrité référentielle*). 

### III − Le passage du MLD au MCD

### IV − Le langage SQL


####  LA COMMANDE SELECT

L'utilisation de la commande SELECT sur une table consiste à afficher sans 
restrictions l'intégralité des tuples de cette table.

Son rôle est de préparer les en-têtes de colonnes. 

Toute requête SQL se termine TOUJOURS par un ;point-virgule

~~~
SELECT champs1, ..., champsn
FROM .TABLE ;
~~~

Exemple:

~~~
SELECT Codecli, ..., ModCli
FROM CLIENT;
~~~

ou

~~~
SELECT *
FROM CLIENT;
~~~

#### La projection de champs

~~~
SELECT Nom_Cli, Tel_Cli 
FROM CLIENT;
~~~

~~~
SELECT [ALL,DISTINCT,ANY] champs1, ..., champsn 
FROM TABLE;
~~~

Par défaut, c'est l'opérateur `ALL` qui est utilisé. 

Pour selectionner 

~~~
SELECT DISTINCT AdVilleCli 
FROM CLIENT;
~~~

c)La sélection de tuples
Elle s'effectue grâce à des conditions et les conditions s'expriment toujours par la clause WHERE.
champs =,>,>=,<,<=,<> champs, valeur
Les conditions peuvent porter soit sur des valeurs de type numérique ou des chaines de caractères.
Pour les chaines de caractères, LIKE *,? ou encore %,_
Les ?? pour demander deux caractères, * pour tout caractères
ex: ??30* -> 2 caractères au début, contient "30", et n'importe quel caractère après.

NULL : saisie non obligatoire
NOT NULL : saisie obligatoire
DATE : Obligatoirement numérique
JJ/MM/AAAA
stocké comme 09/09/2014
Sous Micro$oft date entourée de ## (dièze)
sinon entourée de '' (simple quotes)
opérateur BETWEEN pour les dates
ex: SELECT NumCom FROM COMMANDE WHERE Datecom BETWEEN #01/09/2003# AND #30/09/2003#;
Un seul WHERE pour les conditions, mais autant de AND que souhaité
On peut forcer les conditions que l'on veut voir appliquées en premier en "cloisonant" avec des parenthèses.

Pour intéragir avec plusieurs tables, on utilisera les jointures.
C'est le fait d'associer deux tables. On associe une clé primaire et une clé étrangère. Il existe de multiplie, jointure gauche, droite, équijointure, jointure interne, jointure externe

-OBSOLETE-
(équijointure : quand la clé primaire est égale à la clé étrangère. CP=clé primaire, CE=clé étrangère
ex: SELECT champs1, ..., champsn FROM TABLE1, ..., TABLEn WHERE TABLE1.CP=TABLEn.CE AND CONDITIONS;)

-ACTUEL-
(jointure interne : INNERJOIN)
ex:
SELECT champs1, ..., champsn FROM TABLE1 INNERJOIN TABLEn ON TABLE1.CP=TABLEn.CE WHERE <conditions>;

On peut appeler la clé primaire directement au lieu de faire une TABLE1.cp et TABLEn.ce
On utilise cette technique pour rechercher une valeur qui est en rapport avec deux tables.
Alias pour donner un surnom a une table


Pour joindre plusieurs tables, on utilise plusieurs INNERJOIN.
SELECT * FROM PRODUIT AS P

Méthode équijointure
SELECT * FROM PRODUIT AS P,PORTER_SUR AS PS,COMMANDE AS C,CLIENT AS CL WHERE P.RefProd=PS.Refprod AND PS.NumCom=C.NumCom AND C.Codecli=CL.Codecli AND CodeCli=2;

Numérotation auto = incrémentation i++

Méthode INNERJOIN


### Les calculs en SQL

#### Les calculs simples

~~~
SELECT champs1 (+,-,*,/) champs,valeur AS alias, ..., champsn
FROM TABLE1,TABLE2 .../... ;
~~~

#### Les aggregats

Les aggregats 

~~~
AVG()   - Returns the average value
COUNT() - Returns the number of rows
FIRST() - Returns the first value
LAST()  - Returns the last value
MAX()   - Returns the largest value
MIN()   - Returns the smallest value
SUM()   - Returns the sum
~~~

Ces fonctions sont utilisées dans un attribut avec le `SELECT`. 

~~~
SELECT COUNT(*) AS NombredePdts 
FROM Produits;
~~~

#### Les agrégats regroupés

Condition nécessaire : avoir un agrégat dans le `SELECT`. 

~~~
SELECT SUM|COUNT|… ()
FROM …/…
WHERE …/…
GROUP BY <Champ de regroupement>;
~~~

#### Conditions sur les regroupements

C'est une opération qui permet de filtrer les résultats une fois les 
requêtes exécutées. 
