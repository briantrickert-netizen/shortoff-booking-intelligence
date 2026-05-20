#!/usr/bin/env bash
set -euo pipefail

mkdir -p data_sample

cat > data_sample/sample_website_events.csv <<'EOF'
event_date,visitor_id,session_id,traffic_source,device,landing_page,event_name,page_url
2026-01-03,V001,S001,Google Organic,Mobile,/home,page_view,https://www.shortoffmountainretreats.com/
2026-01-03,V001,S001,Google Organic,Mobile,/home,gallery_view,https://www.shortoffmountainretreats.com/gallery/
2026-01-03,V001,S001,Google Organic,Mobile,/home,availability_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-01-05,V002,S002,Direct,Desktop,/book-your-stay,page_view,https://www.shortoffmountainretreats.com/book-your-stay/
2026-01-05,V002,S002,Direct,Desktop,/book-your-stay,book_button_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-01-07,V003,S003,Instagram,Mobile,/home,page_view,https://www.shortoffmountainretreats.com/
2026-01-07,V003,S003,Instagram,Mobile,/home,airbnb_review_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-01-11,V004,S004,Facebook,Mobile,/gallery,page_view,https://www.shortoffmountainretreats.com/gallery/
2026-01-11,V004,S004,Facebook,Mobile,/gallery,gallery_view,https://www.shortoffmountainretreats.com/gallery/
2026-01-14,V005,S005,Google Organic,Desktop,/linville-gorge,page_view,https://www.shortoffmountainretreats.com/
2026-01-14,V005,S005,Google Organic,Desktop,/linville-gorge,availability_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-01-14,V005,S005,Google Organic,Desktop,/linville-gorge,book_button_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-01-18,V006,S006,Referral,Desktop,/home,page_view,https://www.shortoffmountainretreats.com/
2026-01-18,V006,S006,Referral,Desktop,/home,contact_click,https://www.shortoffmountainretreats.com/contact/
2026-01-21,V007,S007,Google Organic,Mobile,/book-your-stay,page_view,https://www.shortoffmountainretreats.com/book-your-stay/
2026-01-21,V007,S007,Google Organic,Mobile,/book-your-stay,airbnb_review_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-01-25,V008,S008,Direct,Mobile,/home,page_view,https://www.shortoffmountainretreats.com/
2026-01-25,V008,S008,Direct,Mobile,/home,availability_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-02-02,V009,S009,Google Organic,Desktop,/home,page_view,https://www.shortoffmountainretreats.com/
2026-02-02,V009,S009,Google Organic,Desktop,/home,book_button_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-02-04,V010,S010,Instagram,Mobile,/gallery,page_view,https://www.shortoffmountainretreats.com/gallery/
2026-02-04,V010,S010,Instagram,Mobile,/gallery,gallery_view,https://www.shortoffmountainretreats.com/gallery/
2026-02-06,V011,S011,Google Ads,Mobile,/book-your-stay,page_view,https://www.shortoffmountainretreats.com/book-your-stay/
2026-02-06,V011,S011,Google Ads,Mobile,/book-your-stay,availability_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-02-06,V011,S011,Google Ads,Mobile,/book-your-stay,book_button_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-02-10,V012,S012,Facebook,Desktop,/home,page_view,https://www.shortoffmountainretreats.com/
2026-02-10,V012,S012,Facebook,Desktop,/home,airbnb_review_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-02-12,V013,S013,Direct,Desktop,/book-your-stay,page_view,https://www.shortoffmountainretreats.com/book-your-stay/
2026-02-12,V013,S013,Direct,Desktop,/book-your-stay,book_button_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-02-15,V014,S014,Google Organic,Mobile,/things-to-do,page_view,https://www.shortoffmountainretreats.com/
2026-02-15,V014,S014,Google Organic,Mobile,/things-to-do,gallery_view,https://www.shortoffmountainretreats.com/gallery/
2026-02-15,V014,S014,Google Organic,Mobile,/things-to-do,availability_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-02-21,V015,S015,Airbnb Referral,Mobile,/book-your-stay,page_view,https://www.shortoffmountainretreats.com/book-your-stay/
2026-02-21,V015,S015,Airbnb Referral,Mobile,/book-your-stay,contact_click,https://www.shortoffmountainretreats.com/contact/
2026-02-25,V016,S016,Google Organic,Desktop,/home,page_view,https://www.shortoffmountainretreats.com/
2026-02-25,V016,S016,Google Organic,Desktop,/home,availability_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-03-01,V017,S017,Direct,Mobile,/home,page_view,https://www.shortoffmountainretreats.com/
2026-03-01,V017,S017,Direct,Mobile,/home,book_button_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-03-03,V018,S018,Instagram,Mobile,/gallery,page_view,https://www.shortoffmountainretreats.com/gallery/
2026-03-03,V018,S018,Instagram,Mobile,/gallery,airbnb_review_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-03-06,V019,S019,Google Organic,Desktop,/linville-gorge,page_view,https://www.shortoffmountainretreats.com/
2026-03-06,V019,S019,Google Organic,Desktop,/linville-gorge,availability_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-03-06,V019,S019,Google Organic,Desktop,/linville-gorge,book_button_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-03-09,V020,S020,Facebook,Mobile,/home,page_view,https://www.shortoffmountainretreats.com/
2026-03-09,V020,S020,Facebook,Mobile,/home,gallery_view,https://www.shortoffmountainretreats.com/gallery/
2026-03-12,V021,S021,Google Ads,Desktop,/book-your-stay,page_view,https://www.shortoffmountainretreats.com/book-your-stay/
2026-03-12,V021,S021,Google Ads,Desktop,/book-your-stay,book_button_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-03-14,V022,S022,Referral,Mobile,/home,page_view,https://www.shortoffmountainretreats.com/
2026-03-14,V022,S022,Referral,Mobile,/home,contact_click,https://www.shortoffmountainretreats.com/contact/
2026-03-18,V023,S023,Google Organic,Mobile,/things-to-do,page_view,https://www.shortoffmountainretreats.com/
2026-03-18,V023,S023,Google Organic,Mobile,/things-to-do,availability_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-03-22,V024,S024,Direct,Desktop,/book-your-stay,page_view,https://www.shortoffmountainretreats.com/book-your-stay/
2026-03-22,V024,S024,Direct,Desktop,/book-your-stay,book_button_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-03-27,V025,S025,Instagram,Mobile,/home,page_view,https://www.shortoffmountainretreats.com/
2026-03-27,V025,S025,Instagram,Mobile,/home,gallery_view,https://www.shortoffmountainretreats.com/gallery/
2026-04-01,V026,S026,Google Organic,Desktop,/home,page_view,https://www.shortoffmountainretreats.com/
2026-04-01,V026,S026,Google Organic,Desktop,/home,availability_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-04-01,V026,S026,Google Organic,Desktop,/home,book_button_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-04-05,V027,S027,Facebook,Mobile,/gallery,page_view,https://www.shortoffmountainretreats.com/gallery/
2026-04-05,V027,S027,Facebook,Mobile,/gallery,airbnb_review_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-04-08,V028,S028,Direct,Mobile,/book-your-stay,page_view,https://www.shortoffmountainretreats.com/book-your-stay/
2026-04-08,V028,S028,Direct,Mobile,/book-your-stay,availability_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-04-11,V029,S029,Google Ads,Mobile,/home,page_view,https://www.shortoffmountainretreats.com/
2026-04-11,V029,S029,Google Ads,Mobile,/home,book_button_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-04-16,V030,S030,Google Organic,Desktop,/things-to-do,page_view,https://www.shortoffmountainretreats.com/
2026-04-16,V030,S030,Google Organic,Desktop,/things-to-do,gallery_view,https://www.shortoffmountainretreats.com/gallery/
2026-04-16,V030,S030,Google Organic,Desktop,/things-to-do,availability_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-04-21,V031,S031,Airbnb Referral,Mobile,/book-your-stay,page_view,https://www.shortoffmountainretreats.com/book-your-stay/
2026-04-21,V031,S031,Airbnb Referral,Mobile,/book-your-stay,airbnb_review_click,https://www.shortoffmountainretreats.com/book-your-stay/
2026-04-25,V032,S032,Referral,Desktop,/home,page_view,https://www.shortoffmountainretreats.com/
2026-04-25,V032,S032,Referral,Desktop,/home,book_button_click,https://www.shortoffmountainretreats.com/book-your-stay/
EOF

cat > data_sample/sample_lodgify_bookings.csv <<'EOF'
booking_id,booking_date,check_in,check_out,nights,guest_count,pet_count,gross_revenue,cleaning_fee,pet_fee,channel,status
LDG_001,2026-01-04,2026-01-17,2026-01-20,3,6,1,1840,350,100,Lodgify Direct,completed
LDG_002,2026-01-10,2026-02-07,2026-02-10,3,10,0,2195,350,0,Lodgify Direct,completed
LDG_003,2026-01-22,2026-03-05,2026-03-09,4,8,2,2920,350,200,Lodgify Direct,completed
LDG_004,2026-02-02,2026-02-20,2026-02-23,3,4,0,1715,350,0,Lodgify Direct,completed
LDG_005,2026-02-16,2026-04-03,2026-04-07,4,12,1,3380,350,100,Lodgify Direct,completed
LDG_006,2026-02-25,2026-03-20,2026-03-24,4,7,0,2660,350,0,Lodgify Direct,completed
LDG_007,2026-03-03,2026-04-17,2026-04-21,4,9,2,3490,350,200,Lodgify Direct,completed
LDG_008,2026-03-11,2026-05-01,2026-05-05,4,11,1,3895,350,100,Lodgify Direct,confirmed
LDG_009,2026-03-19,2026-05-15,2026-05-18,3,6,0,2475,350,0,Lodgify Direct,confirmed
LDG_010,2026-03-28,2026-06-05,2026-06-09,4,10,1,4210,350,100,Lodgify Direct,confirmed
LDG_011,2026-04-02,2026-06-19,2026-06-23,4,12,2,4680,350,200,Lodgify Direct,confirmed
LDG_012,2026-04-12,2026-07-10,2026-07-14,4,8,0,4525,350,0,Lodgify Direct,confirmed
LDG_013,2026-04-18,2026-07-24,2026-07-28,4,9,1,4790,350,100,Lodgify Direct,confirmed
LDG_014,2026-04-27,2026-08-07,2026-08-11,4,12,1,4925,350,100,Lodgify Direct,confirmed
LDG_015,2026-05-03,2026-08-21,2026-08-25,4,7,0,4380,350,0,Lodgify Direct,confirmed
LDG_016,2026-05-09,2026-09-04,2026-09-08,4,10,2,4560,350,200,Lodgify Direct,confirmed
LDG_017,2026-05-14,2026-09-18,2026-09-21,3,5,1,2640,350,100,Lodgify Direct,confirmed
LDG_018,2026-05-20,2026-10-09,2026-10-13,4,8,0,3860,350,0,Lodgify Direct,confirmed
LDG_019,2026-05-24,2026-10-23,2026-10-26,3,6,0,2795,350,0,Lodgify Direct,confirmed
LDG_020,2026-05-27,2026-11-20,2026-11-24,4,11,1,4125,350,100,Lodgify Direct,confirmed
EOF

cat > data_sample/sample_airbnb_bookings.csv <<'EOF'
booking_id,booking_date,check_in,check_out,nights,guest_count,gross_revenue,airbnb_fee_estimate,net_revenue,status
ABNB_001,2026-01-02,2026-01-10,2026-01-13,3,5,1765,53,1712,completed
ABNB_002,2026-01-08,2026-01-24,2026-01-27,3,8,2130,64,2066,completed
ABNB_003,2026-01-19,2026-02-14,2026-02-17,3,6,2015,60,1955,completed
ABNB_004,2026-01-28,2026-02-28,2026-03-03,3,10,2440,73,2367,completed
ABNB_005,2026-02-06,2026-03-13,2026-03-16,3,7,2385,72,2313,completed
ABNB_006,2026-02-14,2026-03-27,2026-03-31,4,9,3160,95,3065,completed
ABNB_007,2026-02-27,2026-04-10,2026-04-13,3,4,2245,67,2178,completed
ABNB_008,2026-03-05,2026-04-24,2026-04-28,4,11,3720,112,3608,completed
ABNB_009,2026-03-17,2026-05-08,2026-05-11,3,8,2865,86,2779,confirmed
ABNB_010,2026-03-25,2026-05-22,2026-05-26,4,10,3985,120,3865,confirmed
ABNB_011,2026-04-01,2026-06-12,2026-06-15,3,6,3210,96,3114,confirmed
ABNB_012,2026-04-09,2026-06-26,2026-06-30,4,12,4520,136,4384,confirmed
ABNB_013,2026-04-15,2026-07-17,2026-07-20,3,7,3380,101,3279,confirmed
ABNB_014,2026-04-22,2026-07-31,2026-08-03,3,9,3615,108,3507,confirmed
ABNB_015,2026-04-30,2026-08-14,2026-08-18,4,8,4240,127,4113,confirmed
ABNB_016,2026-05-06,2026-08-28,2026-08-31,3,5,3095,93,3002,confirmed
ABNB_017,2026-05-11,2026-09-11,2026-09-14,3,10,3425,103,3322,confirmed
ABNB_018,2026-05-16,2026-09-25,2026-09-29,4,11,4110,123,3987,confirmed
ABNB_019,2026-05-22,2026-10-16,2026-10-19,3,6,2975,89,2886,confirmed
ABNB_020,2026-05-26,2026-11-06,2026-11-09,3,9,3190,96,3094,confirmed
EOF

echo "Created sample CSV files in data_sample/:"
echo "- data_sample/sample_website_events.csv"
echo "- data_sample/sample_lodgify_bookings.csv"
echo "- data_sample/sample_airbnb_bookings.csv"
