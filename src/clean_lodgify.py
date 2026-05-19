import pandas as pd
from pathlib import Path

INPUT_FILE = Path("data_sample/sample_lodgify_bookings.csv")
OUTPUT_FILE = Path("data_sample/clean_lodgify_bookings.csv")

def clean_lodgify_bookings():
    df = pd.read_csv(INPUT_FILE)

    date_columns = ["booking_date", "check_in", "check_out"]
    for col in date_columns:
        df[col] = pd.to_datetime(df[col])

    df["booking_month"] = df["booking_date"].dt.to_period("M").astype(str)
    df["check_in_month"] = df["check_in"].dt.to_period("M").astype(str)

    numeric_columns = [
        "nights",
        "guest_count",
        "pet_count",
        "gross_revenue",
        "cleaning_fee",
        "pet_fee",
    ]

    for col in numeric_columns:
        df[col] = pd.to_numeric(df[col], errors="coerce").fillna(0)

    df["estimated_net_revenue"] = df["gross_revenue"]
    df["revenue_per_night"] = df["gross_revenue"] / df["nights"]

    df["channel"] = df["channel"].fillna("Lodgify Direct").astype(str).str.strip()
    df["status"] = df["status"].fillna("Unknown").astype(str).str.lower()

    df.to_csv(OUTPUT_FILE, index=False)

    print(f"Cleaned Lodgify bookings saved to {OUTPUT_FILE}")
    print(df.head())

if __name__ == "__main__":
    clean_lodgify_bookings()