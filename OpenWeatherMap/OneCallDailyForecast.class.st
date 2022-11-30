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
