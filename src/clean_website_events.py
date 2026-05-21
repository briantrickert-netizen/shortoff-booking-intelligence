from pathlib import Path

from data_cleaning_utils import (
    add_month_column,
    clean_text_columns,
    load_csv,
    save_csv,
    standardize_dates,
)

INPUT_FILE = Path("data_sample/sample_website_events.csv")
OUTPUT_FILE = Path("data_sample/clean_website_events.csv")


def clean_website_events():
    df = load_csv(INPUT_FILE)

    df = standardize_dates(df, ["event_date"])
    df = add_month_column(df, "event_date", "event_month")

    text_columns = [
        "visitor_id",
        "session_id",
        "traffic_source",
        "device",
        "landing_page",
        "event_name",
        "page_url",
    ]

    df = clean_text_columns(df, text_columns)

    df["traffic_source"] = df["traffic_source"].str.title()
    df["device"] = df["device"].str.title()
    df["event_name"] = df["event_name"].str.lower()

    save_csv(df, OUTPUT_FILE)


if __name__ == "__main__":
    clean_website_events()