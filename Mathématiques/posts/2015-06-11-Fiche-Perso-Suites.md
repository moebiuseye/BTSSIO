title: Fiche perso, suites

# Types de suites

## Suite Arithmétique

Elle peut s'écrire comme ceci:

<pre>
<code>
u<sub>0</sub> = p
u<sub>n</sub> = U<sub>n-1</sub> + r
</code>
</pre>

Ici, notre suite est de premier terme `p` et de raison `r`. 

### Autre notation










<pre>
<code>
u<sub>n</sub> = u<sub>0</sub> + r × n
</code>
</pre>

Calculer le terme de rang `n` n'est alors qu'une question de 
calculatrice. 

### Résolutions

Pour résoudre une inéquation:

<pre>
<code>
u<sub>n</sub> > x
u<sub>0</sub> + r × n > x
     # Ici, pas de problème pour passer u0 de l'autre coté. 
     r × n > x - u<sub>0</sub>
         # Ici, si r est négatif, on change le sens du signe d'inégalité. 
         n > ( x - u<sub>0</sub> ) ÷ r
</code>
</pre>

## Suite Géométrique

Elle peut s'écrire comme ceci: 

<pre>
<code>
u<sub>0</sub> = p
u<sub>n</sub> = U<sub>n-1</sub> × q
</code>
</pre>

Ici, notre suite est de première terme `p` et de raison `q`. 

### Autre notation

<pre>
<code>
u<sub>n</sub> = u<sub>0</sub> × r<sup>n</sup>
</code>
</pre>

### Résolutions

Pour résoudre une inéquation, on s'appuie sur l'égalité connue suivante:

<pre>
<code>
x<sup>n</sup> = n × ln(x)
</code>
</pre>

<pre>
<code>
       u<sub>n</sub> > x
  u<sub>0</sub> × r<sup>n</sup> > x
       r<sup>n</sup> > x ÷ u<sub>0</sub>
n × ln(r) > ln(x)
        n > ln(x) ÷ ln(r)
</code>
</pre>
