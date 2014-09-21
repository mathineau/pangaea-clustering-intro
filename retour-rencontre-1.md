Retour rencontre 1
==================

Voici un retour sur certains éléments de discussion qui ont été soulevés lors de notre rencontre de 
vendredi 19 septembre 2014.

## "Wrap around"
Un membre de l'équipe a justement souligné qu'il est incohérent de faire un "wrap around" pour les valeurs de la 
latitude qui tombent hors du domaine [-90 90]. Dans ce cas vous pouvez donc:

1. "clipper" les pieds de la courbe normale en forçant les valeurs qui tombent à l'extérieur du domaine
à prendre des valeurs de -90 ou 90 selon le cas.
2. Ignorer cet effet et conserver le wrap around. L'influence de ces points sera considéré négligeable.

## Visualisation des données
Je vous invite à consulter la référence suivante pour la [visualisation des données](http://www.nature.com/nmeth/journal/v9/n10/fig_tab/nmeth.2186_F1.html).
Bien que votre approche me semble excellente pour le cas 4 dimensions, il se peut que plus tard dans le projet, vous
ayez à travailler avec des données de dimensions supérieure à 4. Gardez donc en tête cette référence advenant
que vous ayez à revoir votre approche. 

## Valeur optimale epsilon
L'approche que vous adoptez afin de trouver la valeur optimale de epsilon est approprié quand on connait à l'avance
le nombre de clusters. C'est le cas lorsque les données sont obtenus par votre générateur de données aléatoire. 
Cependant, en général, le nombre de clusters n'est pas connu à l'avance et le paramètre epsilon est estimé à
partir de la variance des données.

## Variance des attributs des données
Après réflexion, je crois que vous avez raison et que l'aspect des variations de densités requiert plus 
d'investigation. Nous allons donc continuer à travailler avec des clusters de 4 attributs de variance différentes.
Pour le prochain livrable, vous allez étudier des méthodes afin de former des clusters sur des ensembles de données
de densité disparates.

## Remise Milestone 1
Vous devrez remettre le code du milestone-1 à partir d'un entrepot github d'ici le 29 septembre 2014.


