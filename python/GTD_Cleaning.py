from google.colab import drive
drive.mount('/content/drive')

#1. Load Data From UMD
import pandas as pd

df = pd.read_excel("/content/drive/MyDrive/globalterrorismdb_0522dist.xlsx")
df.head()

#2. Clean Data
#2a. Fixing month 0 and adding event column
df["imonth"] = df["imonth"].replace(0, pd.NA)
df["terrorist_attack"] = 1

#2b. Pick most relevant columns
df = df[["terrorist_attack",
         "iyear",
        "imonth",
        "country_txt",
        "region_txt",
        "success",
        "suicide",
        "attacktype1_txt",
        "targtype1_txt",
        "weaptype1_txt",
        "nkill",
        "nwound",
        "propextent_txt",
        "ransom",]]
#2b. Renaming for SQL storage
df = df.rename(columns = {"iyear":"year",
                     "imonth":"month",
                     "country_txt":"country",
                     "region_txt":"region",
                     "attacktype1_txt":"attack_type",
                     "targtype1_txt":"target_type",
                     "weaptype1_txt":"weapon_type",
                     "nkill":"number_killed",
                     "nwound":"number_wounded",
                     "propextent_txt":"property_damage",
                     })
#2c. Categorical and Numerical Columns
#Categorical NA = "Unknown"
categorical_vars = ["country",
                    "region",
                    "attack_type",
                    "target_type",
                    "weapon_type",
                    "property_damage"]
for c in categorical_vars:
  df[c] = df[c].fillna("Unknown")

#Numerical and binary
df["number_killed"] = pd.to_numeric(df["number_killed"], errors="coerce")
df["number_wounded"] = pd.to_numeric(df["number_wounded"], errors="coerce")
df["ransom"] = pd.to_numeric(df["ransom"], errors="coerce")
df["success"] = df["success"].astype(int)
df["suicide"] = df["suicide"].astype(int)

#2d. Add Casualty column
#Raw casualties
df["casualties"] = df["number_killed"] + df["number_wounded"]

#Clean casualties
df["number_killed_clean"] = df["number_killed"].fillna(0)
df["number_wounded_clean"] = df["number_wounded"].fillna(0)
df["casualties_clean"] = df["number_killed_clean"] + df["number_wounded_clean"]

df.head()

#3. Export as CSV
df.to_csv("umd_terrorism_data.csv", index=False)
