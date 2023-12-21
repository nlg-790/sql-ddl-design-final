-- Create Teams Table
CREATE TABLE Teams (
    team_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    founding_year INT
);

-- Create Players Table
CREATE TABLE Players (
    player_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

-- Create Referees Table
CREATE TABLE Referees (
    referee_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Create Matches Table
CREATE TABLE Matches (
    match_id SERIAL PRIMARY KEY,
    home_team_id INT,
    away_team_id INT,
    match_date TIMESTAMP NOT NULL,
    season_id INT,
    referee_id INT,
    FOREIGN KEY (home_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (away_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (referee_id) REFERENCES Referees(referee_id)
);

-- Create Goals Table
CREATE TABLE Goals (
    goal_id SERIAL PRIMARY KEY,
    match_id INT,
    player_id INT,
    goal_time TIMESTAMP NOT NULL,
    FOREIGN KEY (match_id) REFERENCES Matches(match_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
);

-- Create Seasons Table
CREATE TABLE Seasons (
    season_id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);
