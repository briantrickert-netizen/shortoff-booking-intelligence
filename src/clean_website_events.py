import pandas as pd
from pathlib import Path

INPUT_FILE = Path("data_sample/sample_website_events.csv")
OUTPUT_FILE = Path("data_sample/clean_website_events.csv")

def clean_website_events():
    df = pd.read_csv(INPUT_FILE)

    df["event_date"] = pd.to_datetime(df["event_date"])
    df["event_month"] = df["event_date"].dt.to_period("M").astype(str)

    text_columns = [
        "visitor_id",
        "session_id",
        "traffic_source",
        "device",
        "landing_page",
        "event_name",
        "page_url",
    ]

    for col in text_columns:
        df[col] = df[col].fillna("Unknown").astype(str).str.strip()

    df["traffic_source"] = df["traffic_source"].str.title()
    df["device"] = df["device"].str.title()
    df["event_name"] = df["event_name"].str.lower()

    df.to_csv(OUTPUT_FILE, index=False)

    print(f"Cleaned website events saved to {OUTPUT_FILE}")
    print(df.head())

if __name__ == "__main__":
    clean_website_events()