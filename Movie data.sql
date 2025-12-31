sqlite> .table
directors  movies   
sqlite> .schema
CREATE TABLE `movies` (
`id` INTEGER PRIMARY KEY AUTOINCREMENT,
`original_title` VARCHAR,
`budget` INTEGER,
`popularity` INTEGER,
`release_date` TEXT,
`revenue` INTEGER,
`title` TEXT,
`vote_average` REAL,
`vote_count` INTEGER,
`overview` TEXT,
`tagline` TEXT, uid INTEGER, director_id INTEGER NOT NULL DEFAULT 0);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE `directors` (
`name` TEXT,
`id` INTEGER PRIMARY KEY AUTOINCREMENT,
`gender` INTEGER,
`uid` INTEGER,
`department` TEXT);
