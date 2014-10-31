title: Fonctions et tableaux

## Les tableaux

~~~
         __________________________
valeurs :| 0 | 2 | 4 | 6 | 8 | 10 |
         >------------------------<
         | 0 | 1 | 2 | 3 | 4 |  5 | <- "numéros de case"
         ``````````````````````````
~~~

Les tableaux sont contigus en mémoire. Les tableaux sont déclarés avec une 
taille initiale. 

Dans un tableau à une dimension, chaque valeur stockée est reperée par un 
indice. 

en algo, on déclare un tableau comme ceci:

~~~
nom_tableau[nbre_valeurs]: Tablea de <type>
~~~

En algo, la première case d'un tableau a pour indice 1. 

## Exercices 

Écrire un algo qui déclare et remplis un tableau de 7 valeurs numériques 
en les mettant toutes à zero. 

~~~
Variable valeur[7] : Tableau d'entiers

Début
    Pour i <- 1 à 7 Faire
        valeur[i] <- 0
    Fin Pour
Fin
~~~

Écrire un algo qui déclare un tableau de neuf notes dont on fait ensuite 
saisir les valeurs par l'utilisateur. 

~~~
Variable notes[9] : Tebleau d'entiers

Début
    Pour i <- 1 à 9 Faire
        Afficher("Entrez la note n° ", i, ".")
        Saisir(notes[i])
    Fin Pour
Fin
~~~


Écrire un algo qui remplit un tableau avec six valeurs 0, 1, 4, 9, 16, 25
Il les écrit ensuite à l'écran. 


~~~
Variable valeurs[6] : Tableau d'entiers

Début 
    Pour i <- 0 à 5 Faire
        valeurs[i] <- i*i
    Faire Pour
Fin
~~~


Somme d'un tableau

~~~
Variables valeurs[4] : Tableau d'entiers
            Somme : Entier

Début
    Pour i <- 0 à 3 Faire
        Afficher("Saisir un valeur.")
        Saisir(valeurs[i])
    Fin Pour
    Somme = 0
    Pour i <- 0 à 3 Faire
        Somme = Somme + valeurs[i]
    Fin Pour
    Afficher("La somme du tableau est ", Somme)
Fin
~~~
