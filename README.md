# Providing Insights into Health Data Science Education through Artificial Intelligence


Implementation of the methodology used to identify learning tactics and strategies of students in health data science. 
The article is available here: https://www.biorxiv.org/content/10.1101/2024.03.22.586308v1.abstract

The methodology employed to address RQ3 involves the following steps:
![Method schema](https://github.com/nrohani/HDS-EDM/blob/main/overview.png)

1. Collecting clickstream data from students, which captures their interactions including engagement with video lectures, participation in discussion forums, projects, labs, and more. The data is not publicly available due to ethical and legal restrictions. 

2. Dividing students' clickstream data into meaningful sequences that represent learning sessions, reflecting their actions during each session. 

3. Utilising First-Order Markov Models and Expectation Maximization to calculate transition probabilities between different learning actions and clustering learning sessions using the transition probability matrix into meaningful groups of learning tactics. R code: 

4. Calculating the frequency of each learning tactic's usage by individual students and using that value to cluster students into meaningful groups, thereby demonstrating their learning strategies. Python code: 
### Dependency:
- Python 3.9.7
- R-4.1.3
- numpy==1.19.5
- scikit-image==0.18.3
- pandas
- matplotlib
- seaborn
- statistics
- scipy
- pMineR
- TraMineR
- ggplot2
### Codes 
- Find the R code for learning tactic identification at: https://github.com/nrohani/HDS-EDM/blob/main/LearningTactics.R
- The Python code for learning strategy discovery is available at: https://github.com/nrohani/HDS-EDM/blob/main/LearningStrategy.ipynb

### Contact
Please do not hesitate to contact me if you have any question: 

Email: Narjesrohani1996@gmail.com

Please cite the paper if you find it useful.
