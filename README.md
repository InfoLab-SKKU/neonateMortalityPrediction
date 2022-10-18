## Multilayer dynamic ensemble model for intensive care unit mortality prediction of neonate patients  
We propose a multilayer dynamic ensemble-based model to predict mortality as a classification task and LoS as a regression task for neonates admitted to the NICU. The model has been built based on the patient’s time-series data of the first 24 h in the NICU. We utilized a cohort of 3,133 infants from the MIMIC-III real dataset to build and optimize the selected algorithms. It has shown that the dynamic ensemble models achieved better results than other classifiers, and static ensemble regressors achieved better results than classical machine learning regressors. The proposed optimized model is supported by three well-known explainability techniques of SHAP, decision tree visualization, and rule-based system. 

For more details, please check [our
paper](https://authors.elsevier.com/a/1ftos5SMDQmqeY).

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

## Citation
We would appreciate if you consider citing our work when using our code.

```bibtex
@article{JURAEV2022104216,
title = {Multilayer dynamic ensemble model for intensive care unit mortality prediction of neonate patients},
journal = {Journal of Biomedical Informatics},
volume = {135},
pages = {104216},
year = {2022},
issn = {1532-0464},
doi = {https://doi.org/10.1016/j.jbi.2022.104216},
author = {Firuz Juraev and Shaker El-Sappagh and Eldor Abdukhamidov and Farman Ali and Tamer Abuhmed}
}
```
