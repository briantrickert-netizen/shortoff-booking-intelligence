from pathlib import Path

from data_cleaning_utils import (
    add_month_column,
    clean_numeric_columns,
    clean_text_columns,
    load_csv,
    save_csv,
    standardize_dates,
)

INPUT_FILE = Path("data_sample/sample_airbnb_bookings.csv")
OUTPUT_FILE = Path("data_sample/clean_airbnb_bookings.csv")


def clean_airbnb_bookings():
    df = load_csv(INPUT_FILE)

    df = standardize_dates(df, ["booking_date", "check_in", "check_out"])
    df = add_month_column(df, "booking_date", "booking_month")
    df = add_month_column(df, "check_in", "check_in_month")

    numeric_columns = [
        "nights",
        "guest_count",
        "gross_revenue",
        "airbnb_fee_estimate",
        "net_revenue",
    ]

    df = clean_numeric_columns(df, numeric_columns)
    df = clean_text_columns(df, ["status"])

    df["channel"] = "Airbnb"
    df["revenue_per_night"] = df["net_revenue"] / df["nights"]
    df["status"] = df["status"].str.lower()

    save_csv(df, OUTPUT_FILE)


if __name__ == "__main__":
    clean_airbnb_bookings()