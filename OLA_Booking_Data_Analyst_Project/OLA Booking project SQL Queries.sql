USE ola;

-- 1. Retrieve all successful bookings:

DROP VIEW IF EXISTS Successful_Bookings;
CREATE VIEW Successful_Bookings AS 
SELECT * FROM bookings
WHERE Booking_Status = 'Success';

SELECT * FROM Successful_Bookings;

-- 2. Find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_for_each_vehicle as
Select Vehicle_Type ,AVG(Ride_Distance) as 'avg_distance' from bookings
group by Vehicle_Type;

SELECT * FROM ride_distance_for_each_vehicle;

-- 3. Get the total number of cancelled rides by customers:
CREATE VIEW total_cancelled_rides_by_customers AS 
select count(*) from bookings
where  Booking_Status = 'Çanceled by Customer';

SELECT * FROM total_cancelled_rides_by_customers;

-- 4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW top_5_Customer AS
SELECT Customer_ID, count(Booking_ID) as "total_ride"FROM bookings
group by Customer_ID
order by total_ride DESC limit 5;

select * from top_5_Customer;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW Rides_Canceled_by_Driver_p_C_Issues as
SELECT COUNT(*) from bookings
where Canceled_Rides_by_Driver = "Personal & Car related Issue";

select * from Rides_Canceled_by_Driver_p_C_Issues ;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW max_min_driver_rating as
SELECT Vehicle_Type,max(Driver_Ratings) as "max_rating",min(Driver_Ratings) as "min_rating" FROM bookings
where Vehicle_Type = "Prime Sedan";

SELECT * FROM max_min_driver_rating;

-- 7. Retrieve all rides where payment was made using UPI:
CREATE VIEW UPI_payment as
SELECT *FROM  bookings
where Payment_Method = "UPI";

select * from UPI_payment ;

-- 8. Find the average customer rating per vehicle type:
CREATE VIEW AVG_Cus_Rating as
SELECT Vehicle_Type ,round(AVG(Customer_Rating),2) as avg_customer_rating from bookings 
group by Vehicle_Type;

select * from AVG_Cus_Rating;

-- 9. Calculate the total booking value of rides completed successfully:
CREATE VIEW  total_booking_ride_values as
select SUM(Booking_Value) as total_booking_ride_values from bookings
where Booking_Status = "Success";

SELECT * from total_booking_ride_values;

-- 10. List all incomplete rides along with the reason:
CREATE VIEW Incomplete_Rides_Reason AS 
select Booking_ID,Incomplete_Rides_Reason from bookings
where Incomplete_Rides = "Yes";

SELECT * FROM Incomplete_Rides_Reason;
-- 1. Retrieve all successful bookings:
SELECT * FROM Successful_Bookings;

-- 2. Find the average ride distance for each vehicle type:
SELECT * FROM ride_distance_for_each_vehicle;

-- 3. Get the total number of cancelled rides by customers:
SELECT * FROM total_cancelled_rides_by_customers;

-- 4. List the top 5 customers who booked the highest number of rides:
select * from top_5_Customer;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from Rides_Canceled_by_Driver_p_C_Issues ;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT * FROM max_min_driver_rating;

-- 7. Retrieve all rides where payment was made using UPI:
select * from UPI_payment ;

-- 8. Find the average customer rating per vehicle type:
select * from AVG_Cus_Rating;

-- 9. Calculate the total booking value of rides completed successfully:
SELECT * from total_booking_ride_values;

-- 10. List all incomplete rides along with the reason:
SELECT * FROM Incomplete_Rides_Reason;
