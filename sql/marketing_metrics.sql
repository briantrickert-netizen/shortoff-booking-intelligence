-- Shortoff Booking Intelligence Dashboard
-- Marketing and booking performance queries


-- 1. Website events by traffic source
SELECT
    traffic_source,
    COUNT(*) AS total_events
FROM website_events
GROUP BY traffic_source
ORDER BY total_events DESC;


-- 2. Booking-intent events by traffic source
SELECT
    traffic_source,
    event_name,
    COUNT(*) AS intent_event_count
FROM website_events
WHERE event_name IN (
    'book_button_click',
    'availability_click',
    'airbnb_review_click',
    'contact_click'
)
GROUP BY traffic_source, event_name
ORDER BY traffic_source, intent_event_count DESC;


-- 3. Total booking intent by traffic source
SELECT
    traffic_source,
    COUNT(*) AS total_intent_events
FROM website_events
WHERE event_name IN (
    'book_button_click',
    'availability_click',
    'airbnb_review_click',
    'contact_click'
)
GROUP BY traffic_source
ORDER BY total_intent_events DESC;


-- 4. Airbnb review clicks by traffic source
SELECT
    traffic_source,
    COUNT(*) AS airbnb_review_clicks
FROM website_events
WHERE event_name = 'airbnb_review_click'
GROUP BY traffic_source
ORDER BY airbnb_review_clicks DESC;


-- 5. Revenue by booking platform
SELECT
    platform,
    COUNT(*) AS booking_count,
    ROUND(SUM(gross_revenue), 2) AS total_gross_revenue,
    ROUND(SUM(net_revenue), 2) AS total_net_revenue,
    ROUND(AVG(gross_revenue), 2) AS avg_booking_value,
    ROUND(AVG(revenue_per_night), 2) AS avg_revenue_per_night
FROM all_bookings
GROUP BY platform
ORDER BY total_net_revenue DESC;


-- 6. Monthly net revenue by platform
SELECT
    check_in_month,
    platform,
    ROUND(SUM(net_revenue), 2) AS monthly_net_revenue,
    COUNT(*) AS booking_count
FROM all_bookings
GROUP BY check_in_month, platform
ORDER BY check_in_month, platform;


-- 7. Average stay length by platform
SELECT
    platform,
    ROUND(AVG(nights), 2) AS avg_nights,
    ROUND(AVG(guest_count), 2) AS avg_guest_count
FROM all_bookings
GROUP BY platform
ORDER BY avg_nights DESC;


-- 8. Estimated Airbnb fee impact
SELECT
    ROUND(SUM(gross_revenue), 2) AS airbnb_gross_revenue,
    ROUND(SUM(net_revenue), 2) AS airbnb_net_revenue,
    ROUND(SUM(gross_revenue - net_revenue), 2) AS estimated_airbnb_fee_impact
FROM all_bookings
WHERE platform = 'Airbnb';


-- 9. Direct booking retained revenue
SELECT
    ROUND(SUM(gross_revenue), 2) AS direct_gross_revenue,
    ROUND(SUM(net_revenue), 2) AS direct_net_revenue
FROM all_bookings
WHERE platform = 'Lodgify Direct';


-- 10. Completed vs confirmed bookings by platform
SELECT
    platform,
    status,
    COUNT(*) AS booking_count,
    ROUND(SUM(net_revenue), 2) AS net_revenue
FROM all_bookings
GROUP BY platform, status
ORDER BY platform, status;