import sqlite3
from pathlib import Path

import pandas as pd

DATA_PATH = Path("data_sample")
DB_PATH = DATA_PATH / "booking_intelligence_sample.db"

WEBSITE_FILE = DATA_PATH / "clean_website_events.csv"
LODGIFY_FILE = DATA_PATH / "clean_lodgify_bookings.csv"
AIRBNB_FILE = DATA_PATH / "clean_airbnb_bookings.csv"


def build_database():
    website = pd.read_csv(WEBSITE_FILE)
    lodgify = pd.read_csv(LODGIFY_FILE)
    airbnb = pd.read_csv(AIRBNB_FILE)

    lodgify_bookings = lodgify.copy()
    lodgify_bookings["platform"] = "Lodgify Direct"
    lodgify_bookings["net_revenue"] = lodgify_bookings["estimated_net_revenue"]

    airbnb_bookings = airbnb.copy()
    airbnb_bookings["platform"] = "Airbnb"

    common_columns = [
        "booking_id",
        "booking_date",
        "check_in",
        "check_out",
        "nights",
        "guest_count",
        "gross_revenue",
        "net_revenue",
        "status",
        "booking_month",
        "check_in_month",
        "platform",
        "revenue_per_night",
    ]

    all_bookings = pd.concat(
        [
            lodgify_bookings[common_columns],
            airbnb_bookings[common_columns],
        ],
        ignore_index=True,
    )

    with sqlite3.connect(DB_PATH) as conn:
        website.to_sql("website_events", conn, if_exists="replace", index=False)
        lodgify.to_sql("lodgify_bookings", conn, if_exists="replace", index=False)
        airbnb.to_sql("airbnb_bookings", conn, if_exists="replace", index=False)
        all_bookings.to_sql("all_bookings", conn, if_exists="replace", index=False)

    print(f"Database created: {DB_PATH}")
    print("Tables created:")
    print("- website_events")
    print("- lodgify_bookings")
    print("- airbnb_bookings")
    print("- all_bookings")


if __name__ == "__main__":
    build_database()