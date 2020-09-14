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

/* languages */
INSERT IGNORE INTO languages (
    language_id, language_name, language_codes, speakers
) VALUES (
    1,
    '{
        "en":"Abkhazian",
        "es":"Abjasio",
        "pt":"Abcásia",
        "de":"Abchasisch",
        "ru":"Абхазский",
        "fr":"Abkhaze"
    }',
    '{
        "639-1":"ab",
        "639-2-T":"abk",
        "639-2-B":"abk",
        "639-3":"abk"
    }',
    100000
),
(
    2,
    /* TODO: translation */
    '{
        "en":"Afar",
        "es":"Afar",
        "pt":"Afar",
        "de":"Afar"
        "ru":"Afar",
        "fr":"Afar"
    }',
     '{
        "639-1":"aa",
        "639-2-T":"aar",
        "639-2-B":"aar",
        "639-3":"aar"
    }',
    1973800
),
(
    3,
    '{
        "en":"Afrikaans",
        "es":"africaans",
        "pt":"afrikaans",
        de":"Afrikaans",
        "ru":"африкаанс",
        "fr":"afrikaans"
    }',
    '{
        "639-1":"af",
        "639-2-T":"afr",
        "639-2-B":"afr",
        "639-3":"afr"
    }',
    7200000
),
(
    4,
    '{
        "en":"Akan",
        "es":"Akan",
        "pt":"Akan",
        "de":"Akan",
        "ru":"Акан",
        "fr":"Akan"
    }',
    '{
        "639-1":"ak",
        "639-2-T":"aka",
        "639-2-B":"aka",
        "639-3":"aka + 2"
    }',
    11000000
),
(
    5,
    '{
        "en":"Albanian",
        "es":"albanés",
        "pt":"albanês",
        "de":"albanisch",
        "ru":"албанский",
        "fr":"albanais"
    }',
    '{
        "639-1":"sq",
        "639-2-T":"sqi",
        "639-2-B":"alb",
        "639-3":"sqi + 4"
    }',
    7500000
),
(
    6,
    '{
        "en":"Amharic",
        "es":"Amárico",
        "pt":"Amárico",
        "de":"Amharisch",
        "ru":"Амхарский",
        "fr":"Amharique"
    }',
    '{
        "639-1":"am",
        "639-2-T":"amh",
        "639-2-B":"amh",
        "639-3":"amh"
    }',
    22000000
),
(
    7,
    '{
        "en":"Arabic",
        "es":"Arábica",
        "pt":"árabe",
        "de":"Arabisch",
        "ru":"арабский",
        "fr":"arabe"
    }',
    '{
        "639-1":"ar",
        "639-2-T":"ara",
        "639-2-B":"ara",
        "639-3":"ara + 29"
    }',
    310000000
),
(
    8,
    '{
        "en":"Aragonese",
        "es":"Aragonés",
        "pt":"Aragonês",
        "de":"Aragonesisch",
        "ru":"Арагонский",
        "fr":"Aragonais"
    }',
    '{
        "639-1":"an",
        "639-2-T":"arg",
        "639-2-B":"arg",
        "639-3":"arg"
    }',
    50000
),
(
    9,
    '{
        "en":"Armenian",
        "es":"Armenio",
        "pt":"Armênio",
        "de":"Armenisch",
        "ru":"Армянский",
        "fr":"Arménien"
    }',
    '{
        "639-1":"hy",
        "639-2-T":"hye",
        "639-2-B":"arm",
        "639-3":"hye"
    }',
    6700000
),
(
    10,
    '{
        "en":"Assamese",
        "es":"Asamés",
        "pt":"Assamês",
        "de":"Assamesisch",
        "ru":"Ассамский",
        "fr":"Assamais"
    }',
    '{
        "639-1":"as",
        "639-2-T":"asm",
        "639-2-B":"asm",
        "639-3":"asm"
    }',
    14810000
),
(
    11,
    '{
        "en":"Avaric",
        "es":"Avarico",
        "pt":"Avaric",
        "de":"Avaric",
        "ru":"Аварский",
        "fr":"Avaric"
    }',
    '{
        "639-1":"av",
        "639-2-T":"ava",
        "639-2-B":"ava",
        "639-3":"ava"
    }',
    1000000
),
(
    12,
    '{
        "en":"Avestan",
        "es":"Avestan",
        "pt":"Avestan",
        "de":"Avestan",
        "ru":"Авестийский",
        "fr":"Avestan"
    }',
    '{
        "639-1":"ae",
        "639-2-T":"ave",
        "639-2-B":"ave",
        "639-3":"ave"
    }',
    null
),
(
    13,
    '{
        "en":"Aymara",
        "es":"aimara",
        "pt":"Aymara",
        "de":"Aymara",
        "ru":"аймара",
        "fr":"Aymara"
    }',
    '{
        "639-1":"ay",
        "639-2-T":"aym",
        "639-2-B":"aym",
        "639-3":"aym + 2"
    }',
    1677100
),
(
    14,
    '{
        "en":"Azerbaijani",
        "es":"Azerbaiyano",
        "pt":"Azerbaijani",
        "de":"Aserbaidschanisch",
        "ru":"Азербайджанский",
        "fr":"Azerbaïdjanais"
    }',
    '{
        "639-1":"az",
        "639-2-T":"aze",
        "639-2-B":"aze",
        "639-3":"aze + 2"
    }',
    23000000
),
