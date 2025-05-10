-- Create the database
CREATE DATABASE IF NOT EXISTS `hotel-booking`;
USE `hotel-booking`;

-- Create hotels table
CREATE TABLE IF NOT EXISTS `hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `location` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create rooms table
CREATE TABLE IF NOT EXISTS `rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `price` varchar(50) NOT NULL,
  `num_persons` int(11) NOT NULL,
  `num_beds` int(11) NOT NULL,
  `size` varchar(50) NOT NULL,
  `view` varchar(100) NOT NULL,
  `hotel_name` varchar(200) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create admins table
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mypassword` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create users table
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mypassword` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Create bookings table
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_in` varchar(100) NOT NULL,
  `check_out` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `hotel_name` varchar(200) NOT NULL,
  `room_name` varchar(200) NOT NULL,
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Pending',
  `payment` varchar(50) NOT NULL DEFAULT 'Pay Later',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert sample data for hotels
INSERT INTO `hotels` (`name`, `description`, `location`, `image`, `status`) VALUES
('Luxury Hotel', 'A beautiful luxury hotel with amazing views', 'New York', 'image_4.jpg', 1),
('Beach Resort', 'Relax by the beach in our comfortable resort', 'Miami', 'services-1.jpg', 1),
('Mountain Retreat', 'Escape to the mountains in our cozy retreat', 'Denver', 'image_2.jpg', 1);

-- Insert sample data for rooms
INSERT INTO `rooms` (`name`, `price`, `num_persons`, `num_beds`, `size`, `view`, `hotel_name`, `hotel_id`, `image`, `status`) VALUES
('Deluxe Room', '120', 2, 1, '30', 'City View', 'Luxury Hotel', 1, 'room-1.jpg', 1),
('Family Suite', '200', 4, 2, '50', 'Ocean View', 'Beach Resort', 2, 'room-2.jpg', 1),
('Executive Suite', '250', 2, 1, '40', 'Mountain View', 'Luxury Hotel', 1, 'room-3.jpg', 1),
('Presidential Suite', '350', 4, 2, '70', 'Panoramic View', 'Beach Resort', 2, 'room-4.jpg', 1),
('Mountain View Room', '180', 2, 1, '35', 'Mountain View', 'Mountain Retreat', 3, 'room-5.jpg', 1),
('Luxury Cabin', '280', 4, 2, '60', 'Forest View', 'Mountain Retreat', 3, 'room-6.jpg', 1);

-- First create the table, then insert admin
DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mypassword` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert admin account
INSERT INTO `admins` (`adminname`, `email`, `mypassword`) VALUES
('admin', 'admin@example.com', '$2y$10$8WxmVHA6JFI.BP9v/Qj9UOHYwH.AXGMWBQxA8aKmZtEw9Ld5AqTji'); -- password: admin123