#randomforest.py
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report

# Step 1: Load the collected data from the CSV file
data = pd.read_csv('sleep_data.csv')  # Replace with your dataset file path

# Step 2: Preprocess the data
# Handle missing values
data = data.dropna()

# Split the data into features (X) and target (y)
X = data[['heart_rate', 'sleep_duration', 'restlessness']]
y = data['sleep_quality']

# Perform feature scaling or encoding if necessary

# Step 3: Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Step 4: Initialize and train the machine learning model
model = RandomForestClassifier(n_estimators=100)  # Replace with your preferred model
model.fit(X_train, y_train)

# Step 5: Evaluate the model
y_pred = model.predict(X_test)
print(classification_report(y_test, y_pred))

# Step 6: Make sleep recommendations for new data
new_data = pd.DataFrame({'heart_rate': [75], 'sleep_duration': [7.5], 'restlessness': [0.2]})  # Replace with your new data
prediction = model.predict(new_data)
recommendations = get_sleep_recommendations(prediction)  # Replace with your recommendations logic
print(recommendations)
