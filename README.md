# Shortoff Booking Intelligence Dashboard

## Project Overview

This project is a business intelligence dashboard for a privately owned vacation rental business, Shortoff Mountain Retreats.

The dashboard combines website event data, direct-booking data, and Airbnb-style booking data to compare marketing channels, booking behavior, revenue performance, and direct-booking opportunity.

The goal is to understand which traffic sources and booking platforms create the most profitable reservations and where guests may be dropping off before booking.

## Business Problem

Shortoff Mountain Retreats receives traffic and bookings from multiple sources, including direct website visitors, Lodgify/direct booking, Airbnb, Google, social media, and referrals.

Without a combined view of website behavior and booking-channel revenue, it is difficult to answer basic business questions:

- Which traffic sources create booking intent?
- Which booking channel produces the most revenue?
- Do direct bookings retain more revenue than Airbnb bookings?
- Are guests using Airbnb reviews as a trust signal before booking direct?
- Where should marketing effort be focused?

## Tools Used

- Python
- Pandas
- Jupyter Notebook
- SQL
- SQLite
- Matplotlib
- Seaborn
- Git
- GitHub

## Data Sources

This public repository uses synthetic sample data for privacy and business-security reasons.

The sample data includes:

- Website events
- Lodgify/direct booking records
- Airbnb-style booking records

The private business version can use real booking and website data, but real guest information, exact revenue exports, platform records, and credentials are excluded from this public repo.

## Key Metrics

The project analyzes:

- Website events by traffic source
- Booking-intent events by traffic source
- Airbnb review-link clicks
- Revenue by booking platform
- Estimated net revenue by platform
- Average booking value
- Average revenue per night
- Monthly revenue trends
- Booking count by platform

## Project Structure

```text
shortoff-booking-intelligence/
├── data_sample/
│   ├── sample_website_events.csv
│   ├── sample_lodgify_bookings.csv
│   ├── sample_airbnb_bookings.csv
│   ├── clean_website_events.csv
│   ├── clean_lodgify_bookings.csv
│   └── clean_airbnb_bookings.csv
├── data_private/
│   └── excluded from GitHub
├── notebooks/
│   └── booking_intelligence_analysis.ipynb
├── src/
│   ├── clean_website_events.py
│   ├── clean_lodgify.py
│   ├── clean_airbnb.py
│   └── build_database.py
├── sql/
│   └── marketing_metrics.sql
├── docs/
│   └── screenshots/
├── README.md
├── requirements.txt
└── .gitignore

## Dashboard Screenshots

### Traffic by Source
![Traffic by Source](docs/screenshots/traffic_by_source.png)

### Booking Intent by Source
![Booking Intent by Source](docs/screenshots/booking_intent_by_source.png)

### Revenue by Platform
![Revenue by Platform](docs/screenshots/revenue_by_platform.png)

### Monthly Revenue by Platform
![Monthly Revenue by Platform](docs/screenshots/monthly_revenue_by_platform.png)

### Average Booking Value by Platform
![Average Booking Value by Platform](docs/screenshots/avg_value_by_platform.png)

## Sample Insights

Initial analysis shows several useful business questions the dashboard can support:

1. Google Organic and Direct traffic appear to generate strong booking-intent activity.
2. Airbnb may provide booking volume and trust through reviews, but direct bookings may retain stronger net revenue.
3. Airbnb review clicks should be treated as a high-intent trust signal.
4. Mobile and desktop behavior should be compared to identify potential booking friction.
5. Direct-booking conversion should be tracked because small improvements may increase retained revenue.