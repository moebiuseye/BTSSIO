title: Les protocoles de routage

Le routage est un procédé permettant de faire passer les information d'un 
réseaux vers un autre, le routage se base sur le net id pour identifier les 
chemins à suivre afin de joindre le destinataire de l'information, il est 
donc utilisé sur des réseaux maillé. 

## I − Le fonctionnement

### I.1 − Le routage direct

Le routage direct est utilisé par tout hôte de réseaux, c'est à dire que 
chaque hôte est capable de déterminer pour l'itinéraire pour joindre les 
membres de son propre réseaux. Il utilise son adresse IP et effectue un 
ET logique pour déterminer l'interface à utiliser. Par défaut toute 
station est capable de joindre  elle même l'ensemble des membres de 
son propre réseau. Tout ceux qui ont le même Net id .

Pour ce faire la station va utiliser une table de routage, cette table est 
local et on peut l'obtenir grâce à la commande route print

Table de routage :

| @ réseau/hôte de destination | M SR (masque de sous réseaux) | @ d'interface | @ de passerelle | metrique |
|:--:|:--:|:--:|:--:|:--:|
| -  | -  | -  | -  | -  |

* @ réseau/hôte : ce que l'on veut joindre soit un hôte soit un réseau
* M SR : permet de déterminer si le routage se feras direct ou indirect
* @d'interface :carte réseau à joindre (soit la même que celle de l’hôte
* @passerelle : niveau 3 adresse du routeur à joindre 
* métrique : nombre de nœud à traverser pour joindre le destinataire, 
    c'est un vecteur

### I.2 Le routage indirect

Le routage est direct parce qu’il est fait par la station elle même, il est 
donc indirect si elle utilise un tiers pour acheminer ces paquets, grâce à 
un matériel spécifique : un routeur.
Un routeur est une passerelle de niveau 3, une passerelle réseaux (synonyme). 
Il contient les référence de tous les réseaux qu'il est capable de joindre 
grâce a sa table de routage.
Il sera utiliser si le netid de l'utilisateur et du destinataire sont 
différent a la seule condition que ci celui-ci est renseigné dans les 
adresses TCP/IP d'adresse de passerelle (il peut en avoir plusieurs). 
Cette passerelle doit faire parti du même identifiant que l’hôte.

Un routeur c'est donc : un matériel qui possède plusieurs réseaux possédant 
une table de routage. Pour créer un routeur il faut un service 
d'exploitation réseau (cisco) (ou d'ip forwarding sous linux).

Une appliance c'est un matériel d'usine qui possède son propre système 
d'exploitation permettant de fournir des services d'origine. Les plus 
connues : bewan cisco d-link.
Le routeur utilise des protocoles de routage qui peuvent être classifié. 

#### Les systèmes autonomes

On parle de systèmes autonome pour une zone capable de gérer elle même son 
propre routage (lan)
Il existe 3 type de protocoles pour gérer l'auto routage : EGP BGP et IGP
Exterior Gateway Protocol
Border Gateway Protocol
Interior Gateway Protocol qui nous interresse. Ce sont les protocole de 
routage interne aux infrastructure plus spécialisé pour les lan.

Dans IGP 2 protocol nous interresse : RIP (routine information protocol) 
et OSPF (open the shortest path first)

**RIP** : C'est un protocole de routage dit  à vecteur de distance, il va 
utiliser un métrique pour calculer le nombre de routeurs nécessaires 
entre le routeur et le destinataire, c'est ce qu'on va appeler la 
distance. Une distance sera donc égale à un nombre de routeur traversé. 
Il choisira donc son chemin en prenant le vecteur le moins long. => 
réseaux locaux. 

RIP possède un certain nombre de limitation par défaut il est limité à 
15 routeurs à l'heure actuelle dans sa version 2.0 qui prend en compte 
les sous réseaux mais pas plus de routeurs. 

Il va cherché le chemin le plus court mais pas nécessairement le plus 
rapide, il reste le plus utilisé dans les réseaux locaux. C'est un 
protocoles qui permet le routage dynamique : chaque routeur va 
transmettre aux autres routeurs l'ensemble de ses tables de routage

OSPF (ouvrir le chemin le plus court) : On parle ici de vecteur de temps 
et non plus de vecteur de distance. Les routeurs vont tester les temps 
de latence de leur environnement. Ils enverront les données à celui qui 
va répondre le plus vite (ce routeur est plus disponible pas forcément 
plus proche)

Quelques commandes utiles :

* `ipconfig`
* `route` = commande spécifique a la table de routage, du routage statique. 

