# HDS-EDM
Providing Insights into Health Data Science Education through Artificial Intelligence

Implementation of the methodology used to identify learning tactics and strategies of students in the health data science course. The article is avalable: 
The methodology employed to address RQ3 involves the following steps:
https://github.com/nrohani/HDS-EDM/blob/main/overview.png

1. Collecting clickstream data from students, which captures their interactions including engagement with video lectures, participation in discussion forums, projects, labs, and more. The data is not publicly available due to ethical and legal restrictions. 

2. Dividing students' clickstream data into meaningful sequences that represent learning sessions, reflecting their actions during each session. 

3. Utilising First-Order Markov Models and Expectation Maximization to calculate transition probabilities between different learning actions and clustering learning sessions using the transition probability matrix into meaningful groups of learning tactics. R code: 

4. Calculating the frequency of each learning tactic's usage by individual students and using that value to cluster students into meaningful groups, thereby demonstrating their learning strategies. Python code: 
