title: Fiche de révision perso sur IPv6

# Simplifier et "expanser" des adresses. 

## Simplifier

1. On vérifie que l'adresse comporte bien 8 blocs de 16 bits. 
    Si tel n'est pas le cas, on ne fait rien. 
* On élude 1 et 1 seul conglomérat de blocs à 0. 
    On le remplace par `::`
* On élude tout zero leader dans chaque bloc. /\ Ne pas éluder de zero de fin. 

## "Expanser"

1. On fait en sorte que les blocs ayant moins de 4 lettres hexa soient 
    préfixées d'autant de 0 qu'il en faut pour satisfaire cette condition.
    (Exemple: on remplace `:90:` par `:0090:` )
* On fait en sorte que l'adresse ait 8 blocs de 4 lettres hexa en 
    remplaçant le :: par autant de ":0000:" qu'il en faut. 
    (Exemple: `fe80::0001` deviens `fe80:0000:0000:0000:0000:0000:0000:0001`)

# Déterminer le type d'adresse

Il existe 5 types d'adresses: 

* Les adresses *Link-Local* **unicast**    : `1111 1110 10` noté `fe80::/10`
* Les adresses *Site-Local* **unicast**    : `1111 1110 11` noté `fec0::/10`
    -> Ce préfixe est maintenant obsolète. 
* Les adresses *Unique-Local* **unicast**  : `1111 110`     noté `fc00::/7`
* Les adresses **Multicast**               : `1111 1111`    noté `ff00::/8`
* Les adresses *Global* **unicast**        : Tout le reste. 

Réponses: 

~~~
fe80::4c00:fe4f:4f50                    : Link-Local  , unicast
2001:618:1f80:2010:203:ffff:b118:ef1e   : GLobal      , unicast
fec0:0:0:ff::1                          : Unique-Local, unicast
ff02::1                                 : Multicast   , OSPF
fe80::1                                 : Link-Local  , unicast
fc01:1:1:1                              : Unique-Local, unicast
2002::203:ffff:b118:ef1e                : Global      , unicast
~~~

# Préfixe d'adresse globale

Oui, l'adresse `3001:2:1:2::4cfe` est une adresse Globale. 

# Auto-configuration des adresses


## Etape 1 : "Embarquer" l'adresse MAC dans une adresse de lien local. 

Lors de la création d'une adresses ipv6 auto-configurée, il faut utiliser 
l'adresse MAC de l'interface et la mettre à la fin d'une adresse de lien 
local. 

Prenons l'adresse MAC `00:11:22:33:44:55`. Son adresse de lien local 
(pour l'instant), donne le résultat suivant. 

~~~
fe80::0011:2233:4455
~~~

## Etape 2 : Configurer le bit d'universalité

Le bit d'universalité est le **7ème bit** de notre adresse MAC. 

1. S'il est à 0 : L'adresse est universelle. 
2. S'il est à 1 : L'adresse est manuelle. 

~~~
fe80::0011:2233:4455 = [fe80::] 00000000 00010001 : 00100010 00110011 : 01000100 01010101
                                      ^- Bit d'universalité
fe80::0011:2233:4455 = [fe80::] 00000000 00010001 : 00100010 00110011 : 01000100 01010101
~~~

Celui-ci reste à zero dans notre cas. 

Dans un autre exemple, avec une @MAC `FF:EE:DD:CC:BB:AA`, 
elle aurait changé. 

## Etape 3 : Configurer les bits

Le bit de groupe est le **8ème bit** de notre adresse MAC. 

1. S'il est à 0 : L'adresse est individuelle. 
2. S'il est à 1 : L'adresse est multicast. 

~~~
fe80::0011:2233:4455 = [fe80::] 00000000 00010001 : 00100010 00110011 : 01000100 01010101
                                       ^- Bit de groupe
fe80::0011:2233:4455 = [fe80::] 00000000 00010001 : 00100010 00110011 : 01000100 01010101
~~~

Celui-ci reste à zero dans notre cas. 

Dans un autre exemple, avec une @MAC `FF:EE:DD:CC:BB:AA`, 
elle aurait changé. 

# Determiner la portée d'une adresse IPv6

Pour determiner la portée d'une adresse, on s'interesse au 
dernier mot (hexa) du premier bloc de l'adresse. 

Le tableau suivant nous permet de déterminer le type d'adresse. 

| Valeur | Portée             |
|:------:|:------------------:|
| 0      | Réservée           |
| 1      | node_local         |
| 2      | link_local         |
| 3      | subnet_local       |
| 4      | admin_local        |
| 5      | site_local         |
| 8      | organisation_local |
| E      | global             |
| F      | Reservée           |
