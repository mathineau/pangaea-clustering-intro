Pangaea Clustering Intro
========================
This document is an introduction to the work you will be doing on the Pangaea Ultima Clustering component, which is 
part of the larger Pangaea Ultima system, a so called "Big Data" application. The document is intended to give you a 
"feel" for what the project is all about and to give you a broad overview of how the component you will be working on, 
the data clustering layer, will fit in the global system. Once you are done reading through this, you should
have enough of a clue to stop picking your nose and start working.

Any questions? let me know at pelletier at mtrip.com.

Until then, grab a juice box, sit back and read on.

# What is Pangaea Ultima ?
Firstable, what is that Pangaea Ultima software system thing? To answer that kind of question, nothing works better than a 
crips and arrid description followed by an example

Description: 
> Pangaea Ultima is a suite of software components whose tasks is to extract information from an 
> heterogenous collection of data sources. The information thusly extracted is to be used as content for automated 
> travel guide generation. 

If that sounds as clear and open to interpretation as a random article pulled out of a chineese tax law, do not 
despair. I have crafted the perfect example to bring you to a happy level of enlightenment which I will present to you
in the next section. 

# Pangaea Ultima from the ground up
To illustrate the aforementioned Pangaea Ultima concepts in action, let us dissect the exhilarating day to day job of a
travel guide 
author. Perhaps it will help us gain some deeper insight as to what our described system should do and, at the very least
, we will acquire some empathy for the human condition. As a starter, 
imagine you have in your hand a hardcopy of your typical off the 
shelf travel guide book from our celebrated author. What's to be found inside? Well, the concept of a travel guide 
seems to be oriented around the
patentable idea of "things to see in X" where X can be a Country, a Province/State or a City. Suggestion of things to 
see are diverse and can range from the majestic Taj Mahal of India to the liver wrecking Oktoberfest of 
Munich. The defining point is that they are all within the boundary of a certain region of 
interest (henceforth called ROI). 

What else? Each of these "Things to see" have a certain set of "attributes" for you to consider. These attributes are
carefully engineered to help yu make the 
important decision of whether you should get up and visit the place or stay in the hotel parlor and down a bottle
of vodka with the lobby boy. These trip defining attributes usually boil down to the following few: a name, 
a short description, 
a nice color picture, perhaps a rating of some kind given by the adventurer who built the guide and, most importantly, 
a coordinate set (latitude and longitude) to where the Point Of Interest (POI) under scrutiny is located. To "generate" 
those attributes,
the guide author obviously "cluster" and "merge" together information from different sources such as wikipedia.org, 
openstreetmap.org or even facebook.com. The task of clustering is in this case identifying that a given wiki article
and a given facebook page are talking about the same POI. An example of merging would be to take the arithmetic
mean of the sources latitude and longitude for the "real" geolocation of the POI.

Thats great! so far so good. Three minutes into our 0.99$ world travel guide already makes it clear what we should aim 
for when building our next google style web scale travel guide system. Based on our analysis of the travel guide
author workflow, an automated system aimed at replacing him without anyone beeing able to ever tell the difference 
should be able to:

    1. Collect data about EVERYTHING that has a geolocation. Save that information to some datastore.
    2. Cluster the collected data into groups of complementary sources. Save computation result to some datastore.
    3. For each cluster of data, merge the data together into a coherent set of attributes. Save the computation result
    to some datastore.
    4. Create a travel guides by partitioning the created POI in different ROI. Save results to flat files.

Of course another requirement of the system that is valid at every steps of the process is that the information it 
produces should be somewhat accurate. I imagine a customer would be pretty pissed off if he, having followed the direction 
given by your *romantic trip to paris* guide, would be led into a turkey vulture infested patch of god forsaken land 
in the middle of death valley because of some geolocation error. Other than that little accuracy constrain, if we manage to do these 
four things in a resonable amount of time, we are . In a nutshell, that's all there is to the 
Pangaea Ultima System.

# Pangaea Ultima Clustering component
What we described so far is a complete system that gathers information, process it and produce new information.
The scope of the overall project is too large to be done in a single semester so I am delegating the implementation
of the clustering part to you. If there remains any doubt as to what that clustering components you will be working on 
should do, it's probably been diluted to homeopathic concentration by now. Just in case, here it is again

> the pangaea-clustering component is responsible for 
> *the clustering of collected data into groups of complementary sources*. 

The things you do NOT yet know are: 

    1. What are the different data sources we will use?
    2. What is the typical size of the data set we will use?
    3. What is the target platform for the software component?
    4. How do we cluster data points?
    5. How do we deliver the product?

Ok, this is where it gets serious, the rest of the document addresses these points.

## Different Sources
Here are a few of the data sources we will be using:

    1. wikipedia.org (all languages)
    2. openstreetmap.org
    3. facebook.com
    4. mtrip.com (we already have some content)
    5. twitter.com

This is not an exhaustive list.

## Typical scale of the data
We aim to build a system that can handle clustering of ~100 million points data set.

## The Target Platform: Apache Spark On EC2
The target platform for pangaea-cluster is an Apache Spark cluster deployed on [Amazon Elastic Cloud Compute](http://en.wikipedia.org/wiki/Amazon_Elastic_Compute_Cloud).
The Apache Spark distribution includes handy scripts that will allow you to easily deploy Spark Cluster on EC2.
When you are ready to start working, I will give you a set of AWS Access Credential for deploying your own clusters.
You can familiarize yourself with Spark by taking a look at the project's page [here](https://spark.apache.org/).

### On the question of language
The Apache Spark API supports 3 languages out of the box: Java, Scala and Python. My take on this is you should start 
hacking in **python** unless you are so intimately familiar with one of the other two alternatives that using python 
would be an unecessary overhead. Java is not so good at fast prototyping and Scala comes with a lot of new concepts 
([Monads](http://en.wikipedia.org/wiki/Monad_(functional_programming)) anyone?) that would complect the task of 
prototyping and developing efficient software with that of learning a new functional language. Since I only know
python, you will be on your own for deep technical issues related to either Java or Scala if you choose this path.
However, this is your project. I think you should be able to use the tools you see fit for the job so I will only ask
that you be able to explain why you selected a particular language over the other.

## Clustering data points: DBSCAN and feature selection
In order to perform the clustering operation, the candidate algorithm to be used will be DBSCAN. Here is the [wiki
entry on the subject](http://en.wikipedia.org/wiki/DBSCAN). You should skim the article in order to make the next 
paragraph more palatable.

Each data Point that we will collect will have a set of attributes (think geolocation, name, description etc). For 
each of these sources, there may be a different set of possible attributes. For facebook.com, it might be {name, 
latitude, longitude, opening hours, type} and for wikipedia.org it might be {lat, lon, category, name, image, introduction}
. Based off these attributes you will have to define a feature vector computable for points coming from 
*every sources*.  That feature vector is the input to the data clustering algorithm used. A possible feature vector 
that can be constructed from the 2 example data sources could be 
[category, latitude, longitude, class, mostCommonWordInDescription]. The point is that it should be possible, given a 
vector of feature, to compute a neighbourhood of points that are at a certain fixed distance or closer to it. 
For that you will need to define a norm for your feature vector. When considering norm on vectors, one naturally thinks
of the Eucledian Norm but it could be *anything* ranging from the 
[manhattan distance](http://en.wikipedia.org/wiki/Taxicab_geometry) to a handcrafted 
[decision tree](http://en.wikipedia.org/wiki/Decision_tree) that returns a distance based on a complex if-then-else 
process.

There is one point that I wish to emphasize here. Figuring out a good feature vector is **hard**. Figuring out a
good feature vector/distance measure combination is even harder. I expect that you will experiment a lot with 
different combinations. It would therefore be wise to implement the clustering algorithm as a highher order function
taking a distance function as input. In python (following the naming convention of the DBSCAN wiki article) this would 
give the following function signature:

```python
def dbscan(D, eps, MinPts, distance_fn=euclidian_norm):
    # the algorithm uses the euclidian norm by default but it's 
    # easy to switch the distance function.
    ...
    return clusters
```

The algorithm also cannot depend on a particular representation of the feature vector (e.g: you cannot rely on the
fact that there is a "name" attribute in the dbscan algorithm implementation). You can however tie distance function
implementation to a particular feature vector representation.

## Delivering the product: Milestones
The project will be brought to a successful completion through the prototyping of milestones. Each milestone will be 
bundled with a small demo of the result. When we are ready to start, we will establish together the milestones 
requirement.



