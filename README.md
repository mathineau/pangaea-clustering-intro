Pangaea Clustering Intro
========================
This document is an introduction to the work you will be doing on the Pangaea Ultima Clustering component, which is 
part of the larger Pangaea Ultima system. The document is intended to give you a "feel" for what the project is all 
about and to give you a broad overview of how the component you will be working on, the data clustering layer, 
will fit in the final production system. Once you are done reading through this, you should have enough of a clue to
start working.

Any questions? let me know at pelletier at mtrip.com. 

Enjoy !

# What is Pangaea Ultima ?
Firstable,  what is that Pangaea Ultima software thing? To give you an answer, let me start by spelling out the dryest,
most succint description that I can think of for what the system that we are trying to build should do. After that 
mandatory bit of crisp, rigourous definition, we'll follow suit with examples of how the system should work once we are 
done building it.

Pangaea Ultima is the name of a suite of software components whose tasks is to extract information from an heterogenous 
collection of data sources. The information thusly extracted is to be used as content for automated travel guide 
generation. 

If that sounds brutally simple and yet, awfully vague and ill defined, perhaps a concrete example would 
lift your mood.

# Example of Automatic Guide Generation.
To illustrate the aforementioned concepts in action, imagine you have in your hand a hardcopy of your typical off the 
shelf travel guide book. What's to be found inside? Well, the concept of a travel guide seems to be oriented around the
idea of "things to see in X" where X can be a Country, a Province/State or a City. Suggestion of things to see are 
diverse and can range from attractions such as the majestic Taj Mahal of India to the liver wrecking
Oktoberfest festival In Munich. The defining point is that they are all within the boundary of a certain region of 
interest (henceforth called ROI). 

What else? Each of these "Things to see" have a certain set of attributes that might help you to decide if 
you want to visit this place or if you'd rather stay at the hotel bar and down a bottle of vodka. These trip defining 
attributes usually boil down to the following few: a name, a short description, a nice color picture,
perhaps a rating of some kind given by the adventurer who built the guide and, most importantly, a coordinate set
(latitude and longitude) to where the Point Of Interest under scrutiny is located. To generate those attributes,
the guide author obviously collect and "merge" together information from different information sources such as 
wikipedia, openstreetmap even facebook.com.

Thats great! Three minutes into our 1.99$ world travel guide already makes it clear what we should aim for when 
building our next google style travel guide system. It goes like this

# Pangaea Clustering.
The role of the clustering is to detect 







