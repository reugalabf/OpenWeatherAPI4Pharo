Class {
	#name : #OpenWeatherMapClient,
	#superclass : #Object,
	#instVars : [
		'sessionKey'
	],
	#category : #'OpenWeatherMap-Client'
}

{ #category : #'as yet unclassified' }
OpenWeatherMapClient >> currentWeatherFor: params [ 

"ZnEasy get: 'https://api.openweathermap.org/data/2.5/weather?lat=-33.995386&lon=-58.286154&appid=XXXXXX'."
]

{ #category : #'as yet unclassified' }
OpenWeatherMapClient >> oneCallFor: settings [

"ZnEasy get: 'https://api.openweathermap.org/data/3.0/onecall?lat=-33.995386&lon=-58.286154&units=metric&exclude=minutely,hourly&appid=XXXXX'"
]
