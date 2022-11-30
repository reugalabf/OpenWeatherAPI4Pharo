Class {
	#name : #OneCallHourlyForecast,
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
OneCallHourlyForecast class >> neoJsonMapping: mapper [

	mapper for: self do: [ :mapping | mapping mapAllInstVars ]
]

{ #category : #accessing }
OneCallHourlyForecast >> dt [

	^ dt
]
