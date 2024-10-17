
-- 1. Drop the tables if they already exist to avoid duplicates
DROP TABLE IF EXISTS Collections;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Public_Queries;
DROP TABLE IF EXISTS LEGO_Sets;
DROP TABLE IF EXISTS Collectors;

-- 2. Create the Collectors table
CREATE TABLE IF NOT EXISTS Collectors (
    collector_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    phone TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Create the LEGO Sets table
CREATE TABLE IF NOT EXISTS LEGO_Sets (
    set_id INTEGER PRIMARY KEY AUTOINCREMENT,
    set_name TEXT NOT NULL,
    theme TEXT,
    description TEXT,
    image_url TEXT,
    release_year INTEGER,
    lego_url TEXT
);

-- 4. Create the Collections table (relationship between collectors and sets)
CREATE TABLE IF NOT EXISTS Collections (
    collection_id INTEGER PRIMARY KEY AUTOINCREMENT,
    collector_id INTEGER NOT NULL,
    set_id INTEGER NOT NULL,
    date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (collector_id) REFERENCES Collectors(collector_id),
    FOREIGN KEY (set_id) REFERENCES LEGO_Sets(set_id)
);

-- 5. Optional: Create the Public Queries table
CREATE TABLE IF NOT EXISTS Public_Queries (
    query_id INTEGER PRIMARY KEY AUTOINCREMENT,
    collector_id INTEGER NOT NULL,
    public_email TEXT NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (collector_id) REFERENCES Collectors(collector_id)
);

-- 6. Optional: Create the Sales table
CREATE TABLE IF NOT EXISTS Sales (
    sale_id INTEGER PRIMARY KEY AUTOINCREMENT,
    set_id INTEGER NOT NULL,
    collector_id INTEGER NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    sale_url TEXT,
    FOREIGN KEY (set_id) REFERENCES LEGO_Sets(set_id),
    FOREIGN KEY (collector_id) REFERENCES Collectors(collector_id)
);

-- 7. Insert sample data into Collectors table with INSERT OR IGNORE to avoid duplicates
INSERT OR IGNORE INTO Collectors (name, email, password_hash, phone)
VALUES 
('John Doe', 'johndoe@example.com', 'hashedpassword123', '123-456-7890'),
('Jane Smith', 'janesmith@example.com', 'hashedpassword456', '987-654-3210');

-- 8. Insert sample data into LEGO_Sets table
INSERT OR IGNORE INTO LEGO_Sets (set_name, theme, description, image_url, release_year, lego_url)
VALUES 
('Millennium Falcon', 'Star Wars', 'Detailed model of the Millennium Falcon', 'https://example.com/mf.png', 2021, 'https://lego.com/mf'),
('Hogwarts Castle', 'Harry Potter', 'Replica of Hogwarts Castle from Harry Potter', 'https://example.com/hc.png', 2019, 'https://lego.com/hc'),
('Ninjago City Gardens', 'Ninjago', 'Large modular build of Ninjago City', 'https://example.com/ncg.png', 2020, 'https://lego.com/ncg');

-- 9. Insert sample data into Collections table
INSERT OR IGNORE INTO Collections (collector_id, set_id)
VALUES 
(1, 1), -- John Doe owns Millennium Falcon
(1, 3), -- John Doe owns Ninjago City Gardens
(2, 2); -- Jane Smith owns Hogwarts Castle

-- 10. Optional: Insert sample data into Public_Queries table
INSERT OR IGNORE INTO Public_Queries (collector_id, public_email, message)
VALUES 
(1, 'publicuser@example.com', 'Hello, I have a question about your Millennium Falcon set.');

-- 11. Optional: Insert sample data into Sales table
INSERT OR IGNORE INTO Sales (set_id, collector_id, price, sale_url)
VALUES 
(1, 1, 299.99, 'https://ebay.com/sale/millennium_falcon'),
(2, 2, 499.99, 'https://ebay.com/sale/hogwarts_castle');
