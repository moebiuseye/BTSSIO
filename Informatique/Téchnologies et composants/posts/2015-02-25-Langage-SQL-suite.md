title: Langage SQL (suite)

## Les opérations complémentaires

### I − L'association de deux tables

Ces associations portent sur deux tables qui ont la même structure. 

C'est à dire, soit une table vers elle même, soit deux tables ayant les 
même noms de colonnes et les même types de données. 

Il en existe N types:

#### L'union − `UNION SELECT`

Elle consiste à afficher le contenu de deux tables dans une requête. 

~~~SQL
SELECT 
    attr1,attr2,…
FROM 
    table1
WHERE 
    <conditions>
UNION SELECT
    attr1,attr2,…
FROM 
    table2
WHERE 
    <conditions>;
~~~

#### L'intersection − `INTERSECT SELECT`

~~~SQL
SELECT 
    attr1,attr2,…
FROM 
    table1
WHERE
    <conditions>
INTERSECT SELECT
    attr1,attr2,…
FROM
    tables
WHERE
    <conditions>;
~~~

Ce type de requête est très pratique pour supprimer les doublons. 

#### La différence `EXCEPT SELECT`

~~~SQL
SELECT 
    attr1,attr2,…
FROM 
    table1
WHERE
    <conditions>
EXCEPT SELECT
    attr1,attr2,…
FROM
    tables
WHERE
    <conditions>;
~~~

### II − Les autres jointures

#### La jointure gauche − `LEFT JOIN` ou `LEFT OUTER JOIN`

~~~SQL
SELECT 
    *
FROM 
    tableGauche as tg
LEFT JOIN 
    tableDroite as td
ON 
    td.id = tg.id
WHERE 
    <conditions>;
~~~

Son rôle est de lister toute les correspondances de la table de gauche, 
même s'il n'y a pas de correspondance dans la table de droite. 

| TableGauche ||||||| TableDroite |||||
|:--:||
| tg.id | |||||| td.id |
| 1     | |||||| 1 |
| 2     | |||||| NULL |
| 3     | |||||| NULL |

Par exemple, ici `tg.id=2` et `tg.id=3` ne correspondent à aucun élément 
dans la `tableDroite`. 

#### La jointure droite − `RIGHT JOIN` ou `RIGHT OUTER JOIN`

C'est simplement l'inverse de la jointure gauche. 

## III − Insertion de données

Ces opérations consistent à injecter toutes les occurrences des tuples 
d'une table. 

### `INSERT INTO`

~~~SQL
INSERT INTO 
    table_name
VALUES 
    (value1,value2,value3,...);
~~~

~~~SQL
INSERT INTO 
    table_name (column1,column2,column3,...)
VALUES 
    (value1,value2,value3,...);
~~~

Exercice:

~~~SQL
INSERT INTO
    CLIENT (CodeCli, PreCli, NomCli)
VALUES
    (1, "Jean", "Dupont"),
VALUES
    (2, "Paul", "Dubos"),
VALUES
    (3, "Pierre", "Duparc")
VALUES
    (4, "David", "Dumont");
~~~

### `UPDATE TABLE … SET … WHERE`

~~~SQL
UPDATE 
    table_name
SET 
    column1=value1,column2=value2,...
WHERE 
    <conditions>;
~~~

Exemples:

~~~SQL
UPDATE 
    CLIENT
SET
    ModCli = "A 30 jours fin de mois"
WHERE
    NomCli = "Dubos";
~~~

Exercice:

<small>Augmenter de 5 pourcent une valeur `Prix` d'un `ARTICLE` ayant 
pour `NomArticle` "Souris"</small>.

~~~
UPDATE
    ARTICLE
SET
    Prix = Prix * 105/100
WHERE
    NomArticle = "Souris";
~~~

### `DELETE FROM`

~~~SQL
DELETE FROM 
    table_name
WHERE 
    <conditions>; 
~~~
