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
we are done building.

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

What else? Each of these "Things to see" have a certain set of attributes that might help you to decide if 
you want to visit this place or if you'd rather stay in the hotel lobby and down a bottle of vodka. These trip defining 
attributes usually boil down to the following few: a name, a short description, a nice color picture,
perhaps a rating of some kind given by the adventurer who built the guide and, most importantly, a coordinate set
(latitude and longitude) to where the Point Of Interest (POI) under scrutiny is located. To generate those attributes,
the guide author obviously "cluster" and "merge" together information from different sources such as wikipedia.org, 
openstreetmap.org or even facebook.com. The task of clustering is in this case identifying that a given wiki article
and a given facebook page are talking about the same POI and the task of merging would be to take the arithmetic
mean of the sources latitude and longitude for the "real" geolocation of the POI.

Thats great! so far so good. Three minutes into our 1.99$ world travel guide already makes it clear what we should aim 
for when building our next google style web scalable travel guide system. Pangaea Ultima should be able to:

    1) Collect data about EVERYTHING that has a geolocation. Save that information somehwere.
    -> 2) Cluster the collected data into groups of complementary sources. <- 
    3) Merge the data

# Pangaea Ultima Clustering component.
If there remains any doubt as to what the clustering components you will be working on should do, it's probably been
diluted to homeopathic concentration by now so it will come as no surprise to you that pangaea-clusteting


## The Machines: Amazon Elastic Cloud Computes.

## The Platform: Apache Spark.

## The Algorithm: DBSCAN.


# Milestones









