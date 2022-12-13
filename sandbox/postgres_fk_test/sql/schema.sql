CREATE TABLE IF NOT EXISTS teams (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS users (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    team_id BIGINT,
    CONSTRAINT users_team_id_fk FOREIGN KEY (team_id) REFERENCES teams (id)
);
CREATE INDEX users_team_id_idx ON users (team_id);
