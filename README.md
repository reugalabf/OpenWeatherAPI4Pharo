# OpenWeatherAPI4Pharo
---
This is a client for the some of the API published by OpenWeatherMap such as:OneCall and currentWeather.

Please visit https://openweathermap.org/ to learn more about the available APIs and to get a valid key. The key is required to call the API. 

## Installation

```
Metacello new
  repository: 'github://reugalabf/OpenWeatherAPI4Pharo:main';
  baseline: 'OpenWeatherMap';
  load.
```

## Example

``` |client|
client :=  OpenWeatherMapClient withSettings: ((Dictionary new) at:#key put:'---your-key---'; yourself).
(client oneCallFor: ((Dictionary new) 
 at:#lat put: '-33.995386'; 
 at:#lon put:'-58.286154'; 
 at:#units put: 'metric';
 at:#exclude put:'minutely,hourly';
 yourself  )) inspect.
							
(client currentWeatherFor: ((Dictionary new) 
 at:#lat put: '-33.995386'; 
 at:#lon put:'-58.286154'; 
 at:#units put: 'metric';
 at:#exclude put:'minutely,hourly';
 yourself  )) inspect.				```
