title: La normalisation des reseaux


## Chapitre II − La normalisation des Réseaux − Le modèle OSI

La normalisation est le fait d'établir un standard fonctionnel 
respecté par les fabricants et permettant d'universaliser les 
matériels et la terminologie utilisée pour les réseaux. 
On parle également de standard. 

### I − Les organismes de normalisation

Globalement, la fin de la guerre froide et le développement de 
l'informatique ont entraîné les pays à mettre en place un 
système de communication plus ou moins mondial. 

Chaque pays ayant ses méthodes de fonctionnement et son propre 
environnement, on a crée des organismes internationaux afin de 
permettre les échanges entre ces différents environnements. 

L'**UIT** L'Union Internationale des Intercommunications, associé 
au **CCITT**; Comité Consultatif Internationale des Télécoms et des 
Télécommunications. Ils ont été mandatés par l'**ONU** à la fin de la 
seconde guerre mondiale. 

La **CEI**, Commission Électronique Internationale (IEC). $

L'**ISO**, *International Standard Organization*. 

Ces organismes ont été réunis en un seul: l'**ISO**, qui a été mandaté 
par l'ONU pour normaliser l'informatique. 


L'ISO regroupe un certain nombre d'organisations nationales, 

* L'**AFNOR** : Agence Française de Normalisation. 
* L'**ANSI** : *American National Standard Institute*

Au niveau international, ces organismes ont mis en place des normes 
qui sont toujours respectées. 

On peut citer les normes **ISO-8802**; les normes **POSIX** : 
*Portable Operating System Interface*; **X25**. 

Au niveau européen, l'**ETSI** : *European Telecomunication Standard Industry*. 
L'**ARCEP** : Agence de Régulation des Communications Électroniques et des Postes. 

La **CNIL** : Commission Nationale Informatique et Libertés. 

Au niveau industriel, l'*Open Group*. 

Le **W3C** : *World Wide Web*. 

L'**ICANN** : *Internet Corporation for Assigned Name Numbers*. <- ipv4; ipv6; 
et *reverse domain name*. 

L'**ARIN** : *American Registry for Internet Numbers* (Zone américaine). 

L'**APNIC** : *Asian Pacific Interne

Le **RIPE** : **Réseaux IP Européen**

L'**AFRINIC**

L'**ACNIL** : *Latin & Carribean*.

### II − Le modèle OSI − Normalisation des réseaux. 

Un système qui n'est pas ouvert est propriétaire. C'est à dire qu'il 
n'est pas "lisible" et pas modifiable. 

Le but de la norme OSI est de fournir une norme multicouche pour un 
ensemble de systèmes hétérogènes. Un modèle commun pour pouvoir 
communiquer. 

| Numero | Nom                | 
|:------:|:------------------:|
| 7      | Application        |
| 6      | Présentation       |
| 5      | Session            |
| 4      | Transport          |
| 3      | Réseau             |
| 2      | Liaison de données |
| 1      | Physique           |

Chaque couche correspond à une fonctionnalité de réseau isolée des autres. 

#### Couche 1 − Couche physique

La première couche est la couche physique. Elle est liée à tout ce qui est 
connexion physique. Pour cela, il nous faut une interface réseau, un 
adaptateur réseau et des câbles. 

Son rôle est de décrire les caractéristiques électroniques, mécaniques, 
physiques, des différents éléments de connexion d'une station à un réseau. 
Elle est liée à des **transceiver** (receiver/transmitter). Tout 
cela en vue de transformer le binaire de l'ordinateur en un signal 
compatible avec le média autorisé. Elle est responsable des communications 
synchrones ou asynchrones. 

* En synchrone, les deux machines sont synchronisées dans le temps. 
* En asynchrone, les deux machines ne sont pas synchronisées dans le temps. 


La couche 1 a pour unité le bit (ou le baud, pour les puristes). 

On peut donc y associer des paires torsadées, connectées en RJ45 et carte 
ethernet. (C'est le trio nécessaire pour envoyer des données par la 
carte physique). 

#### Couche 2 − La liaison de données

Pour la 2ème couche est en rapport avec l'adresse 
physique (MAC). 

Elle est responsable de l'établissement de la persistance et de la 
libération de la ligne de communication. Elle est responsable du bon 
acheminement des paquets d'information et de vérifier les codes d'erreur 
de transmission. 

Elle établit les règles de réception et d'émission des données. 

Son unité de mesure est **la tramme**. 

**Une trame** : C'est un ensemble de champs d'information spécifiques au 
fonctionnement d'un réseau. On parle de trame Ethernet, X25, ATM. 

Ces trames contiennent un identifiant spécifique pour l'émetteur et le 
récepteur. la Hmac (**Medium Access Control**). 

#### Couche 3 − Le réseau

La 3ème couche est en rapport avec l'adresse logique. 

Elle est responsable de l'acheminement des paquet de l'émetteur 
au récepteur. 

C'est la couche qui est chargée de l'adressage et aussi de l'itinéraire 
à suivre pour remettre les paquets à récepteur, c'est **le routage**.

Cette couche va ajouter des informations de contrôle permettant de 
déterminer les congestions. 

Elle utilise les adresses IPv4, IPv6, IPX, des noms netbios, etc. 

La couche 3 utilise comme unité de mesure **le datagram**. 

#### Couche 4 − Transport

La 4ème couche, le transport, est responsable de l'acheminement des 
données. 

Elle est responsable de la méthode d'acheminement des paquets. 
Il s'agit d'une couche d'interface (*middleware*) entre le 
matériel et les applications qui vont l'utiliser. 

Il y a deux méthodes d'acheminement des données: Une méthodes dite 
**à la volée** (*on the fly*) et **bout par bout**. Cette couche permet
de vérifier si un message a correctement été acheminée. Elle est 
également responsable du multiplexage et du démultiplexage. 

* Multiplexage temporel : pendant un temps, je parle à A, 
    puis pendant un autre, je parle à B. 
* Multiplexage fréquentiel : division en canaux pour parler à 
    plusieurs à la fois. 

**TCP** Transmission Control Protocol : Envoi connecté avec Vérification.
**UDP** User Datagram Protocol : Envoi non connecté sans verification. 

Il utilise comme unité de mesure le paquet (TCP) ou la fenêtre (UDP). 

#### Couches 5,6 et 7

Les couches 5, 6 et 7 sont des couches liées aux applications. 

##### Couche 5 − Session

C'est la première couche orientée traitement. 
Elle permet l'ouverture et la fermeture d'une session de 
travail. C'est à dire qu'elle assure la synchronisation des transferts 
durant la fenêtre d'émission. 

Plusieurs langages utilisent la couche session, notamment, le SQL, on la 
retrouve aussi dans NFS **Network File System**. 

##### Couche 6 − Présentation

C'est la couche qui permet de présenter les données qui vont être reçues 
pendant la session ouverte. 

Elle traite de l'information afin de la rendre compatible entre les 
applications mises en relation. 

Elle rend indépendante l'utilisateur par rapport au transport des données. 
C'est ce qui fait qu'un utilisateur windows peut recevoir des données Unix. 


C'est la couche logicielle qui, entre autres, est chargée de 
compresser/décompresser, chiffrer/déchiffrer, de formater (*encoding*), etc. 

Un exemple de logiciel sur la couche 6 : *Pretty Good Privacy*. 

##### Couche 7 − Application

C'est le service final rendu à l'utilisateur. 

Utilisé par un protocole de haut niveau. Par exemple, le HTTP, SMTP, IMAP, 
DHPC, DNS, IRC, BitTorrent, etc. 

Un protocole, c'est une réglé de communication entre un émetteur et un 
récepteur. 

### Fonctionnement du modèle OSI

Le modèle OSI fonctionne selon un principe de transversalité des couches 
paires. 


~~~
| Emetteur               |                                   | Recepteur    |
|------------------------|                                   |--------------|
| 7 | Application        | -- proto d'appli              --> | Application  |
| 6 | Presentation       | -- proto de presentation      --> | Presentation | 
| 5 | Session            | -- proto de session           --> | Session      |
| 4 | Tranport           | -- proto de transport         --> | etc…         |
| 3 | Réseau             | -- proto de réseau            --> |              |
| 2 | Liaison de données |   \  Materiel de connection  /    |              |
| 1 | Physique           |    \________________________/     |              |
           \                                                      ^
            \___________________________bits_____________________/
~~~

### Du mithe à la réalité − L'encapsulation des données

En réalité, bien entendu, les informations passent par exemple de la 
couche 7 par chacune des couches intermédiaires jusque la couche physique, 
et le récepteur et les intermédiaires ne vont traiter que les couches les 
concernant. 

<small>Par exemple, un switch ne doit pas s'occuper de la couche Transport et un 
routeur ne doit pas s'occuper de ce qui se trouve dans les couches 
applicatives 5, 6 et 7. </small>

Le principe d'ajout d'entête au passage dans chaque couche, qui sera 
lisible par la couche de même niveau. 

Lorsqu'il y a encapsulation, pour envoyer 8 bit d'information, il peut y avoir 
beaucoup plus de données à envoyer réèlement. C'est l'*overhead*. 

### Conclusion

Le modèle OSI est un formidable travail sur la comprehension du 
fonctionnement des réseaux; sur une longue periode avec beaucoup de hautes 
compétences. 

La rigueur de ce modèle n'a pas toujours trouvé d'echo chez les principaux 
OEM *Original Equipment Manufacturer*. 

Ce modèle ne sera jamais vraiment appliqué mais reste le modèle de référence 
pour tout les autres modèles de fonctionnement des réseaux. 

À l'époque, le modèle OSI ayant tardé à arriver, un autre modèle s'est 
imposé: le modèle **DOD** *Department Of Defense*. 
