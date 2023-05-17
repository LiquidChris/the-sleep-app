import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report

# Step 1: Load and preprocess the dataset
data = pd.read_csv('sleep_data.csv')  # Replace with your dataset
X = data[['heart_rate', 'oxygen_levels']]  # Features: heart rate and oxygen levels
y = data['sleep_quality']  # Target: sleep quality labels

# Step 2: Split the dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Step 3: Initialize and train the machine learning model
model = RandomForestClassifier(n_estimators=100)  # Replace with your preferred model
model.fit(X_train, y_train)

# Step 4: Evaluate the model
y_pred = model.predict(X_test)
print(classification_report(y_test, y_pred))

# Step 5: Make sleep recommendations for new data
new_data = pd.DataFrame({'heart_rate': [75], 'oxygen_levels': [95]})  # Replace with your new data
prediction = model.predict(new_data)
recommendations = get_sleep_recommendations(prediction)  # Define your recommendations logic
print(recommendations)