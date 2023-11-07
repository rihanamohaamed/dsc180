# Q1 Checkpoint Code

Paper link: https://ccforum.biomedcentral.com/articles/10.1186/s13054-019-2486-6

Instructions for setting up database can be found at this link: https://github.com/MIT-LCP/mimic-code/blob/main/mimic-iii/buildmimic/postgres/README.md

Access info for data can be found here: https://kshannon.github.io/ucsd-dsc180/#intro

## KMeans: 
* This jupyter notebook is the first attempt at replicating the KMeans analysis done in 
our paper. However, this analysis is not actually used when the researchers talk about 
their findings. The KMeans is used for researchers to initially look for patterns between 
diseases. This jupyter notebook walks through an example of how the researchers might 
look at disease prevalence to continue onto other ways to identify subgroups.

## Network Visualization:
* This Jupyter notebook is the first attempt at replicating the Network Visualizations shown in the paper. The authors of this paper used these visualizations to see which diseases tend to occur in combination with each other. In the initial approach, a relative risk measure was used to measure the risk of co-ocurrence of two diseases for edges. When characterizing subgroups, the edges are instead replaced with the disease pair normalized to the total number of patients in the subgroup.

## LCA (Latent Class Analysis): 
### Requires
- create_patient_info.sql (creates patient info table needed for LCA in your database)
- create_elixhauser_quan.sql (creates table with comorbidity composition for each admission; code written by MIMIC-III authors)
- create_LCA_table.sql (joins patient_info and elixhauser_quan to create table with necessary info for LCA i.e. age, admission_type_encoded, and comorbidities into one table)
- LCA-Q1_CheckPoint.rmd (Where LCA is executed, requires poLCA library and RPostgreSQL library)
* This code is the first attempt at replicating the LCA done in the paper. LCA defines subgroups as a combination of measured variables and relates them to a set of unobserved variables using a subset of structural equation modeling. The resulting classes are mutually exclusive and patients within each class share clinical similarities. We perform LCA using age, admission_type_encoded (emergency or non-emergency), and morbidity composition of a patient (i.e. which Elixhauser categories were present). This model will undergo further assessment.
### Renders
- Q1_Checkpoint_LCA.pdf

