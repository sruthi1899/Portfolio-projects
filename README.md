Titanic Survival Analysis - Readme
Aim
The aim of this project is to analyze the Titanic dataset to understand the factors influencing the survival of passengers. By performing detailed data exploration and applying statistical methods, we aim to draw meaningful conclusions regarding the characteristics that contributed to survival and those that did not. This project will cover data cleaning, feature engineering, handling missing data, detecting and removing outliers, and drawing insights from the dataset.

Methods Employed
1. Analysis
Univariate Analysis: Examining individual features in isolation to understand their distribution and behavior (e.g., age, fare).
Multivariate Analysis: Investigating the relationships between multiple features and their combined effects on survival (e.g., gender and class).
2. Feature Engineering
Creating New Columns: Constructing additional columns from existing data to enhance analysis, such as creating family size or extracting title from name.
Modifying Existing Columns: Correcting data types or grouping categories to make the data more manageable and useful for analysis.
3. Handling Outliers
Detecting Outliers in Numerical Data:
For normally distributed data, values beyond mean ± 3 standard deviations are considered outliers.
For non-normally distributed data, outliers are detected using the interquartile range (IQR) method: points beyond Q1 - 1.5 * IQR and Q3 + 1.5 * IQR are considered outliers.
Handling Outliers in Categorical Data:
Identifying highly imbalanced categories, such as extreme gender imbalance (e.g., 10,000 males and only 2 females), and making decisions to handle or eliminate these cases.
4. Handling Missing Values
Missing values were found in several columns:
Age: Imputed using appropriate statistical techniques.
Cabin: More than 70% of values were missing, leading to the decision to drop this column.
Embarked: Missing values were handled by imputing with the most frequent value or using domain-specific knowledge.
5. Detecting Outliers
Outliers in numerical columns such as Age and Fare were detected using both the normal distribution method and boxplots.
Categorical columns with extreme imbalances were analyzed to determine if certain categories needed to be excluded from analysis due to their rarity.


Conclusions

Missing Values: The dataset had missing values in key columns such as Age, Cabin, and Embarked, which were handled accordingly. The Cabin column had over 70% missing values, leading to its exclusion.

Outliers: Numerical outliers were detected using statistical techniques. Extreme cases were removed to improve the reliability of the analysis.

Survival Analysis:

Gender: Female passengers had a significantly higher chance of survival compared to male passengers.

Pclass: Traveling in Pclass 3 was the deadliest, with a significantly lower survival rate.

Embarked: Passengers who embarked from location C had a higher chance of survival compared to other embarkation points.

Age: Passengers between the ages of 20 to 40 were less likely to survive the disaster.

Family Size: Passengers traveling with smaller families had a higher chance of survival compared to those traveling alone or with large families.
