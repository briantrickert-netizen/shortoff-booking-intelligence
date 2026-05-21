from pathlib import Path

from data_cleaning_utils import (
    add_month_column,
    clean_numeric_columns,
    clean_text_columns,
    load_csv,
    save_csv,
    standardize_dates,
)

INPUT_FILE = Path("data_sample/sample_lodgify_bookings.csv")
OUTPUT_FILE = Path("data_sample/clean_lodgify_bookings.csv")


def clean_lodgify_bookings():
    df = load_csv(INPUT_FILE)

    df = standardize_dates(df, ["booking_date", "check_in", "check_out"])
    df = add_month_column(df, "booking_date", "booking_month")
    df = add_month_column(df, "check_in", "check_in_month")

    numeric_columns = [
        "nights",
        "guest_count",
        "pet_count",
        "gross_revenue",
        "cleaning_fee",
        "pet_fee",
    ]

    df = clean_numeric_columns(df, numeric_columns)
    df = clean_text_columns(df, ["channel", "status"])

    df["estimated_net_revenue"] = df["gross_revenue"]
    df["revenue_per_night"] = df["gross_revenue"] / df["nights"]
    df["channel"] = df["channel"].replace("Unknown", "Lodgify Direct")
    df["status"] = df["status"].str.lower()

    save_csv(df, OUTPUT_FILE)


if __name__ == "__main__":
    clean_lodgify_bookings()