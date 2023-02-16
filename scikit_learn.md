```
from sklearn.neighbors import KNeighborsClassifier

# Create and fit the model
knn = KNeighborsClassifier()
knn.fit(X_train, y_train)

# Predict on the test features, print the results
pred = knn.predict(X_test)[0]
print("Prediction for test example 0:", pred)
```
-----------------------------------------------------
Compare k nearest neighbors classifiers with k=1 and k=5 on the handwritten digits data set, which is already loaded into the variables X_train, y_train, X_test, and y_test. You can set k with the n_neighbors parameter when creating the KNeighborsClassifier object, which is also already imported into the environment.

Which model has a higher test accuracy?
```
from sklearn.neighbors import KNeighborsClassifier

# Instantiate KNN classifiers with k=1 and k=5
knn1 = KNeighborsClassifier(n_neighbors=1)
knn5 = KNeighborsClassifier(n_neighbors=5)

# Fit the models on the training set
knn1.fit(X_train, y_train)
knn5.fit(X_train, y_train)

# Make predictions on the test set
y_pred1 = knn1.predict(X_test)
y_pred5 = knn5.predict(X_test)

# Count the number of correct predictions
correct1 = sum(y_pred1 == y_test)
correct5 = sum(y_pred5 == y_test)

# Print the results
print("Accuracy for k=1: {:.2f}%".format(correct1/len(y_test)*100))
print("Accuracy for k=5: {:.2f}%".format(correct5/len(y_test)*100))

Accuracy for k=1: 98.89%
Accuracy for k=5: 99.33%
```
---------------------------------------------------------
### Running LogisticRegression and SVC
In this exercise, you'll apply logistic regression and a support vector machine to classify images of handwritten digit

Apply logistic regression and SVM (using SVC()) to the handwritten digits data set using the provided train/validation split.
For each classifier, print out the training and validation accuracy.
```
from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC
digits = datasets.load_digits()
X_train, X_test, y_train, y_test = train_test_split(digits.data, digits.target)

# Apply logistic regression and print scores
lr = LogisticRegression()
lr.fit(X_train, y_train)
print(lr.score(X_train, y_train))
print(lr.score(X_test, y_test))

# Apply SVM and print scores
svm = SVC()
svm.fit(X_train, y_train)
print('SVM - Training accuracy:', svm.score(X_train, y_train))
print('SVM - Validation accuracy:', svm.score(X_test, y_test))
```

--------------------------------------------------
Sentiment analysis for movie reviews
In this exercise you'll explore the probabilities outputted by logistic regression on a subset of the Large Movie Review Dataset.

The variables X and y are already loaded into the environment. X contains features based on the number of times words appear in the movie reviews, and y contains labels for whether the review sentiment is positive (+1) or negative (-1).

Train a logistic regression model on the movie review data.
Predict the probabilities of negative vs. positive for the two given reviews.
Feel free to write your own reviews and get probabilities for those too!
```
# Instantiate logistic regression and train
lr = LogisticRegression()
lr.fit(X, y)

# Predict sentiment for a glowing review
review1 = "LOVED IT! This movie was amazing. Top 10 this year."
review1_features = get_features(review1)
print("Review:", review1)
print("Probability of positive review:", lr.predict_proba(review1_features.reshape(1,-1))[0,1])

# Predict sentiment for a poor review
review2 = "Total junk! I'll never watch a film by that director again, no matter how good the reviews."
review2_features = get_features(review2)
print("Review:", review2)
print("Probability of positive review:", lr.predict_proba(review2_features.reshape(1,-1))[0,1])
```

---------------------------------------------
Definitions
Vocabulary:
classification: learning to predict categories
• decision boundary: the surface separating different predicted classes
linear classifier: a classifier that learns linear decision
boundaries
o e.g., logistic regression, linear SVM
linearly separable: a data set can be perfectly explained by
a linear classifier
--------------------------------------------
In this exercise, you'll visualize the decision boundaries of various classifier types.

A subset of scikit-learn's built-in wine dataset is already loaded into X, along with binary labels in y.

Create the following classifier objects with default hyperparameters: LogisticRegression, LinearSVC, SVC, KNeighborsClassifier.
Fit each of the classifiers on the provided data using a for loop.
Call the plot_4_classifers() function (similar to the code here), passing in X, y, and a list containing the four classifiers.
```
from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC, LinearSVC
from sklearn.neighbors import KNeighborsClassifier

# Define the classifiers
classifiers = [LogisticRegression(), LinearSVC(), SVC(), KNeighborsClassifier()]

# Fit the classifiers
for c in classifiers:
    c.fit(X, y)

# Plot the classifiers
plot_4_classifiers(X, y, classifiers)
plt.show()
```
------------------------------------------------
Changing the model coefficients
When you call fit with scikit-learn, the logistic regression coefficients are automatically learned from your dataset. In this exercise you will explore how the decision boundary is represented by the coefficients. To do so, you will change the coefficients manually (instead of with fit), and visualize the resulting classifiers.

A 2D dataset is already loaded into the environment as X and y, along with a linear classifier object model.

Set the two coefficients and the intercept to various values and observe the resulting decision boundaries.
Try to build up a sense of how the coefficients relate to the decision boundary.
Set the coefficients and intercept such that the model makes no errors on the given training data.
```
import numpy as np
# Set the coefficients
model.coef_ = np.array([[-1,3]])
model.intercept_ = np.array([-6])

# Plot the data and decision boundary
plot_classifier(X,y,model)

# Print the number of errors
num_err = np.sum(y != model.predict(X))
print("Number of errors:", num_err)
```

--------------------------------------
Minimizing a loss function
In this exercise you'll implement linear regression "from scratch" using scipy.optimize.minimize.

We'll train a model on the Boston housing price data set, which is already loaded into the variables X and y. For simplicity, we won't include an intercept in our regression model.


Fill in the loss function for least squares linear regression.
Print out the coefficients from fitting sklearn's LinearRegression.
```
from sklearn.linear_model import LinearRegression
from scipy.optimize import minimize

# The squared error, summed over training examples
def my_loss(w):
    s = 0
    for i in range(y.size):
        # Get the true and predicted target values for example 'i'
        y_i_true = y[i]
        y_i_pred = w@X[i]
        s = s + (y_i_true - y_i_pred)**2
    return s

# Returns the w that makes my_loss(w) smallest
w_fit = minimize(my_loss, X[0]).x
print(w_fit)

# Compare with scikit-learn's LinearRegression coefficients
lr = LinearRegression(fit_intercept=False).fit(X,y)
print(lr.coef_)
```
---------------------------------------------------------------
Comparing the logistic and hinge losses
In this exercise you'll create a plot of the logistic and hinge losses using their mathematical expressions, which are provided to you.

The loss function diagram from the video is shown on the right.

Evaluate the log_loss() and hinge_loss() functions at the grid points so that they are plotted.
```
# Mathematical functions for logistic and hinge losses
def log_loss(raw_model_output):
   return np.log(1+np.exp(-raw_model_output))
def hinge_loss(raw_model_output):
   return np.maximum(0,1-raw_model_output)

# Create a grid of values and plot
grid = np.linspace(-2,2,1000)
plt.plot(grid, log_loss(grid), label='logistic')
plt.plot(grid, hinge_loss(grid), label='hinge')
plt.legend()
plt.show()
```
--------------------------------------------------------------

Implementing logistic regression
This is very similar to the earlier exercise where you implemented linear regression "from scratch" using scipy.optimize.minimize. However, this time we'll minimize the logistic loss and compare with scikit-learn's LogisticRegression (we've set C to a large value to disable regularization; more on this in Chapter 3!).

The log_loss() function from the previous exercise is already defined in your environment, and the sklearn breast cancer prediction dataset (first 10 features, standardized) is loaded into the variables X and y.

Input the number of training examples into range().
Fill in the loss function for logistic regression.
Compare the coefficients to sklearn's LogisticRegression.
```
# The logistic loss, summed over training examples
def my_loss(w):
    s = 0
    for i in range(len(y)):
        raw_model_output = w@X[i]
        s = s + log_loss(raw_model_output * y[i])
    return s

# Returns the w that makes my_loss(w) smallest
w_fit = minimize(my_loss, X[0]).x
print(w_fit)

# Compare with scikit-learn's LogisticRegression
lr = LogisticRegression(fit_intercept=False, C=1000000).fit(X,y)
print(lr.coef_)
```
