# mysql-countries-languages
mySQL / MariaDB tables including countries
and languages, in different languages, for
your next project.

## Languages
The following languages are included:
- English
- Spanish
- Portuguese
- German
- Russian

## Project description
The project contains the following related tables:
- `countries`,
- `continents`,
- `states`,
- and `languages`

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
| residents | SMALLINT | UN | The residents of the country (can be null, if no data is available) |
| area | SMALLINT | NN | Area of the country in square kilometers |

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
