USE lego_organizer;

-- Insert sample users
INSERT INTO Users (username, email, password) 
VALUES ('collector1', 'collector1@example.com', 'hashedpassword123'),
       ('collector2', 'collector2@example.com', 'hashedpassword456');

-- Insert sample LEGO sets
INSERT INTO LEGO_Sets (name, year, theme, image_url, external_link)
VALUES ('Millennium Falcon', 2019, 'Star Wars', 'https://example.com/millennium_falcon.jpg', 'https://lego.com/millennium_falcon'),
       ('Hogwarts Castle', 2021, 'Harry Potter', 'https://example.com/hogwarts_castle.jpg', 'https://lego.com/hogwarts_castle');

-- Insert sample part categories
INSERT INTO Categories (category_name)
VALUES ('Bricks'), ('Plates'), ('Minifigures');

-- Insert sample parts
INSERT INTO Parts (name, category_id)
VALUES ('2x4 Brick', 1),
       ('1x6 Plate', 2),
       ('Harry Potter Minifigure', 3);

-- Insert sample colors
INSERT INTO Colors (color_name)
VALUES ('Red'), ('Blue'), ('Yellow');

-- Insert parts associated with LEGO sets
INSERT INTO Set_Parts (set_id, part_id, color_id, quantity)
VALUES (1, 1, 1, 150),  -- 150 Red 2x4 Bricks in Millennium Falcon
       (2, 2, 2, 200),  -- 200 Blue 1x6 Plates in Hogwarts Castle
       (2, 3, 3, 1);   -- 1 Harry Potter Minifigure in Hogwarts Castle

-- Insert sample user inventories
INSERT INTO User_Inventories (user_id, set_id, quantity)
VALUES (1, 1, 1),  -- collector1 owns 1 Millennium Falcon
       (2, 2, 1);  -- collector2 owns 1 Hogwarts Castle

-- Optional: Insert sales listings for sets
INSERT INTO Set_Sales (set_id, user_id, sale_price, sale_link)
VALUES (1, 1, 499.99, 'https://ebay.com/millennium_falcon_sale'),
       (2, 2, 299.99, 'https://ebay.com/hogwarts_castle_sale');
