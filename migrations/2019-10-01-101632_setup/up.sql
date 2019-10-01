-- Your SQL goes here

CREATE TABLE players
(
  id INTEGER PRIMARY KEY NOT NULL,
  first_name VARCHAR NOT NULL,
  surname VARCHAR NOT NULL,
  nickname VARCHAR NOT NULL,
  rating INTEGER NOT NULL DEFAULT 1000
);

CREATE TABLE teams
(
  id INTEGER PRIMARY KEY NOT NULL,
  player_1 INTEGER NOT NULL REFERENCES players(id),
  player_2 INTEGER NOT NULL REFERENCES players(id),
  rating INTEGER NOT NULL DEFAULT 1000,

  CHECK (player_1 < player_2)
);

CREATE TABLE matches
(
  id INTEGER PRIMARY KEY NOT NULL,
  team_1 INTEGER NOT NULL REFERENCES teams(id),
  team_2 INTEGER NOT NULL REFERENCES teams(id),
  timestamp DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,

  CHECK (team_1 != team_2)
);

CREATE TABLE games
(
  id INTEGER PRIMARY KEY NOT NULL,
  match_id INTEGER NOT NULL REFERENCES matches(id),
  score_team_1 INTEGER NOT NULL,
  score_team_2 INTEGER NOT NULL,
  timestamp DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,

  CHECK (score_team_1 != score_team_2)
);

INSERT INTO
  players
  (first_name, surname, nickname, rating)
VALUES
  ('Marvin', 'Altemeier', 'Marv', 1200),
  ('Patrick', 'Schaffrath', 'PatMan', 1000),
  ('Joshua', 'Grimm', 'Joshi', 1000),
  ('Robert', 'Mueller', 'Robert', 800);

INSERT INTO
  teams
  (player_1, player_2)
VALUES
  (1, 2),
  (3, 4);

INSERT INTO matches
  (team_1, team_2)
VALUES
  (1, 2);
