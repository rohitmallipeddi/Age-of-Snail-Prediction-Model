# Age-of-Snail-Prediction-Model
Created a model that predicted the age of a snail based on its physical attributes by implementing Linear Regression and Cross-Validation using R and Excel.
For the Linear Model, I have applied Interactions and Transformations. The process of selecting an ideal transformation for each predictor was an iterative one. 
For each predictor, I have used only two types of transformations on the predictors, log, square roots, and tried to predict the output only using this predictor. 
For example, to find the best transformation for the predictor Diameter, I had created three models, one which predicted Rings using only Diameter, one which predicted 
Rings using log (Diameter) and one which predicted Rings using square root (Diameter). The model with the best Training R-Squared value determined the best transformation for that predictor. 
Similarly, the best transformations for predictors was also determined.

The interaction terms used were determined based on a trial-and-error basis (Mixed selection). A few iterations can be found in the submitted R-File. 
The aim was to make sure that the Training R-squared model was high while at the same making sure that the p-values of the predictors were low, ensuring that the predictors are relevant while determining the response. 
The highest p-value in the model was 0.36, which I feel is acceptable in a real-world scenario.

After finalizing the model, the entire dataset was again split into two parts, training and testing data and the model was trained only on the training data and was later tested on the testing data to determine the Test MSE and the Testing R-Squared value. 
The calculated Testing R-Squared and Test MSE were 0.5704 and 4.5534 respectively. This means that the model was able to explain 57.04 per cent of the variability observed in the testing data. The square root of 4.5534 is approximately 2.134, which means that the estimation of Rings for each observation varied by +/-2.133.
