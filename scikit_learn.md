from sklearn.neighbors import KNeighborsClassifier

# Create and fit the model
knn = KNeighborsClassifier()
knn.fit(X_train, y_train)

# Predict on the test features, print the results
pred = knn.predict(X_test)[0]
print("Prediction for test example 0:", pred)

-----------------------------------------------------
Compare k nearest neighbors classifiers with k=1 and k=5 on the handwritten digits data set, which is already loaded into the variables X_train, y_train, X_test, and y_test. You can set k with the n_neighbors parameter when creating the KNeighborsClassifier object, which is also already imported into the environment.

Which model has a higher test accuracy?


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

---------------------------------------------------------
Running LogisticRegression and SVC
In this exercise, you'll apply logistic regression and a support vector machine to classify images of handwritten digit

Apply logistic regression and SVM (using SVC()) to the handwritten digits data set using the provided train/validation split.
For each classifier, print out the training and validation accuracy.


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


--------------------------------------------------
Sentiment analysis for movie reviews
In this exercise you'll explore the probabilities outputted by logistic regression on a subset of the Large Movie Review Dataset.

The variables X and y are already loaded into the environment. X contains features based on the number of times words appear in the movie reviews, and y contains labels for whether the review sentiment is positive (+1) or negative (-1).

Instructions
100 XP
Train a logistic regression model on the movie review data.
Predict the probabilities of negative vs. positive for the two given reviews.
Feel free to write your own reviews and get probabilities for those too!

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


---------------------------------------------
Definitions
Vocabulary:
⚫ classification: learning to predict categories
• decision boundary: the surface separating different predicted classes
⚫ linear classifier: a classifier that learns linear decision
boundaries
o e.g., logistic regression, linear SVM
linearly separable: a data set can be perfectly explained by
a linear classifier
--------------------------------------------
In this exercise, you'll visualize the decision boundaries of various classifier types.

A subset of scikit-learn's built-in wine dataset is already loaded into X, along with binary labels in y.

Instructions
100 XP
Create the following classifier objects with default hyperparameters: LogisticRegression, LinearSVC, SVC, KNeighborsClassifier.
Fit each of the classifiers on the provided data using a for loop.
Call the plot_4_classifers() function (similar to the code here), passing in X, y, and a list containing the four classifiers.

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



