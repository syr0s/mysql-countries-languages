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
/* create the countries table */
CREATE TABLE IF NOT EXISTS `countries` ( 
   `country_id` SMALLINT UNSIGNED NOT NULL COMMENT 'Primary key of the table. Didnt use auto increment to verify integrity',
   `country_name` JSON NOT NULL COMMENT 'json array of the country name in different languages',
   `capital_city` JSON NOT NULL COMMENT 'json array of the capital city in different languages',
   `official_name` JSON NOT NULL COMMENT 'json array of the official name in different languages',
   `official_language` SMALLINT UNSIGNED NOT NULL COMMENT 'Foreign key to table languages',
   `other_language` JSON COMMENT 'json array of other spoken languages',
   `continent` SMALLINT UNSIGNED NOT NULL COMMENT 'Foreign key to table continents',
   `country_codes` JSON NOT NULL COMMENT 'The different country codes',
   `currency` VARCHAR(3) NOT NULL COMMENT 'Currency in ISO 4217 format',
   `latitude` FLOAT NOT NULL COMMENT 'The latitude of the country',
   `longitude` FLOAT NOT NULL COMMENT 'The longitude of the country',
   `residents` INT UNSIGNED COMMENT 'The residents of the country (can be null, if no data is available)',
   `area` INT UNSIGNED NOT NULL COMMENT 'Area of the country in square kilometers',
    PRIMARY KEY `Primary key`(
   `country_id`
    )
)
 COMMENT = 'table stores all countries with additional information"'
 ENGINE = InnoDB
 DEFAULT CHARACTER SET = UTF8
 ROW_FORMAT = Default;

/* create the languages table */
CREATE TABLE IF NOT EXISTS `languages` ( 
   `language_id` SMALLINT UNSIGNED NOT NULL COMMENT 'Primary key of the table. Didnt use auto increment to verify integrity',
   `language_name` JSON NOT NULL COMMENT 'the language name in different languages',
   `language_codes` JSON NOT NULL COMMENT 'The different language codes',
   `speakers` INT COMMENT 'worldwide speakers of the language',
    PRIMARY KEY `Primary key`(
   `language_id`
    )
)
 COMMENT = 'table stores all languages spoken on the world'
 ENGINE = InnoDB
 DEFAULT CHARACTER SET = UTF8
 ROW_FORMAT = Default;

/* create the continents table */
CREATE TABLE IF NOT EXISTS `continents` ( 
   `continent_id` SMALLINT UNSIGNED NOT NULL COMMENT 'Primary key of the table. Didnt use auto increment to verify integrity',
   `continent_name` JSON NOT NULL COMMENT 'the language name in different languages',
   `residents` INT UNSIGNED NOT NULL COMMENT 'Residents on this continent',
   `area` INT UNSIGNED NOT NULL COMMENT 'area in square kilometers',
    PRIMARY KEY `Primary key`(
   `continent_id`
    )
)
 COMMENT = 'table stores all continents with additional information'
 ENGINE = InnoDB
 DEFAULT CHARACTER SET = UTF8
 ROW_FORMAT = Default;

/* create the states table */
CREATE TABLE IF NOT EXISTS `states` ( 
   `state_id` INT UNSIGNED NOT NULL COMMENT 'Primary key of the table. Didnt use auto increment to verify integrity',
   `country_id` SMALLINT UNSIGNED NOT NULL COMMENT 'Foreign key to table countries',
   `state_name` JSON NOT NULL COMMENT 'the state name in different languages',
   `state_capital` JSON COMMENT 'the states capital city as json array',
   `residents` INT UNSIGNED COMMENT 'Residents in this state',
   `area` INT UNSIGNED COMMENT 'area in square kilometers',
    PRIMARY KEY `Primary key`(
   `state_id`
    )
)
 COMMENT = 'table stores all states with additional information'
 ENGINE = InnoDB
 DEFAULT CHARACTER SET = UTF8
 ROW_FORMAT = Default;

/* create constraint between languages and countries */
ALTER TABLE `countries` 
  ADD CONSTRAINT `languages-countries`
  FOREIGN KEY ( 
   `official_language`
)   REFERENCES `languages`( 
   `language_id`
) ;

/* create constraint between continents and countries */
ALTER TABLE `countries` 
  ADD CONSTRAINT `continents-countries`
  FOREIGN KEY ( 
   `continent`
)   REFERENCES `continents`( 
   `continent_id`
) ;

/* create constraint between countries and states */
ALTER TABLE `states` 
  ADD CONSTRAINT `countries-states`
  FOREIGN KEY ( 
   `country_id`
)   REFERENCES `countries`( 
   `country_id`
) ;



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
(
    15,
    '{
        "en":"Bambara",
        "es":"Bambara",
        "pt":"Bambara",
        "de":"Bambara",
        "ru":"Бамбара",
        "fr":"Bambara"
    }',
    '{
        "639-1":"bm",
        "639-2-T":"bam",
        "639-2-B":"bam",
        "639-3":"bam"
    }',
    4100000
),
(
    16,
    '{
        "en":"Bashkir",
        "es":"Bashkir",
        "pt":"Bashkir",
        "de":"Baschkirisch",
        "ru":"Башкирский",
        "fr":"Bachkir"
    }',
    '{
        "639-1":"ba",
        "639-2-T":"bak",
        "639-2-B":"bak",
        "639-3":"bak"
    }',
    1200000
),
(
    17,
    '{
        "en":"Basque",
        "es":"Vasco",
        "pt":"Basco",
        "de":"baskisch",
        "ru":"Баскский",
        "fr":"basque"
    }',
    '{
        "639-1":"eu",
        "639-2-T":"eus",
        "639-2-B":"baq",
        "639-3":"eus"
    }',
    1185500
),
(
    18,
    '{
        "en":"Belarusian",
        "es":"Bielorruso",
        "pt":"Bielorusso",
        "de":"Belarussisch",
        "ru":"Белорусский",
        "fr":"Biélorusse"
    }',
    '{
        "639-1":"be",
        "639-2-T":"bel",
        "639-2-B":"bel",
        "639-3":"bel"
    }',
    5100000
),
(
    19,
    '{
        "en":"Bengali",
        "es":"bengalí",
        "pt":"bengali",
        "de":"Bengali",
        "ru":"Бенгальский",
        "fr":"bengali"
    }',
    '{
        "639-1":"bn",
        "639-2-T":"ben",
        "639-2-B":"ben",
        "639-3":"be"
    }',
    230000000
),
(
    20,
    '{
        "en":"Bihari languages",
        "es":"Idiomas bihari",
        "pt":"Línguas bihari",
        "de":"Bihari-Sprachen",
        "ru":"Языки бихари",
        "fr":"Langues bihari"
    }',
    '{
        "639-1":"bh",
        "639-2-T":"bih",
        "639-2-B":"bih",
        "639-3":null
    }',
    null
),
(
    21,
    '{
        "en":"Bislama",
        "es":"Bislama"
        "pt":"Bislama",
        "de":"Bislama",
        "ru":"Бислама",
        "fr":"Bislama"
    }',
    '{
        "639-1":"bi",
        "639-2-T":"bis",
        "639-2-B":"bis",
        "639-3":"bis"
    }',
    200000
),
(
    22,
    '{
        "en":"Bosnian",
        "es":"Bosnio",
        "pt":"Bósnio",
        "de":"bosnisch",
        "ru":"Боснийский",
        "fr":"Bosniaque"
    }',
    '{
        "639-1":"bs",
        "639-2-T":"bos",
        "639-2-B":"bos",
        "639-3":"bos"
    }',
    3000000
),
(
    23,
    '{
        "en":"Breton",
        "es":"Bretón",
        "pt":"Bretão",
        "de":"Bretonisch",
        "ru":"Бретонский",
        "fr":"Breton"
    }',
    '{
        "639-1":"br",
        "639-2-T":"bre",
        "639-2-B":"bre",
        "639-3":"bre"
    }',
    226000
),
(
    24,
    '{
        "en":"Bulgarian",
        "es":"Búlgaro",
        "pt":"Búlgaro",
        "de":"Bulgarisch",
        "ru":"болгарский",
        "fr":"bulgare"
    }',
    '{
        "639-1":"bg",
        "639-2-T":"bul",
        "639-2-B":"bul",
        "639-3":"bul"
    }',
    9000000
),
(
    25,
    '{
        "en":"Burmese",
        "es":"Birmano",
        "pt":"Birmanês",
        "de":"birmanisch",
        "ru":"Бирманский"
        "fr":"Birman"
    }',
    '{
        "639-1":"my",
        "639-2-T":"mya",
        "639-2-B":"bur",
        "639-3":"mya"
    }',
    33000000
),
(
    26,
    '{
        "en":"Catalan",
        "es":"Catalán",
        "pt":"Catalão",
        "de":"katalanisch",
        "ru":"Каталонский",
        "fr":"Catalan"
    }',
    '{
        "639-1":"ca",
        "639-2-T":"cat",
        "639-2-B":"cat",
        "639-3":"cat"
    }',
    4100000
),
(
    27,
    '{
        "en":"Chamorro",
        "es":"Chamorro",
        "pt":"Chamorro",
        "de":"Chamorro",
        "ru":"Чаморро",
        "fr":"Chamorro"
    }',
    '{
        "639-1":"ch",
        "639-2-T":"cha",
        "639-2-B":"cha",
        "639-3":"cha"
    }',
    58000
),
(
    28,
    '{
        "en":"Chechen",
        "es":"Checheno",
        "pt":"Checheno",
        "de":"Tschetschenisch",
        "ru":"Чеченский",
        "fr":"Tchétchène"
    }',
    '{
        "639-1":"ce",
        "639-2-T":"che",
        "639-2-B":"che",
        "639-3":"che"
    }',
    1400000
),
(
    29,
    '{
        "en":"Chichewa",
        "es":"Chichewa",
        "pt":"Chichewa",
        "de":"Chichewa",
        "ru":"Чичева",
        "fr":"Chichewa"
    }',
    '{
        "639-1":"ny",
        "639-2-T":"nya",
        "639-2-B":"nya",
        "639-3":"nya"
    }',
    12000000
),
(
    30,
    '{
        "en":"Chinese",
        "es":"Chino",
        "pt":"Chinês",
        "de":"Chinesisch",
        "ru":"китайский язык",
        "fr":"Chinois"
    }',
    '{
        "639-1":"zh",
        "639-2-T":"zho",
        "639-2-B":"chi",
        "639-3":"zho + 16"
    }',
    1200000000
),
(
    31,
    '{
        "en":"Chuvash",
        "es":"Chuvash",
        "pt":"Chuvash",
        "de":"Tschuwaschisch",
        "ru":"Чувашский",
        "fr":"Chuvash"
    }',
    '{
        "639-1":"cv",
        "639-2-T":"chv",
        "639-2-B":"chv",
        "639-3":"chv"
    }',
    1042989
),
(
    32,
    '{
        "en":"Cornish",
        "es":"de Cornualles",
        "pt":"Cornish",
        "de":"kornisch",
        "ru":"Корнуолл",
        "fr":"cornouaillais"
    }',
    '{
        "639-1":"kw",
        "639-2-T":"cor",
        "639-2-B":"cor",
        "639-3":"cor"
    }',
    500
),
(
    33,
    '{
        "en":"Corsican",
        "es":"corso",
        "pt":"Corso",
        "de":"Korsisch",
        "ru":"Корсиканский",
        "fr":"Corse"
    }',
    '{
        "639-1":"co",
        "639-2-T":"cos",
        "639-2-B":"cos",
        "639-3":"cos"
    }',
    125000
),
(
    34,
    '{
        "en":"Cree",
        "es":"Cree",
        "pt":"Cree",
        "de":"Cree",
        "ru":"Кри",
        "fr":"Cri"
    }',
    '{
        "639-1":"cr",
        "639-2-T":"cre",
        "639-2-B":"cre",
        "639-3":"cre + 6"
    }',
    96260
),
(
    35,
    '{
        "en":"Croatian",
        "es":"croata",
        "pt":"croata",
        "de":"kroatisch",
        "ru":"хорватский",
        "fr":"croate"
    }',
    '{
        "639-1":"hr",
        "639-2-T":"hrv",
        "639-2-B":"hrv",
        "639-3":"hrv"
    }',
    5600000
),
(
    36,
    '{
        "en":"Czech",
        "es":"Checo",
        "pt":"Tcheco",
        "de":"Tschechisch",
        "ru":"Чешский",
        "fr":"tchèque"
    }',
    '{
        "639-1":"cs",
        "639-2-T":"ces",
        "639-2-B":"cze",
        "639-3":"ces"
    }',
    10700000
);
