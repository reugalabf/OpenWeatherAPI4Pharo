Class {
	#name : #OneCallReport,
	#superclass : #Object,
	#instVars : [
		'lat',
		'lon',
		'timezone',
		'timezone_offset',
		'current',
		'minutely',
		'hourly',
		'daily',
		'alerts'
	],
	#category : #'OpenWeatherMap-Entities'
}

{ #category : #accessing }
OneCallReport class >> neoJsonMapping: mapper [

	mapper for: self do: [ :mapping | 
		mapping mapInstVars: #( lat lon timezone timezone_offset
		   minutely ).

		(mapping mapInstVar: #current) valueSchema: OneCallCurrent.
		(mapping mapInstVar: #hourly) valueSchema: OneCallHourlyForecast.
		(mapping mapInstVar: #daily) valueSchema: #CollectionOfDailyForecast.
		(mapping mapInstVar: #alerts) valueSchema: OneCallAlert ].

	mapper
		for: #CollectionOfDailyForecast
		customDo: [ :mapping | 
		mapping listOfElementSchema: OneCallDailyForecast ]
]
