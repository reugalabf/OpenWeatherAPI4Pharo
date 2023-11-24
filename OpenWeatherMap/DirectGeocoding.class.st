Class {
	#name : #DirectGeocoding,
	#superclass : #Object,
	#instVars : [
		'lat',
		'lon',
		'name',
		'local_names',
		'country',
		'state'
	],
	#category : #'OpenWeatherMap-Entities'
}

{ #category : #accessing }
DirectGeocoding class >> neoJsonMapping: mapper [

	mapper for: self do: [ :mapping | 
		mapping mapInstVars:
			#( lat lon name local_names country state  ) ]
]
