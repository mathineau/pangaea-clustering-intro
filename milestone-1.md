pangaea-utlima
==============
# Premier Milestone

Temps requis: 3 semaines.

# Enoncé

### Notes

2. Utilisez python 2.x

3. Pour la lecture des arguments en ligne de commandes en python, jetez un oeuil à
[argparse](https://docs.python.org/2.7/library/argparse.html)

## Script DBSCAN local
Faites un script en python qui permet d'utiliser DBSCAN et qui lance 
l'algorithme sur des données qui sont dans un fichier .csv. Afin d'illustrer 
le fonctionnement de votre script, utiliser le dataset [IRIS](https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data).

Votre script doit prendre en entré le chemin d'un fichier csv avec
les données et produire une collection de clusters. Les paramètres de l'algo
DBSCAN doivent être saisi comme arguments en ligne de commande.

exemple d'invocation du script:

```bash
pangaea-local-dbscan.py my-iris-data.csv --eps=0.1 --min-pts=2 --distance='euclidian'
```
Le format choisi pour representer les clusters est laissé à votre 
jugement.

### Notes
1. Le script doit accepter au moins ces deux valeurs pour l'argument 
--distance: 'euclidian' et 'manhattan' qui implémente chacune des métriques
respectivement.

2. Pour votre script, vous n'avez pas à implementer l'algorithme DBSCAN vous 
même, utiliser [sklearn](http://scikit-learn.org/stable/) !

## Visualisation
Déterminez une manière de visualiser graphiquement les données ainsi que les
résultats (projection 2D des donneés + couleurs?) de votre script DBSCAN. 
Valider le résultat du script avec votre outil de visualisation. 
Sont-ils conforment à vos attentes?

## Générateur de clusters
Scriptez un générateur de données aléatoire qui génère des clusters de "POI" 
(Point Of Interest) avec les attributs suivants:

1. lat
2. lon
3. rating
4. popularity

Les attributs des POI ainsi que le nombre de points par clusters doivent être
normalement distribué. A l'interne, votre generateur devra creer 4 distribution
normales pour chacun des clusteurs a generer, et une distribution
normale qui sera echantillonne afin de savoir combien de points seront 
genere pour chaque cluster. 

Les variances des distributions normales de chacun des attributs est donne en 
ligne de commande et est la meme pour tous les clusters. 

La variance du nombre de POI par cluster est passe en ligne de
commande. 

Le nombre moyen de POI par cluster est lu en ligne de commande.

Les moyennes de chacune des distributions des attributs des clusters
son obtenu de l'echantillonnement d'une distribution uniforme sur le domaine 
des valeurs de chacun des atrributs.

Le domaine de chacun des attributs est le suivant:

1. lat in [-90,90]
2. lon in [-180, 180]
3. rating in [0,10]
4. popularity [0,100]

Le generateur devra aussi inclure dans l'ensemble des données un
'bruit de fond' qui correspond à un ensemble de N points dont les attributs
sont uniformement distribué sur le domaine des attributs. Ce nombre N de points 
doit être un argument du script.

L'invocation de votre script devrait donc ressembler à ceci:

```bash
pangaea-cluster-gen --nbr-cluster=100 --mean-points-per-cluster=5
--cluster-size-variance=2 --lat-variance=0.01 --lon-variance=0.01 
--rating-variance=3 --popularity-variance=10 --noise=1000
```

Le script doit imprimer en sortie standard au format .csv les points generé. 
et le resultat doit etre utilisable par votre script DBSCAN.

### Notes
1. Vous pouvez choisir des valeurs par defaut afin de simplifier l'invocation
du script.

2. Si le résultat de l'echantillonnement d'une distribution donne une valeure
qui est hors du domaine de l'attribut, vous devez periodiser la valeur 
(e.g: une lat de 91 devient -90).

## Géneration dataset test
Utilisez Votre generateur de cluster pour générer des ensembles de tests de
taille diverses (e.g: 10, 100, 1000, 10000 clusters) etc.

## Benchmark
Calculez le temps requis afin d'effectuer le partionnement des données
en fonction du nombre de cluster. Tracez une courbe log-log du résultat. 

## Euclidian vs Manhattan
Decrivez qualitativement l'impact sur les données de l'utilisation de la 
m.trique de distance manhattan sur la classification des donnes.

## Limite maximale
Quelle est le nombre maximal de cluster qu'il vous est possible de
catrgoriser dans un temps raisonnable? (15-20 mins).

# Remise
Sur github
