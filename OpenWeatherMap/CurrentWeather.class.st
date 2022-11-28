"
https://openweathermap.org/current
"
Class {
	#name : #CurrentWeather,
	#superclass : #Object,
	#instVars : [
		'coord',
		'weather',
		'main',
		'visibility',
		'wind',
		'clouds',
		'rain',
		'snow',
		'dt',
		'sys',
		'timezone',
		'id',
		'name'
	],
	#category : #'OpenWeatherMap-Entities'
}

{ #category : #accessing }
CurrentWeather class >> neoJsonMapping: mapper [

	mapper for: self do: [ :mapping | 
		mapping mapInstVars:
			#( coord weather main visibility wind clouds rain snow dt sys timezone
			   id name ) ]
]
