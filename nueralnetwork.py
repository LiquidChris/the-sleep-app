#nueralnetwork.py
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import MinMaxScaler
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense

# Step 1: Load the collected data from the CSV file
data = pd.read_csv('sleep_data.csv')  # Replace with your dataset file path

# Step 2: Preprocess the data
# Handle missing values
data = data.dropna()

# Split the data into features (X) and target (y)
X = data[['heart_rate', 'sleep_duration', 'restlessness']]
y = data['sleep_quality']

# Perform feature scaling
scaler = MinMaxScaler()
X_scaled = scaler.fit_transform(X)

# Step 3: Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X_scaled, y, test_size=0.2, random_state=42)

# Step 4: Initialize and train the neural network model
model = Sequential()
model.add(Dense(16, activation='relu', input_shape=(X_train.shape[1],)))
model.add(Dense(8, activation='relu'))
model.add(Dense(1, activation='sigmoid'))

model.compile(loss='binary_crossentropy', optimizer='adam', metrics=['accuracy'])
model.fit(X_train, y_train, epochs=10, batch_size=32)

# Step 5: Evaluate the model
_, accuracy = model.evaluate(X_test, y_test)
print('Accuracy:', accuracy)

# Step 6: Make sleep recommendations for new data
new_data = pd.DataFrame({'heart_rate': [75], 'sleep_duration': [7.5], 'restlessness': [0.2]})  # Replace with your new data
new_data_scaled = scaler.transform(new_data)
prediction = model.predict(new_data_scaled)
recommendations = get_sleep_recommendations(prediction)  # Replace with your recommendations logic
print(recommendations)
