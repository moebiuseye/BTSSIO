title: Résolution des noms − Domain Name System

**DNS** : *Domain Name System*. (on parle aussi de 
*Domain Name Server*, le logiciel mettant en œuvre la partie 
serveur du *Domain Name System*)

C'est un système destiné à remplacer une adresse IP par un **FQDN** 
(*Fully Qualified Domain Name*). On retrouve ce **FQDN** dans les **URL** 
(*Uniform Ressource Locator*). 

Le **FQDN** est divisé en plusieurs parties: 

~~~
www.monserveur.com
\_/ \________/ \_/
SD  NS         ND

SD: Sous-domaine
NS: Nom du site
ND: Nom de domaine
~~~

Dans **DNS**, il y a des résolutions de noms directes et des résolutions de 
noms indirectes. 

C'est une technologie relativement récente (1983) qui s'est développée grâce 
à Internet. 

Ce système repose sur un ensemble de base de données hiérarchiques 
échangées entre des serveurs. 

Il est normalisé par les **RFC** 882, 883, 1034, 1035. 

## I − Le fonctionnement du protocole DNS

C'est un protocole client-serveur qui fonctionne sur le port 53 (coté serveur). 

C'est un protocole de niveau 7 : Applicatif. 

### 1. Système hiérarchique

Les systèmes DNS ont une forme arborescente. 

~~~
third-level-domain.second-level-domain.top-level-domain.
\________________/ \_________________/ \______________/ \
                                                         ` racine
~~~

Chaque branche est gérée par des types de serveur spécifiques. 

Les TLD sont de deux types: 

* Type géographique
* Type administratif

Ils sont normés et uniques. 

**ICANN** *Internet Corporation for Assigned Names and Numbers*. 

Il existe 13 serveurs racine, tous identifiés par une lettre, de A à M. 

Les second level Domains sont gérés par des registrar. 

Il existe également des sous-noms de domaine qui appartiennent à des 
structures locales. 

~~~
Example: salle1.chez.moi.fr
~~~

## II. Le mécanisme de résolution des noms

Par étapes:

1. Interrogation du fichier host
* Si infructueux: Interrogation du nom de domaine renseigné. 
* S'il la réponse du serveur implique de résoudre un nom de domaine, GOTO `1.`

Il est également possible d'interroger un nom de domaine pour résoudre une 
adresse en nom de domaine. 

Exemple:

~~~
5.2.0.192.in-addr.arpa correspond aur "rang" d'IP 192.0.2.5
~~~

C'est le *Reverse DNS*, ou recherche inversée. 

## III. Les types d'enregistrement DNS.

On peut considerer ces types d'enregistrement DNS comme les champs 
d'une base de données. 

Ces types sont stockés dans un fichier de configuration situé sur un 
serveur DNS specifique. On appel ça des enregistrements **RR** 
(*Released Records*). 

Ces enregistrements sont situés dans un fichier de zone. 

* **SOA** : *Start Of Authority*. C'est l'indication du serveur sur lequel 
    est situé le fichier de zone. 
* **NS** : *Name Server*. C'est l'indication des serveurs de noms qui sont 
    dans la zone. 
    * **A**     : Association avec une adresse IPv4
    * **AAAA**  : Association avec une adresse IPv6
    * **CNAME** : Association avec un nom de domaine
    * **MX**    : Association d'un nom de domaine avec le(s) serveur(s) 
        mail (leur adresse ou nom de domaine) qui y correspondent. 
    * **PTR**   : Association d'un alias à une partie de l'adresse. 
