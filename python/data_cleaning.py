# data_cleaning.py
# Beginner-safe data cleaning script

import os
import pandas as pd

# -----------------------------
# 1. Get the base project path
# -----------------------------
# This gets the folder: Customer Purchase Behavior Analysis
BASE_DIR = os.path.dirname(
    os.path.dirname(os.path.abspath(__file__))
)

# -----------------------------
# 2. Define file paths
# -----------------------------
RAW_DATA_PATH = os.path.join(BASE_DIR, 'data', 'raw_customers.csv')
CLEAN_DATA_PATH = os.path.join(BASE_DIR, 'data', 'clean_customers.csv')

# -----------------------------
# 3. Load raw data
# -----------------------------
print("Loading raw data...")
df = pd.read_csv(RAW_DATA_PATH)

# -----------------------------
# 4. Data cleaning steps
# -----------------------------
print("Cleaning data...")

# Remove duplicate rows (if any)
df.drop_duplicates(inplace=True)

# Standardize gender values
df['gender'] = df['gender'].map({
    'M': 'Male',
    'F': 'Female'
})

# -----------------------------
# 5. Save cleaned data
# -----------------------------
df.to_csv(CLEAN_DATA_PATH, index=False)

print("✅ Data cleaned successfully!")
print("✅ Clean file saved at:", CLEAN_DATA_PATH)