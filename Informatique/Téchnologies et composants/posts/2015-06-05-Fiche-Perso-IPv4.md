title: Fiche de révision Perso sur IPv4

# Calcul du nombre de sous-reseaux pour un masque

On nous donne le masque 20 pour des adresses commençant par 172.16

On écris alors ceci:

~~~
172 = 128+32+8+4 = 1010 1100
~~~

Comme cette adresse commence par 10 (en binaire), on sait qu'elle est de classe B, donc 
avec un netid de 16 bit

~~~
20-16 = 4
4² = 16
~~~

On peut alors faire 16 subnet avec cette configuration. 

# Assigner des adresses de sous-réseaux 

(Avec la même chose)

~~~
172.16.0.0 = 
    1010 1100  .  0001 0000  .  0000    0000 . 0000 0000
   \         NetId          / \ SNid /\ NetId           /
~~~

On a alors : 

~~~
172.16. [0000] 0000 .0 = 172.16.   0 .0
172.16. [0001] 0000 .0 = 172.16.  24 .0
172.16. [0010] 0000 .0 = 172.16.  32 .0
172.16. [0011] 0000 .0 = 172.16.  48 .0
172.16. [0100] 0000 .0 = 172.16.  64 .0
172.16. [0101] 0000 .0 = 172.16.  80 .0
172.16. [0110] 0000 .0 = 172.16.  96 .0
172.16. [0111] 0000 .0 = 172.16. 112 .0
172.16. [1000] 0000 .0 = 172.16. 128 .0
172.16. [1001] 0000 .0 = 172.16. 144 .0
172.16. [1010] 0000 .0 = 172.16. 160 .0
172.16. [1011] 0000 .0 = 172.16. 172 .0
172.16. [1100] 0000 .0 = 172.16. 192 .0
172.16. [1101] 0000 .0 = 172.16. 208 .0
172.16. [1110] 0000 .0 = 172.16. 224 .0
172.16. [1111] 0000 .0 = 172.16. 240 .0
~~~

# Déterminer l'étendue d'un sous-réseau

Prenons ceci:

~~~
172.16. [1000] 0000 .0 = 172.16. 128 .0
~~~

La subnet qui le suit est le suivant:

~~~
172.16. [1001] 0000 .0 = 172.16. 144 .0
~~~

Ce sous-réseaux va de 

~~~
172.16. 128 .0 + 1 = 172.16. 128 .1
# à 
172.16. 144 .0 - 2 = 172.16. 143 .254
~~~
