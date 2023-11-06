# dsc180

Paper link: https://ccforum.biomedcentral.com/articles/10.1186/s13054-019-2486-6

KMeans: 
This jupyter notebook is the first attempt at replicating the KMeans analysis done in 
our paper. However, this analysis is not actually used when the researchers talk about 
their findings. The KMeans is used for researchers to initially look for patterns between 
diseases. This jupyter notebook walks through an example of how the researchers might 
look at disease prevalence to continue onto other ways to identify subgroups.

Network Visualization:
This Jupyter notebook is the first attempt at replicating the Network Visualizations shown in the paper. The authors of this paper used these visualizations to see which diseases tend to occur in combination with each other. In the initial approach, a relative risk measure was used to measure the risk of co-ocurrence of two diseases for edges. When characterizing subgroups, the edges are instead replaced with the disease pair normalized to the total number of patients in the subgroup.