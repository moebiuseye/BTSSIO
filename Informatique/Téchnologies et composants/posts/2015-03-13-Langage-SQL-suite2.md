title: Langage SQL, Contraintes

### I − CREATE

<small>Cette partie est incomplète.</small>

~~~SQL
CREATE SCHEMA <nom>;
CREATE DATABASE <nom>;
CREATE TABLE <nom>
    (Attr1 TYPE,
     Attr2 TYPE);
~~~

### II − Ajouter des contraintes

Les contraintes en SQL permettent de déterminer le comportement des 
structures de la base de données. 

On retrouve deux types de contraintes. Les contraintes de colonnes et les 
contraintes d'attribut. 

### Les contraintes de colonnes.

Le mot clé est `CONSTRAINT`. 

#### Contrainte d'unicité `UNIQUE − (U)`

Deux types de contraintes existent. Des contraintes simples, associées à 
une colonne. Il suffit d'ajouter en fin de ligne le nom de la contrainte 
pour qu'il soit ajouté. 

Il existe des contraintes nommées qui nécessitent l'utilisation du mot clé 
`ALTER`, que nous verrons dans un second temps. 

~~~SQL
CREATE TABLE Client
    (NumCli INT UNIQUE) -- <-
~~~

#### Contrainte de saisie `NOTNULL − (NN)`

~~~SQL
CREATE TABLE Client
    (NumCli INT UNIQUE,
    NomCli VARCHAR(30) NOTNULL) -- <- 
~~~

#### Contrainte "valeur par défaut" `DEFAULT − (D)`

~~~SQL
CREATE TABLE Client
    (NumCli INT UNIQUE,
    NomCli VARCHAR(30) NOTNULL,
    VilleCli VARCHAR(30) DEFAULT "ROUEN") -- <-
~~~

#### Contrainte de valeurs posibles `CHECK − CK`

~~~SQL
CREATE TABLE Client
    (NumCli INT UNIQUE,
    NomCli VARCHAR(30) NOTNULL,
    VilleCli VARCHAR(35) DEFAULT "ROUEN",
    CodePostal CHAR(5) CHECK("76000","76100") ) -- <-
~~~

#### Contraintes nomées

Première étape: on crée la tables sans contraintes: 

~~~SQL
CREATE TABLE Client
    (NumCli INT, 
    NomCli VARCHAR(30), 
    VilleCli VARCHAR(35),
    CodePostal CHAR(5) ); 
~~~

On lui ajoute les contraintes:

~~~SQL
UPDATE TABLE Client
    ADD CONSTRAINT NumCli_U UNIQUE(NumCli),
    ADD CONSTRAINT NomCli_NN NOTNULL(NomCli),
    ADD CONSTRAINT VilleCli_D DEFAULTVALUE(VilleCli) ("ROUEN"),
    ADD CONSTRAINT CP_CK CHECK(CodePostal) ("76000","76100");
~~~

L'interêt, c'est qu'on peut facilement supprimer une contrainte, 
par exemple: 

~~~SQL
ALTER TABLE Client
    DROP CONSTRAINT NumCli_U;
~~~

### Contraintes d'attributs

#### Contrainte de clé primaire `PRIMARY KEY`

C'est une contrainte qui combine les contraintes `UNIQUE` et `NOTNULL`.
De plus, la clé primaire est automatiquement indexée. 

* 1ère méthode: 

~~~SQL
CREATE TABLE Client
    (NumCli INT PRIMARY KEY,
    …/…);
~~~

* 2ème méthode:

~~~SQL
CREATE TABLE Client
    (NumCli INT,
     …/…,
    PRIMARY KEY (NumCli));
~~~

* 3ème méthode **(très recommandée)**:


~~~SQL
CREATE TABLE Client
    (NumCli INT,
     …/…);
UPDATE TABLE Client
    ADD CONSTRAINT NumCli_PK PRIMARY KEY (NumCli);
~~~


#### Clé étrangère `FOREIGN KEY  − FK`



**<span style='color:red;'>Il est impossible de créer une clé étrangère 
si la clé primaire correspondante n'a pas été crée. Une clé étrangère fait 
toujours reference à une clé primaire existante. </span>**

~~~SQL
CREATE TABLE Client
    (NumCli INT,
     …/…);
CREATE TABLE Commande
    (NumCom INT,
    …/…
    NumCli INT);
    
ALTER TABLE Client
    ADD CONSTRAINT PK_Cli PRIMARY KEY (NumCli);
ALTER TABLE Commande
    ADD CONSTRAINT PK_Com PRIMARY KEY (NumCom),
    ADD CONSTRAINT FK_Com FOREIGN KEY NumCli REFERENCES Client.NumCli;
~~~

## III − Complements sur la commande `ALTER`

`ALTER` permet de 

* Supprimer une colonne `DROP COLUMN`
* Supprimer une contrainte `DROP CONSTRAINT`
* Ajouter une colonne `ADD COLUMN`
* Ajouter une contrainte `ADD CONSTRAINT`
* Changer le nom d'une colonne `MODIFY`
* Changer le type d'une colonne

En résumé: 

~~~SQL
ALTER TABLE NomTable
    (
    ADD DEFINITION <Column>
    ALTER <Column> { SET DEFAULT VALUE <DefaultValue>
                     DROP DEFAULT }
    DROP <Column>
    ADD CONSTRAINT <ConstraintDefinition>
    DROP CONSTRAINT <ConstraintName>
    MODIFY COLUMN <Column> <NewColumnName
    )
~~~
