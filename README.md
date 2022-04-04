## Multilayer dynamic ensemble model for intensive care unit mortality prediction of neonate patients  


### The architecture of the proposed framework 
<img src="assets/images/figure_1_architecture.png">  

### Demo Video for a web application 
[YouTube video link](https://www.youtube.com/watch?v=8cM7p4Oats0)


### Guideline for reproducing results 

Folders order: 
1. data_preprocessing 
2. classification_task 
3. regression_task 
4. data_analysis 
5. explainability 


#### Data Preprocessing (Folder: data_preprocessing) 
The notebooks are order by steps. 
- For starting first notebook: **"Step 1 - Extracting 3299 Unique Neonates .ipynb"**. Please, first download the MIMIC-III dataset and extract the rows with SUBJECT IDs on **"neonates_with_all_features.csv"** (neonates ids). 
- Then you can follow the other steps one by one. 

 
#### Classification Task (Folder: classification_task)  
There is no order in this folder, you can run any experiments and get the results. There is no need for hyperparameter optimization (there are optimized hyperparameters as well). 

#### Regression Task (Folder: regression_task)   
In this stage, you can run the notebooks as follow: 
1. Single ML Regressors.ipynb 
2. Static Ensemble ML Regressors.ipynb 
3. Feature Importance.ipynb 

#### Data Analysis (Folder: data_analysis) 
In data analysis folder, you can reproduce the comparison diagrams of the paper. There is no strict order in notebooks, you can start running with any of them. 

#### Explainability (Folder: explainability)  
In explainability folder, all notebooks are independent from each other. You can run any of them and reproduce the explainabilities on the paper. 

