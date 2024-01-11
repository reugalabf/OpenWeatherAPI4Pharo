"
JSON

hourly Hourly forecast weather data API response
hourly.dt Time of the forecasted data, Unix, UTC
hourly.temp Temperature. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit. How to change units used
hourly.feelslike Temperature. This accounts for the human perception of weather. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
hourly.pressure Atmospheric pressure on the sea level, hPa
hourly.humidity Humidity, %
hourly.dewpoint Atmospheric temperature (varying according to pressure and humidity) below which water droplets begin to condense and dew can form. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
hourly.uvi UV index
hourly.clouds Cloudiness, %
hourly.visibility Average visibility, metres. The maximum value of the visibility is 10km
hourly.windspeed Wind speed. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour.How to change units used
hourly.windgust (where available) Wind gust. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour. How to change units used
chourly.winddeg Wind direction, degrees (meteorological)
hourly.pop Probability of precipitation. The values of the parameter vary between 0 and 1, where 0 is equal to 0%, 1 is equal to 100%
hourly.rain
hourly.rain.1h (where available) Rain volume for last hour, mm
hourly.snow
hourly.snow.1h (where available) Snow volume for last hour, mm
hourly.weather
hourly.weather.id Weather condition id
hourly.weather.main Group of weather parameters (Rain, Snow, Extreme etc.)
hourly.weather.description Weather condition within the group (full list of weather conditions). Get the output in your language
hourly.weather.icon Weather icon id. How to get icons
"
Class {
	#name : #OneCallHourlyForecast,
	#superclass : #OpenWeatherDatedEntity,
	#instVars : [
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
OneCallHourlyForecast class >> neoJsonMapping: mapper [

	mapper for: self do: [ :mapping | mapping mapAllInstVars ]
]

{ #category : #enumerating }
OneCallHourlyForecast >> dt_iso [

	^ self subclassResponsibility
]

{ #category : #enumerating }
OneCallHourlyForecast >> timezone [

	^ self subclassResponsibility
]
