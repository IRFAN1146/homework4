-- Create LEGO Organizer Database
CREATE DATABASE lego_organizer;

USE lego_organizer;

-- Table to store user (collector) data
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Table to store LEGO sets
CREATE TABLE LEGO_Sets (
    set_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    year INT NOT NULL,
    theme VARCHAR(100),
    image_url VARCHAR(255),  -- URL for the set image
    external_link VARCHAR(255)  -- Link to LEGO or other external sources
);

-- Table for parts associated with LEGO sets
CREATE TABLE Parts (
    part_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Table for part categories
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Table for colors associated with parts
CREATE TABLE Colors (
    color_id INT AUTO_INCREMENT PRIMARY KEY,
    color_name VARCHAR(100) NOT NULL
);

-- Many-to-many relationship between LEGO sets and parts
CREATE TABLE Set_Parts (
    set_id INT,
    part_id INT,
    color_id INT,
    quantity INT,
    PRIMARY KEY (set_id, part_id, color_id),
    FOREIGN KEY (set_id) REFERENCES LEGO_Sets(set_id),
    FOREIGN KEY (part_id) REFERENCES Parts(part_id),
    FOREIGN KEY (color_id) REFERENCES Colors(color_id)
);

-- Table to track inventories for each user (collector)
CREATE TABLE User_Inventories (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    set_id INT,
    quantity INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (set_id) REFERENCES LEGO_Sets(set_id)
);

-- Optional: Table to track sales or listings for sale
CREATE TABLE Set_Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    set_id INT,
    user_id INT,
    sale_price DECIMAL(10, 2),
    sale_link VARCHAR(255),  -- Link to eBay or other sale sites
    FOREIGN KEY (set_id) REFERENCES LEGO_Sets(set_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
