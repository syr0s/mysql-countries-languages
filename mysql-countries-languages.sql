/**
* mysql-countries-languages.sql
* This sql file will populate all countries of the world as well
* as all languages spoken to your database.
* The whole project is done with. multiple languages
* to match your needs. 
*
* Feel free to contribute!
*
*
* Author: syr0s <daniel.noetzel@gmail.com>
* Maintainer: syr0s <daniel.noetzel@gmail.com>
* Version: 0.1.0
* License: GPL3
*
**/

/**
* TABLE OF CONTENT
* table creation
*    languages table
*    continents table
* insert values
*    continents
**/

/* table creation */
/* create the languages table */
CREATE TABLE IF NOT EXISTS languages(
    language_id SMALLINT NOT NULL UNIQUE UNSIGNED COMMENT 'Primary key of the table. No auto increment, to verify the integrity',
    language_name LONGTEXT NOT NULL COMMENT 'json array: { "ISO 639-1 code":"language name" }',
    language_codes LONGTEXT NOT NULL COMMENT 'json array, with keys: 639-1, 639-2-T, 639-2-B, 639-3',
    speakers INT UNSIGNED COMMENT 'total of people which speak the language',
    PRIMARY KEY ( language_id )
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT="table stores all languages spoken on the world"

/* create the continents table */
CREATE TABLE IF NOT EXISTS continents (
    continent_id SMALLINT NOT NULL UNIQUE UNSIGNED COMMENT 'Primary key of the table. No auto increment, to verify the integrity',
    continent_name LONGTEXT NOT NULL COMMENT 'json array: { "ISO 639-1 code":"language name" }',
    residents INT NOT NULL UNSIGNED COMMENT 'residents living on this continent',
    area INT NOT NULL UNSIGNED COMMENT 'the area in square kilometers',
    PRIMARY KEY ( continent_id )
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8
COMMENT="table stores all continents with additional information";

/* insert values */
/* continents */
/* source of the values: german Wikipedia */
INSERT IGNORE INTO continents (
    continent_id, continent_name, residents, area
) VALUES (
    1,
    '{
        "en":"Africa",
        "es":"África",
        "pt":"África",
        "de":"Afrika",
        "ru":"Африка",
        "fr":"Afrique"
    }',
    1300000000,
    30221532
),
(
    2,
    '{
        "en":"Asia",
        "es":"Asia",
        "pt":"Ásia",
        "de":"Asien",
        "ru":"Азия",
        "fr":"Asie"
    }',
    4560667108,
    44579000
),
(
    3,
    '{
        "en":"Europe",
        "es":"Europa",
        "pt":"Europa",
        "de":"Europa",
        "ru":"Европа",
        "fr":"L\'Europe"
    }',
    746000000,
    10523000
),
(
    4,
    '{
        "en":"North America",
        "es":"Norteamérica",
        "pt":"América do Norte",
        "de":"Nordamerika",
        "ru":"Северная Америка",
        "fr":"Amérique du Nord"
    }',
    528750000,
    24930000
),
(
    5,
    '{
        "en":"South America",
        "es":"Sudamerica",
        "pt":"América do Sul",
        "de":"Südamerika",
        "ru":"Южная Америка",
        "fr":"Amérique du Sud"
    }',
    418000000,
    17843000
),
(
    6,
    '{
        "en":"Oceania",
        "es":"Oceanía",
        "pt":"Oceânia",
        "de":"Ozeanien",
        "ru":"Океания",
        "fr":"Océanie"
    }',
    8500000,
    397000
),
(
    7,
    '{
        "en":"Antarctica",
        "es":"Antártida",
        "pt":"Antártica",
        "de":"Antarktika",
        "ru":"Антарктида",
        "fr":"Antarctique"
    }',
    1106,
    14000000
);
