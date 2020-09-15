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
),
(
    37,
    '{
        "en":"Danish",
        "es":"Danés",
        "pt":"dinamarquês",
        "de":"dänisch",
        "ru":"Датский",
        "fr":"Danois"
    }',
    '{
        "639-1":"da",
        "639-2-T":"dan",
        "639-2-B":"dan",
        "639-3":"dan"
    }',
    6000000
),
(
    38,
    '{
        "en":"Dutch",
        "es":"Holandés",
        "pt":"Holandês",
        "de":"Niederländisch",
        "ru":"нидерландский язык",
        "fr":"Néerlandais"
    }',
    '{
        "639-1":"nl",
        "639-2-T":"nld",
        "639-2-B":"dut",
        "639-3":"nld"
    }',
    29000000
),
(
    39,
    '{
        "en":"Dzongkha",
        "es":"Dzongkha",
        "pt":"Dzongkha",
        "de":"Dzongkha",
        "ru":"Дзонгка",
        "fr":"Dzongkha"
    }',
    '{
        "639-1":"dz",
        "639-2-T":"dzo",
        "639-2-B":"dzo",
        "639-3":"dzo"
    }',
    640000
),
(
    40,
    '{
        "en":"English",
        "es":"Inglés",
        "pt":"Inglês",
        "de":"Englisch",
        "ru":"английский",
        "fr":"Anglais"
    }',
    '{
        "639-1":"en",
        "639-2-T":"eng",
        "639-2-B":"eng",
        "639-3":"eng"
    }',
    1150000
),
(
    41,
    '{
        "en":"Esperanto",
        "es":"esperanto",
        "pt":"esperanto",
        "de":"Esperanto",
        "ru":"эсперанто",
        "fr":"espéranto"
    }',
    '{
        "639-1":"eo",
        "639-2-T":"epo",
        "639-2-B":"epo",
        "639-3":"epo"
    }',
    2000000
),
(
    42,
    '{
        "en":"Estonian",
        "es":"Estonio",
        "pt":"Estoniano",
        "de":"estnisch",
        "ru":"эстонский",
        "fr":"estonien"
    }',
    '{
        "639-1":"et",
        "639-2-T":"est",
        "639-2-B":"est",
        "639-3":"est + 2"
    }',
    1100000
),
(
    43,
    /* TODO: translation */
    '{
        "en":"Ewe",
        "es":"Ewe",
        "pt":"Ewe",
        "de":"Ewe",
        "ru":"Ewe",
        "fr":"Ewe"
    }',
    '{
        "639-1":"ee",
        "639-2-T":"ewe",
        "639-2-B":"ewe",
        "639-3":"ewe"
    }',
    5000000
),
(
    44,
    '{
        "en":"Faroese",
        "es":"Feroés",
        "pt":"Faroense",
        "de":"Färöer",
        "ru":"Фарерские острова",
        "fr":"Féroïen"
    }',
    '{
        "639-1":"fo",
        "639-2-T":"fao",
        "639-2-B":"fao",
        "639-3":"fao"
    }',
    72000
),
(
    45,
    '{
        "en":"Fijian",
        "es":"Fiyiano",
        "pt":"De Fiji",
        "de":"Fidschianisch",
        "ru":"Фиджийский",
        "fr":"Fidjien"
    }',
    '{
        "639-1":"fj",
        "639-2-T":"fij",
        "639-2-B":"fij",
        "639-3":"fij"
    }',
    339210
),
(
    46,
    '{
        "en":"Finnish",
        "es":"Finlandés",
        "pt":"Finlandês",
        "de":"finnisch",
        "ru":"Финский",
        "fr":"Finlandais"
    }',
    '{
        "639-1":"fi",
        "639-2-T":"fin",
        "639-2-B":"fin",
        "639-3":"fin"
    }',
    5400000
),
(
    47,
    '{
        "en":"French",
        "es":"Francés",
        "pt":"Francês",
        "de":"Französisch",
        "ru":"французский язык",
        "fr":"Français"
    }',
    '{
        "639-1":"fr",
        "639-2-T":"fra",
        "639-2-B":"fre",
        "639-3":"fra"
    }',
    274000000
),
(
    48,
    '{
        "en":"Fulah",
        "es":"Fulah",
        "pt":"Fulah",
        "de":"Fulah",
        "ru":"Фулах",
        "fr":"Fulah"
    }',
    '{
        "639-1":"ff",
        "639-2-T":"ful",
        "639-2-B":"ful",
        "639-3":"ful + 9"
    }',
    65000000
),
(
    49,
    '{
        "en":"Galician",
        "es":"Gallego",
        "pt":"Galego",
        "de":"galizisch",
        "ru":"Галицкий",
        "fr":"Galicien"
    }',
    '{
        "639-1":"gl",
        "639-2-T":"glg",
        "639-2-B":"glg",
        "639-3":"glg"
    }',
    2400000
),
(
    50,
    '{
        "en":"Georgian",
        "es":"Georgiano",
        "pt":"Georgiano",
        "de":"georgisch",
        "ru":"Грузинский",
        "fr":"Géorgien"
    }',
    '{
        "639-1":"ka",
        "639-2-T":"kat",
        "639-2-B":"geo",
        "639-3":"kat"
    }',
    3700000
),
(
    51,
    '{
        "en":"German",
        "es":"Alemán",
        "pt":"Alemã",
        "de":"Deutsch",
        "ru":"Немецкий",
        "fr":"Allemand"
    }',
    '{
        "639-1":"de",
        "639-2-T":"deu",
        "639-2-B":"ger",
        "639-3":"deu"
    }',
    95000000
),
(
    52,
    '{
        "en":"Greek",
        "es":"Griego",
        "pt":"Grego",
        "de":"griechisch",
        "ru":"Греческий",
        "fr":"Grec"
    }',
    '{
        "639-1":"el",
        "639-2-T":"ell",
        "639-2-B":"gre",
        "639-3":"ell"
    }',
    13400000
),
(
    53,
    '{
        "en":"Guarani",
        "es":"Guarani",
        "pt":"Guarani",
        "de":"Guarani",
        "ru":"Гуарани",
        "fr":"Guarani"
    }',
    '{
        "639-1":"gn",
        "639-2-T":"grn",
        "639-2-B":"grn",
        "639-3":"grn + 5"
    }',
    4850000
),
(
    54,
    '{
        "en":"Gujarati",
        "es":"Gujarati",
        "pt":"Guzerate",
        "de":"Gujarati",
        "ru":"Гуджарати",
        "fr":"Gujarati"
    }',
    '{
        "639-1":"gu",
        "639-2-T":"guj",
        "639-2-B":"guj",
        "639-3":"guj"
    }',
    56000000
),
(
    55,
    '{
        "en":"Haitian",
        "es":"Haitiano",
        "pt":"Haitiano",
        "de":"haitianisch",
        "ru":"Гаитянский",
        "fr":"Haïtien"
    }',
    '{
        "639-1":"ht",
        "639-2-T":"hat",
        "639-2-B":"hat",
        "639-3":"hat"
    }',
    9600000
),
(
    56,
    '{
        "en":"Hausa",
        "es":"Hausa",
        "pt":"Hausa",
        "de":"Hausa",
        "ru":"Хауса",
        "fr":"Haoussa"
    }',
    '{
        "639-1":"ha",
        "639-2-T":"hau",
        "639-2-B":"hau",
        "639-3":"hau"
    }',
    100000000
),
(
    57,
    '{
        "en":"Hebrew",
        "es":"Hebreo",
        "pt":"Hebraico",
        "de":"hebräisch",
        "ru":"иврит",
        "fr":"Hébreu"
    }',
    '{
        "639-1":"he",
        "639-2-T":"heb",
        "639-2-B":"heb",
        "639-3":"heb"
    }',
    5000000
),
(
    58,
    '{
        "en":"Herero",
        "es":"Herero",
        "pt":"Herero",
        "de":"Herero",
        "ru":"Гереро",
        "fr":"Herero"
    }',
    '{
        "639-1":"hz",
        "639-2-T":"her",
        "639-2-B":"her",
        "639-3":"her"
    }',
    211700
),
(
    59,
    '{
        "en":"Hindi",
        "es":"Hindi",
        "pt":"Hindi",
        "de":"Hindi",
        "ru":"хинди",
        "fr":"Hindi"
    }',
    '{
        "639-1":"hi",
        "639-2-T":"hin",
        "639-2-B":"hin",
        "639-3":"hin"
    }',
    322000000
),
(
    60,
    '{
        "en":"Hiri Motu",
        "es":"Hiri Motu",
        "pt":"Hiri Motu",
        "de":"Hiri Motu",
        "ru":"Хири Моту",
        "fr":"Hiri Motu"
    }',
    '{
        "639-1":"ho",
        "639-2-T":"hmo",
        "639-2-B":"hmo",
        "639-3":"hmo"
    }',
    6000000
),
(
    61,
    '{
        "en":"Hungarian",
        "es":"Húngaro",
        "pt":"Húngaro",
        "de":"ungarisch",
        "ru":"венгерский язык",
        "fr":"Hongrois"
    }',
    '{
        "639-1":"hu",
        "639-2-T":"hun",
        "639-2-B":"hun",
        "639-3":"hun"
    }',
    13000000
),
(
    62,
    '{
        "en":"Indonesian",
        "es":"Indonesio",
        "pt":"Indonésio",
        "de":"Indonesisch",
        "ru":"индонезийский",
        "fr":"Indonésien"
    }',
    '{
        "639-1":"id",
        "639-2-T":"ind",
        "639-2-B":"ind",
        "639-3":"ind"
    }',
    43000000
),
(
    63,
    '{
        "en":"Interlingua",
        "es":"Interlingua",
        "pt":"Interlíngua",
        "de":"Interlingua",
        "ru":"Интерлингва",
        "fr":"Interlingua"
    }',
    '{
        "639-1":"ia",
        "639-2-T":"ina",
        "639-2-B":"ina",
        "639-3":"ina"
    }',
    1500
),
(
    64,
    '{
        "en":"Irish",
        "es":"Irlandés",
        "pt":"Irlandês",
        "de":"irisch",
        "ru":"Ирландский",
        "fr":"Irlandais"
    }',
    '{
        "639-1":"ga",
        "639-2-T":"gle",
        "639-2-B":"gle",
        "639-3":"gle"
    }',
    170290
),
(
    65,
    '{
        "en":"Igbo",
        "es":"Igbo",
        "pt":"Igbo",
        "de":"Igbo",
        "ru":"Игбо",
        "fr":"Igbo"
    }',
    '{
        "639-1":"ig",
        "639-2-T":"ibo",
        "639-2-B":"ibo",
        "639-3":"ibo"
    }',
    35000000
),
(
    66,
    '{
        "en":"Inupiaq",
        "es":"Inupiaq",
        "pt":"Inupiaq",
        "de":"Inupiaq",
        "ru":"Инупиак",
        "fr":"Inupiaq"
    }',
    '{
        "639-1":"ik",
        "639-2-T":"ipk",
        "639-2-B":"ipk",
        "639-3":"ipk + 2"
    }',
    2144
),
(
    67,
    /* TODO: translation */
    '{
        "en":"Ido",
        "es":"Ido",
        "pt":"Ido",
        "de":"Ido",
        "ru":"Ido",
        "fr":"Ido"
    }',
    '{
        "639-1":"io",
        "639-2-T":"ido",
        "639-2-B":"ido",
        "639-3":"ido"
    }',
    200
),
(
    68,
    '{
        "en":"Icelandic",
        "es":"Islandés",
        "pt":"islandês",
        "de":"isländisch",
        "ru":"исландский",
        "fr":"islandais"
    }',
    '{
        "639-1":"is",
        "639-2-T":"isl",
        "639-2-B":"ice",
        "639-3":"isl"
    }',
    314000
),
(
    69,
    '{
        "en":"Italian",
        "es":"Italiano",
        "pt":"Italiano",
        "de":"italienisch",
        "ru":"Итальянский",
        "fr":"Italien"
    }',
    '{
        "639-1":"it",
        "639-2-T":"ita",
        "639-2-B":"ita",
        "639-3":"ita"
    }',
    67000000
),
(
    70,
    '{
        "en":"Inuktitut",
        "es":"Inuktitut",
        "pt":"Inuktitut",
        "de":"Inuktitut",
        "ru":"Инуктитут",
        "fr":"Inuktitut"
    }',
    '{
        "639-1":"iu",
        "639-2-T":"iku",
        "639-2-B":"iku",
        "639-3":"iku + 2"
    }',
    35215
),
