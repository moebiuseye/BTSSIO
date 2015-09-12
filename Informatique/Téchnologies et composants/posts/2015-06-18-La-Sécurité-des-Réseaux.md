title: La Sécurité des Réseaux


Les systèmes actuels fonctionnent à partir 

Écoutes, usurpations, intrusions, infections, sont des exemples d'attaques 
dont il faut se prémunir dans un réseaux. 

Deux axes:

* Connaître le fonctionnement du réseau pour en analyser les 
dysfonctionnements. 
* Connaître les équipements spécifiques implémentés dans un réseau afin de 
les paramétrer au plus juste. 

Plusieurs techniques existent déjà et s'appuient sur le modèle de référence 
OSI. 

(Rappel des couches du :)

* Physique
    * Fermer les portes à la baie de brassage. 
* Liaison de données
    * Créer des domaines de collisions indépendants pour isoler 
        les flux de chacun des services. 
* Réseaux
    * Routeur: Configurer un ou plusieurs. 
    * Routeur: Paramétrage de règles de filtrage avancé. (proxy)
    * IDS
    * Firewall : Un objet matériel et/ou logiciel permettant 
        de gérer toutes les données provenant des couches applicatives 
        en plus des données venant des couches matérielles. 
* Transport
* Session
* Présentation
* Application

# I − La base de la protection: le cloisonnement

La cloisonnement est un principe consistant à séparer en plusieurs 
réseaux physiques ou logiques une infrastructure d'entreprise. 

Ces cloisonnements sont définis au moyen d'un certain nombre de règles 
définis dans une politique de sécurité. Cette politique identifie les 
besoins et exprimer sous forme de règles les méthodes à appliquer. 

La politique de sécurité est émise par la DSI 
(**Direction des Systèmes d'Information**). 

**Cloisonner en fonction des besoins des utilisateurs: **

Cela consiste à déterminer les besoins en ressources informatiques par 
types d'utilisateurs. Les utilisateurs internes, externes nomades, 
externes prestataires, etc. Et le reste du monde. 
(Internet, Extranet, Intranet). 

**Les utilisateurs sont gérés par des firewalls: **

La mise en place de règle de pare-feu présente un nouveau problème. 
Elles devront être spécifiques à chacun des utilisateurs. 

Il s'agit d'un cloisonnement du réseau en plusieurs **strates**. 


La DMZ: La zone démilitarisée (*DeMilitarized Zone*) permet à 
utilisateur extérieur d'accéder à des ressources intérieurs à l'entreprise 
sans qu'il puisse accéder à la partie privée. 

Cette DMZ est souvent créée entre deux firewalls. Un qui gère les accès 
exterieurs et un autre qui gère les accès VPN. 

# II − Le FireWalling

Un **FireWall** : Le firewall est un mécanisme d'analyse de trafic TCP/IP. 
Il intervient à partir de la couche Réseau, donc. Son rôle est de savoir 
si un datagramme est autorisé ou non à accéder à un réseau ou à une 
machine. 

Deux types de firewall: Les firewalls sans états et les firewalls 
avec états. 

Les firewalls sans états appliquent des règles en fonction des entêtes du 
datagram. Il ne s'intéresse pas au contenu du datagram (le paquet). 

Les firewalls avec états vont, en plus d'analyser les règles, examiner 
l'intégralité du trafic, c'est à dire les paquets et les segments 
contenus dans les datagrammes. 

## a. La portée des firewalls

Sa première portée est d'autoriser ou interdire des adresses IP. 

Un firewall travaille également sur la couche 4, (Transport). 
Donc, TCP ou UDP. C'est ce qui permet d'autoriser ou interdire des 
ports (source ou destination). 

Les ports: Il y en a 2<sup>16</sup> = 65536. De 0 à 65535. 
Ces ports sont normés. 
Parmis ces ports, ceux de 0 à 1024 ont été assignés à des services. 
On les appelle les *Well Known Ports*. 

Un firewall peut également gérer les couches "hautes" 
(Session, Présentation, Application). 

Sur chacun de ces niveaux, le firewall applique deux types de règles, 
l'acceptation ou le refus des données. 

Ces règles de filtrages sont hiérarchiques. C'est à dire que la règle 
numéro 1 sera prioritaire par rapport à la suivante. 

Il y a deux modes de fonctionnement, deux stratégies opposées: 

* Stratégie de permission par défaut: c'est un mode apprentissage. 
    C'est mauvais. Ne **JAMAIS** faire ça... 
* Stratégie de refus par défaut: Tout ce qui n'est pas explicitement 
    autorisée est interdit. L'apprentissage peut être long et nécessiter 
    une bonne connaissance de son réseau. 

Les règles de firewall se présentent sous la forme d'un tableau. 

| Adresse Source | Port Source | Adresse de Destination | Port de destination | Proto | Règle |
|:|
|

On peut: 

    * Regrouper des adresses en utilisant la notation CIDR. 
    * On peut utiliser des mots clés tels que "any", des wildcards 
        dans les noms de domaines "*". 

# III − Exemple d'implémentation

voir polycopiués diapo 51, 52, 52

# IV − Les cloisonnements

**Les serveurs proxy (mandataires)**

Un serveur mandataire est un serveur qui possède un mandat pour 
effectuer des actions à la place des autres. 

Son mandat porte sur l'aiguillage de flux; c'est à dire un mécanisme 
consistant à relayer un service réseau entre une application cliente et 
une application serveur. 
Autrement dit, c'est un client pour les serveurs, et c'est un serveur 
pour les clients. 

Deux types de relayage vont être mis en œuvre par un serveur proxy: 

* Le relai simple: il sert à relayer les requêtes **d'une multitude 
    clients** vers **une multitude de serveurs**. 
* Le relai inversé (*Reverse proxy*): il relaie **tout les flux publiques**
    (clients) qui souhaitent accéder à **un unique serveur interne**. 

## 1. Fonctionnement du relayage

Son intérêt est la mise en place d'une sécurité accrue. 

En effet, toute requête relayée est donc susceptible d'être analysée. 

Il permet un nouveau cloisonnement du réseau. 

Le service sera fonctionnel s'il permet l'authentification d'un 
utilisateur lors de l'accès à une ressource. 

Il sera efficace s'il applique des règles d'accès en fonction des 
utilisateurs. 

Ce proxy doit être transparent. C'est à dire que l'utilisateur ne doit 
pas s'en rendre compte. 

Il peut s'agir d'un composant physique ou logiciel. 

Le relayage ne porte que sur certains types de requettes, ou sur tout 
types de requettes. 

Le proxy est donc spécialisé sur le relayage **applicatif**. 

## 2. Il logue. 

## 3. Les fichiers de filtrage 

## 4. Authentification des utilisateurs


