import os

from joblib import load
import numpy as np
from sklearn import datasets

MODEL_DIR = os.environ["MODEL_DIR"]
MODEL_FILE = os.environ["MODEL_FILE"]
METADATA_FILE = os.environ["METADATA_FILE"]
MODEL_PATH = os.path.join(MODEL_DIR, MODEL_FILE)
METADATA_PATH = os.path.join(MODEL_DIR, METADATA_FILE)

def get_data():
    """
    Return data for inference.
    """
    print("Loading data...")
    diabetes_X, diabetes_y = datasets.load_diabetes(return_X_y=True)
    diabetes_X = diabetes_X[:, np.newaxis, 2]
    diabetes_X_test = diabetes_X[-20:]
    diabetes_y_test = diabetes_y[-20:]
    return diabetes_X_test, diabetes_y_test

print("Running inference...")

X, y = get_data()


# #############################################################################
# Load model
print("Loading model from: {}".format(MODEL_PATH))
regr = load(MODEL_PATH)

# #############################################################################
# Run inference
print("Scoring observations...")
y_pred = regr.predict(X)
print(y_pred)
