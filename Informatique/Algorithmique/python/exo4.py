#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  exo4.py
#  
#  Copyright 2014 Samir Chaouki <samir@chaouki.fr>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.

s=0
i=0
n=0
while i != -1:
    s+=i
    n+=1
    i = int(input("Entrez un nombre positif ou -1 pour terminer : "))
    while i < -1:
        i = int(
            input("Valeur négative!!! Entrez un nombre de nouveau : ")
            )

n = float(n-1)
print("La moyenne des nombres est %f ." % (s/n) )
