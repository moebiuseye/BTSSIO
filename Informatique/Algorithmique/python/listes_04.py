#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  listes_03.py
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

from random import sample

liste = sample(range(40),20)

maxi = liste[0]
for l in liste:
    if l > maxi:
        maxi = l

print(liste)
print("le maximum est %d ." % maxi )
