-- Create Regions Table
CREATE TABLE Regions (
    region_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- Create Users Table
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,  -- Consider hashing in a real-world scenario
    preferred_region_id INT,
    FOREIGN KEY (preferred_region_id) REFERENCES Regions(region_id)
);

-- Create Categories Table
CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- Create Posts Table
CREATE TABLE Posts (
    post_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    text TEXT NOT NULL,
    user_id INT,
    location VARCHAR(200),
    region_id INT,
    category_id INT,
    post_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (region_id) REFERENCES Regions(region_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
