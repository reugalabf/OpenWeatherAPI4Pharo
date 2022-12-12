"
JSON
current Current weather data API response
current.dt Current time, Unix, UTC
current.sunrise Sunrise time, Unix, UTC
current.sunset Sunset time, Unix, UTC
current.temp Temperature. Units - default: kelvin, metric: Celsius, imperial: Fahrenheit. How to change units used
current.feelslike Temperature. This temperature parameter accounts for the human perception of weather. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
current.pressure Atmospheric pressure on the sea level, hPa
current.humidity Humidity, %
current.dewpoint Atmospheric temperature (varying according to pressure and humidity) below which water droplets begin to condense and dew can form. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
current.clouds Cloudiness, %
current.uvi Current UV index
current.visibility Average visibility, metres. The maximum value of the visibility is 10km
current.windspeed Wind speed. Wind speed. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour. How to change units used
current.windgust (where available) Wind gust. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour. How to change units used
current.winddeg Wind direction, degrees (meteorological)
current.rain
current.rain.1h (where available) Rain volume for last hour, mm
current.snow
current.snow.1h (where available) Snow volume for last hour, mm
current.weather
current.weather.id Weather condition id
current.weather.main Group of weather parameters (Rain, Snow, Extreme etc.)
current.weather.description Weather condition within the group (full list of weather conditions). Get the output in your language
current.weather.icon Weather icon id. How to get icons
"
Class {
	#name : #OneCallCurrent,
	#superclass : #Object,
	#traits : 'DataTimeConversor',
	#classTraits : 'DataTimeConversor classTrait',
	#instVars : [
		'dt',
		'sunrise',
		'sunset',
		'temp',
		'feels_like',
		'pressure',
		'humidity',
		'dew_point',
		'cloud',
		'uvi',
		'visibility',
		'wind_speed',
		'wind_gust',
		'wind_deg',
		'rain',
		'snow',
		'weather'
	],
	#category : #'OpenWeatherMap-Entities'
}

{ #category : #accessing }
OneCallCurrent class >> neoJsonMapping: mapper [

	mapper for: self do: [ :mapping | mapping mapAllInstVars ]
]

{ #category : #accessing }
OneCallCurrent >> dt [

	^ dt
]
