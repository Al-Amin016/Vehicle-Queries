CREATE TABLE users (
  user_id serial PRIMARY KEY,
  name varchar(50) NOT NULL,
  email varchar(50) UNIQUE,
  password varchar(100) NOT NULL,
  role varchar(10) NOT NULL
)


CREATE TABLE Vehicles (
  vehicle_id serial PRIMARY KEY,
  vehicle_name varchar(50) NOT NULL,
  type varchar(15) NOT NULL,
  model varchar(50) NOT NULL,
  registration_number varchar(100) UNIQUE NOT NULL,
  rental_price int NOT NULL,
  status varchar(20) NOT NULL
)


CREATE TABLE Bookings (
  booking_id serial PRIMARY KEY,
  user_id int REFERENCES users (user_id),
  vehicle_id int REFERENCES Vehicles (vehicle_id),
  start_date date,
  end_date date,
  bookings_status varchar(20) NOT NULL,
  total_cost int
)


-- Queries 1

SELECT
  booking_id,
  name AS customer_name,
  vehicle_name,
  start_date,
  end_date,
  bookings_status AS status
FROM
  bookings
  INNER JOIN users ON bookings.user_id = users.user_id
  INNER JOIN Vehicles ON bookings.vehicle_id = Vehicles.vehicle_id;


-- Queries 2

SELECT
  *
FROM
  vehicles
WHERE
  status != 'booked';


-- Queries 3

SELECT
  *
FROM
  vehicles
WHERE
  type = 'Car'
  AND status = 'available'

-- Queries 4

SELECT
  vehicle_name,
  count(*) AS total_bookings
FROM
  Bookings
  INNER JOIN Vehicles ON Bookings.vehicle_id = Vehicles.vehicle_id
GROUP BY
  vehicle_name
HAVING
  count(*) > 2;