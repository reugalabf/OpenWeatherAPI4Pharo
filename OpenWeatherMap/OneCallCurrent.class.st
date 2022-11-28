Class {
	#name : #OneCallCurrent,
	#superclass : #Object,
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
