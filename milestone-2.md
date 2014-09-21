pangaea-utlima
==============

# Second Milestone
Date de remise du milestone: **Le Vendredi 24 Octobre 2014** 

Modalité de remise: **code source et documents déposés sur un entrepôt github**

# Enoncé

## Introduction
Lors de votre livrable précédent, vous avez identifié que la différence de densité (variance) des 
attributs des points que l'on cherche à amalgamer peut être problématique à l'application de 
l'algorithme DBSCAN. Ceci met en doute la pertinence du choix de l'algorithme car les jeux de donnés réels vont
inévitablement contenir de telles différences de variances. Le But de ce milestone est donc d'identifier, d'appliquer 
et d'implémenter localement des méthodes qui permettent de mitiger cet effet indésirable lors de la classification des 
données.

## Exploration d'alternative à DBSCAN
Vous allez débuter votre travail par l'exploration de méthodes alternative de classification
des donnés dans le cas de densités variables. Pour ce faire, vous allez utiliser le framework
logiciel de forage de donnée [ELKI](http://elki.dbs.ifi.lmu.de/). 

Voici le cheminement suggéré afin d'évaluer les alternatives possibles à DBSCAN.

### Évaluation des algorithmes
1. Générer des ensembles de données aléatoires de petite taille (environ 1000 points + bruit) avec votre générateur 
aléatoire de données. Vos ensembles de donnés devront avoir les charactéristiques suivantes:
  1. La variance de la latitude devra être égale à la variance de la longitude.
  2. La variance de la popularité devra être différente de la variance du rating ainsi que de la variance de la latitude 
  et de la longitude.

2. Appliquer les différents algorithmes pertinents du framework ELKI à vos jeux de donnés. 
Les algorithmes à considérer doivent être des algorithmes qui ne nécessitent pas une connaissance préalable du nombre 
de clusters. Compte tenu du grand nombre d'algorithmes disponibles, vous devrez faire un certain travail de recherche 
afin de présélectionner les algorithmes à évaluer.

3. Évaluer les résultats des différents algorithmes avec les outils à votre dispositions (visualisateur du
milestone précédent, visualisation ELKI etc.).

### Algorithmes finalistes
À partir des résultats de l'évaluation précédente, dresser une liste de candidats finals pour une future implémentation
sur Apache Spark. Pour chacun des candidats de la liste, expliquez quel sont les avantages et inconvénients de 
l'algorithme. Vous devez considérer des facteurs telle que: la complexité algorithmique, la simplicité 
d'implémentation, le nombre de paramètres à spécifier etc.

#### Notes
1. la taille de la liste des algorithmes finalistes est laissé à votre discrétion.

### Choix de l'algorithme
Choisissez un algorithme, parmis les candidats finalistes, que vous allez implémenter sur Apache Spark. Expliquer
en détail pourquoi vous avez choisi cet algorithme. Si votre argumentation s'appuit sur des résultats que vous
n'avez pas obtenus vous même (e.x.: compleité algorithmique) vous devez inclure les références vers ces résultats.

## Implémentation locale Apache Spark
Implémenter une version locale sur Apache Spark l'algorithme que vous avez sélectionnez. Validez vos résultats à l'aide 
de l'implémentation de référence du framework ELKI.

### Notes
1. En première passe et lorsque pertinent, vous pouvez implémenter l'algorithme sans structures de donnés spatiale
afin de simplifier. Faites cependant en sorte qu'il soit facile de modifier le code afin d'inclure cette
caractéristique dans une prochaine version.
