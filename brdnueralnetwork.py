import pandas as pd
import numpy as np
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense

# Load the sleep data
df = pd.read_csv("sleep_data.csv")

# Create the features and target variables
features = df[["timeInBed", "timeAsleep", "sleepStages", "restlessSleep", "awakenings", "heartRate", "respiratoryRate"]]
target = df["sleepQuality"]

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(features, target, test_size=0.2)

# Create the neural network model
model = Sequential()
model.add(Dense(128, activation="relu"))
model.add(Dense(64, activation="relu"))
model.add(Dense(1, activation="sigmoid"))

# Compile the model
model.compile(loss="binary_crossentropy", optimizer="adam", metrics=["accuracy"])

# Train the model
model.fit(X_train, y_train, epochs=10)

# Evaluate the model
score = model.evaluate(X_test, y_test, verbose=0)
print("Accuracy:", score[1])

# Get the sleep recommendations
predictions = model.predict_proba(X_test)

# Print the sleep recommendations
for i in range(len(predictions)):
    print("User {} has a {}% chance of getting a good night's sleep.".format(i + 1, predictions[i][1] * 100))
Use code with caution. Learn more
content_copy
