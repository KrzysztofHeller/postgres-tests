CREATE TABLE testowa (
    id SERIAL PRIMARY KEY,
    nazwa VARCHAR(255) NOT NULL,
    opis TEXT,
    utworzono TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO testowa (nazwa, opis) VALUES
    ('rekord 1', 'Pierwszy rekord testowy'),
    ('rekord 2', 'Drugi rekord testowy'),
    ('rekord 3', 'Trzeci rekord testowy');
