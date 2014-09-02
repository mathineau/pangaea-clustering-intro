Pangaea Clustering Intro
========================
This document is an introduction to the work you will be doing on the Pangaea Ultima Clustering component, which is 
part of the larger Pangaea Ultima system, a so called "Big Data" application. The document is intended to give you a 
"feel" for what the project is all about and to give you a broad overview of how the component you will be working on, 
the data clustering layer, will fit in the final production system. Once you are done reading through this, you should
have enough of a clue to stop picking your nose and start working.

Any questions? let me know at pelletier at mtrip.com.

Enjoy !

# What is Pangaea Ultima ?
Firstable, what is that Pangaea Ultima software system thing? To give you an answer, let me start by spelling out the 
dryest, most succint description that I can think of for what the system that we are trying to build should do. After 
that mandatory bit of crisp, rigourous definition, we'll follow suit with examples of how the system should work once 
we are done building it.

Definition: Pangaea Ultima is the name of a suite of software components whose tasks is to extract information from an 
heterogenous collection of data sources. The information thusly extracted is to be used as content for automated travel 
guide generation. 

If that sounds brutally simple and yet, awfully vague and ill defined, perhaps a concrete example would 
lift your mood.

## Pangaea Ultima from the ground up.
To illustrate the aforementioned concepts in action, imagine you have in your hand a hardcopy of your typical off the 
shelf travel guide book. What's to be found inside? Well, the concept of a travel guide seems to be oriented around the
patentable idea of "things to see in X" where X can be a Country, a Province/State or a City. Suggestion of things to 
see are diverse and can range from attractions such as the majestic Taj Mahal of India to the liver wrecking
Oktoberfest festival In Munich. The defining point is that they are all within the boundary of a certain region of 
interest (henceforth called ROI). 

What else? Each of these "Things to see" have a certain set of attributes that are designed to help you make the 
important decision of weither you want to visit this place or if you'd rather stay in the hotel lobby and down a bottle
of vodka. These trip defining attributes usually boil down to the following few: a name, a short description, 
a nice color picture, perhaps a rating of some kind given by the adventurer who built the guide and, most importantly, 
a coordinate set (latitude and longitude) to where the Point Of Interest (POI) under scrutiny is located. To generate 
those attributes,
the guide author obviously "cluster" and "merge" together information from different sources such as wikipedia.org, 
openstreetmap.org or even facebook.com. The task of clustering is in this case identifying that a given wiki article
and a given facebook page are talking about the same POI and the task of merging would be to take the arithmetic
mean of the sources latitude and longitude for the "real" geolocation of the POI.

Thats great! so far so good. Three minutes into our 1.99$ world travel guide already makes it clear what we should aim 
for when building our next google style web scalable travel guide system. Pangaea Ultima should be able to:

    1. Collect data about EVERYTHING that has a geolocation. Save that information to some datastore.
    2. Cluster the collected data into groups of complementary sources. Save computation result to some datastore.
    3. For each cluster of data, merge the data together into a coherent set of attributes. Save the computation result
    to some datastore.
    4. Create a travel guides by partitioning the created POI in different ROI. Save results to flat files.

Of course an implicit requirement of the system is that the information it produces should be
somewhat accurate. You would be pretty pissed off if, having followed the direction given by your 
*romantic trip to paris*, you would be led into a turkey vulture infested patch of god forsaken land in the middle of 
death valley. Other than that little accuracy constrain, if we manage to do these four things in a resonable 
amount of time, we'll be right on the money and, in a nutshell, that's all there is to the Pangaea Ultima System.

# Pangaea Ultima Clustering component.
If there remains any doubt as to what the clustering components you will be working on should do, it's probably been
diluted to homeopathic concentration by now so here is is anyway: pangaea-clustering is responsible for 
*the clustering of collected data into groups of complementary sources*. 

## Sources.
Here are a few of the data sources we will be using:

    1. wikipedia.org (all languages)
    2. [openstreet.org](http://wiki.openstreetmap.org/wiki/Main_Page)
    3. facebook.com
    4. mtrip.com (that's our content)
    5. twitter.com

This is not an exhaustive list.

## Typical scale of the data.
We aim to build a system that can handle clustering of ~100 million points data set.

## The Platform: Apache Spark On EC2.
The target platform for pangaea-cluster is an Apache Spark cluster on Amazon Elastic Cloud Compute.
The Apache Spark distribution includes handy scripts that will allow you to easily deploy Spark Cluster on EC2.
When you are ready to start working, I will give you a set of AWS Access Credential for deploying your own clusters.
You can familiarize yourself with spark by taking a look at the project's page [here](https://spark.apache.org/).

### On the question of language.
The Apache Spark API supports 3 languages out of the box: Java, Scala and Python. My take on this is you should start 
hacking in python unless you are so intimately familiar with one of the other two alternatives that using python would 
be an unecessary overhead. I've never used Java that much in production and Scala comes with a lot of new concepts 
([Monads](http://en.wikipedia.org/wiki/Monad_(functional_programming)) anyone?) that would complect the task of 
prototyping and developing efficient software with that of learning a new functional language. Since I only know
python, you will be on your own for deep technical issues related to either Java or Scala should you choose this road.
However, this is your project. I think you should be able to use the tools you see fit for the job so I will only ask
that you be able to explain why you choosed a particular language over the other.

## The Algorithm: DBSCAN.
In order to perform the clustering operation, the candidate algorithm to be used will be DBSCAN. Here is the [wiki
entry on the subject](http://en.wikipedia.org/wiki/DBSCAN)

# Milestones
The project will be brought to successful completion through the realisation of milestones. Each milestone will be 

    1. DBSCAN implementation on the EC2 Apache Spark cluster. Testing with the Iris dataset read from a CSV file.
    2. DBSCAN implementaion on the EC2 Apache Spark cluster. Testing with a large test dataset read from a PostgreSQL
    database.
    3. Tuning of the DBSCAN implementation "neighboorhood" function using mtrip.com dataset read from a PostgreSQL
    database.








