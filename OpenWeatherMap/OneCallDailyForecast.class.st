"
JSON

daily.temp Units – default: kelvin, metric: Celsius, imperial: Fahrenheit. How to change units used
daily.temp.morn Morning temperature.
daily.temp.day Day temperature.
daily.temp.eve Evening temperature.
daily.temp.night Night temperature.
daily.temp.min Min daily temperature.
daily.temp.max Max daily temperature.
daily.feelslike This accounts for the human perception of weather. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit. How to change units used
daily.feelslike.morn Morning temperature.
daily.feelslike.day Day temperature.
daily.feelslike.eve Evening temperature.
daily.feelslike.night Night temperature.
daily.pressure Atmospheric pressure on the sea level, hPa
daily.humidity Humidity, %
daily.dewpoint Atmospheric temperature (varying according to pressure and humidity) below which water droplets begin to condense and dew can form. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
daily.windspeed Wind speed. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour. How to change units used
daily.windgust (where available) Wind gust. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour. How to change units used
daily.winddeg Wind direction, degrees (meteorological)
daily.clouds Cloudiness, %
daily.uvi The maximum value of UV index for the day
daily.pop Probability of precipitation. The values of the parameter vary between 0 and 1, where 0 is equal to 0%, 1 is equal to 100%
daily.rain (where available) Precipitation volume, mm
daily.snow (where available) Snow volume, mm
daily.weather
daily.weather.id Weather condition id
daily.weather.main Group of weather parameters (Rain, Snow, Extreme etc.)
daily.weather.description Weather condition within the group (full list of weather conditions). Get the output in your language
daily.weather.icon Weather icon id. How to get icons
"
Class {
	#name : #OneCallDailyForecast,
	#superclass : #Object,
	#traits : 'DataTimeConversor',
	#classTraits : 'DataTimeConversor classTrait',
	#instVars : [
		'dt',
		'sunrise',
		'sunset',
		'moonrise',
		'moonset',
		'moon_phase',
		'temp',
		'feels_like',
		'pressure',
		'humidity',
		'dew_point',
		'wind_speed',
		'wind_gust',
		'wind_deg',
		'clouds',
		'uvi',
		'pop',
		'rain',
		'snow',
		'weather'
	],
	#category : #'OpenWeatherMap-Entities'
}

{ #category : #accessing }
OneCallDailyForecast class >> neoJsonMapping: mapper [

	mapper for: self do: [ :mapping | mapping mapAllInstVars ]
]

{ #category : #accessing }
OneCallDailyForecast >> dt [

	^ dt
]
