CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  first TEXT NOT NULL,
  last TEXT NOT NULL,
  dob DATE,
  relationship TEXT,
  friends INTEGER DEFAULT 0,
  city TEXT
);