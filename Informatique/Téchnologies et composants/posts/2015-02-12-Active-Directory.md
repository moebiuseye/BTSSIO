title: Active directory − 

## Commandes utiles

##### Créer un partage

~~~
net share share_name
~~~

##### Ajouter des utilisateur et groupes

~~~
dsadd user /help
dsadd group /help
~~~

~~~
net user /help
net group /help
net localgroup /help
~~~

##### Gerer les ACL

~~~
cacls
icacls
~~~

##### Aide de CACLS

~~~
 REMARQUE: Cacls étant désapprouvé, utilisez Icacls.

 Affiche/modifie les listes de contrôle d'accès des fichiers

 CACLS nomfichier /T] [/M] [/L] [/S[:SDDL]] [/E] [/C] [/G util:perm]
        [/R util [...]] [/P util:autor [...]] [/D util [...]]
    nomfichier    Affiche les listes ACL.
    /T  Modifie les listes ACL des fichiers dans
        le répertoire et les sous-répertoires.
    /L  Fonctionne sur le lien symbolique par opposition
        à la cible
    /M  Modifie les listes ACL des volumes montés dans un répertoire
    /S  Affiche la chaîne SDDL pour la liste DACL.
    /S:SDDL  Remplace les listes ACL par celles spécifiées dans
        la chaîne SDDL (non valide avec /E, /G, /R, /P ou /D).
    /E  Modifie la liste ACL au lieu de la remplacer.
    /C  Continue la modif. des ACL et ignore les erreurs
    /G util:autor Accorde des accès à l'utilisateur
        Perm : R  Lecture
                     W  écriture
                     C  Modification (en écriture)
                     F  Contrôle total
    /R util       Révoque les accès de l'utilisateur
        (valide uniquement avec /E).
    /P util:autor Remplace les accès de l'utilisateur
        Perm peut être: N  Aucun
                     R  Lecture
                     W  écriture
                     C  Modification (en écriture)
                     F  Contrôle total
    /D util       Refuse l'accès à l'utilisateur
 Utilisez des caractères génériques pour spécifier plusieurs
 fichiers dans une commande. Vous pouvez spécifier plusieurs utilisateurs
 dans une commande.

 Abréviations:
    CI - Héritage de conteneur.
Les répertoires héritent de l'entrée de contrôle d'accès.
    OI - Héritage d'objet.
Les fichiers héritent de l'entrée de contrôle d'accès.
    IO - Héritage unique.
L'entrée de contrôle d'accès ne s'applique pas au fichier/répertoire
en cours.
    ID - Hérité.
L'entrée de contrôle d'accès a hérité de la liste de contrôle
d'accès du répertoire parent.

~~~

Exemples: 

~~~
cacls <DIR> /E /G GLTA:R GGTA:W "Tout le monde":N
~~~
