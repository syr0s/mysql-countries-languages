# mysql-countries-languages
mySQL / MariaDB tables including countries,
languages and meta data in different languages, for
your next project.

## Languages
The following languages are included:
- English
- Spanish
- Portuguese
- German
- Russian
- French

## Settings on the host
Please make sure that the `locales` on your host is set
set to `LANG=C.UTF-8` and `LC_ALL=C.UTF-8`. Otherwise the inserting of the
russian values, as well as the special characters,
will fail.

## Project description
The project contains the following related tables:
- `countries`,
- `continents`,
- `states`,
- and `languages`

## Table layout
All tables have `utf8mb4` as default charset.
![image](https://user-images.githubusercontent.com/45044563/93254145-2f5dfd80-f798-11ea-904e-f96cf9f67028.png)

### Table: `countries`
The countries table has the following design
| Column | Type | Extras | Description |
|  --------------  | -------------- | -------------- | -------------- |
| country_id | SMALLINT | NN, UQ, UN, PK | Primary key of the table. Didn't use auto increment to verify integrity |
| country_name | JSON | NN | json array of the country name in different languages |
| capital_city | JSON | NN | json array of the capital city in different languages |
| official_name | JSON | NN | json array of the official name in different languages |
| official_language | SMALLINT | NN, UN, FK | Foreign key to table languages |
| other_language | JSON | | json array of other spoken languages |
| continent | SMALLINT | NN, UN, FK | Foreign key to table continents |
| country_codes | JSON | NN | The different country codes |
| currency | VARCHAR(3) | NN | Currency in ISO 4217 format |
| latitude | FLOAT | NN | The latitude of the country |
| longitude | FLOAT | NN | The longitude of the country |
| residents | INT | UN | The residents of the country (can be null, if no data is available) |
| area | INT | NN, UN | Area of the country in square kilometers |

***Design of the default json array 
(if not defined otherwise below):***
```
{
   "ISO 639-1 code":"name",
   ...
}
```

***Design of the other languages array:***
```
{
   "1":"language_id",
   "2":"language_id",
   ...
}
```

***Design of the country code array:***
```
{
   "tld":"country code top-level domain",
   "cca2":"code ISO 3166-1 alpha-2",
   "ccn3":"code ISO 3166-1 numeric",
   "cca3":"code ISO 3166-1 alpha-3",
   "call":"calling code"
}
```

### Table: `languages`
The languages table has the following design
| Column | Type | Extras | Description |
|  --------------  | -------------- | -------------- | -------------- |
| language_id | SMALLINT | NN, UQ, UN, PK | Primary key of the table. Didn't use auto increment to verify integrity |
| language_name | JSON | NN | the language name in different languages |
| language_codes | JSON | NN | The different language codes |
| speakers | INT | UN | worldwide speakers of the language |

***Design of the default json array 
(if not defined otherwise below):***
```
{
   "ISO 639-1 code":"name",
   ...
}
```

***Design of the language codes array:***
```
{
    "639-1":"ISO 639-1 code",
    "639-2-T":"ISO 639-2/T code",
    "639-2-B":"ISO 639-2/B code",
    "639-3":"ISO 639-3 code"
}
```

### Table: `continents`
The continents table has the following design
| Column | Type | Extras | Description |
|  --------------  | -------------- | -------------- | -------------- |
| continent_id | SMALLINT | NN, UQ, UN, PK | Primary key of the table. Didn't use auto increment to verify integrity |
| continent_name | JSON | NN | the language name in different languages |
| residents | INT | UN, NN | Residents on this continent |
| area | INT | UN, NN | area in square kilometers |

***Design of the default json array 
(if not defined otherwise below):***
```
{
   "ISO 639-1 code":"name",
   ...
}
```

### Table: `states`
The states table has the following design
| Column | Type | Extras | Description |
|  --------------  | -------------- | -------------- | -------------- |
| state_id | SMALLINT | NN, UQ, UN, PK | Primary key of the table. Didn't use auto increment to verify integrity |
| country_id | SMALLINT | NN, UN | Foreign key to table countries |
| state_name | JSON | NN | the state name in different languages |
| state_capital | JSON | | the states capital city as json array |
| residents | INT | UN | Residents in this state |
| area | INT | UN | area in square kilometers |

***Design of the default json array 
(if not defined otherwise below):***
```
{
   "ISO 639-1 code":"name",
   ...
}
```
