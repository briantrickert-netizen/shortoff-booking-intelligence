import pandas as pd
from pathlib import Path

INPUT_FILE = Path("data_sample/sample_airbnb_bookings.csv")
OUTPUT_FILE = Path("data_sample/clean_airbnb_bookings.csv")

def clean_airbnb_bookings():
    df = pd.read_csv(INPUT_FILE)

    date_columns = ["booking_date", "check_in", "check_out"]
    for col in date_columns:
        df[col] = pd.to_datetime(df[col])

    df["booking_month"] = df["booking_date"].dt.to_period("M").astype(str)
    df["check_in_month"] = df["check_in"].dt.to_period("M").astype(str)

    numeric_columns = [
        "nights",
        "guest_count",
        "gross_revenue",
        "airbnb_fee_estimate",
        "net_revenue",
    ]

    for col in numeric_columns:
        df[col] = pd.to_numeric(df[col], errors="coerce").fillna(0)

    df["channel"] = "Airbnb"
    df["revenue_per_night"] = df["net_revenue"] / df["nights"]
    df["status"] = df["status"].fillna("Unknown").astype(str).str.lower()

    df.to_csv(OUTPUT_FILE, index=False)

    print(f"Cleaned Airbnb bookings saved to {OUTPUT_FILE}")
    print(df.head())

if __name__ == "__main__":
    clean_airbnb_bookings()