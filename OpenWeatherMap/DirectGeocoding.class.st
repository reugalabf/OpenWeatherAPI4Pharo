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

{ #category : #accessing }
DirectGeocoding >> country [

	^ country
]

{ #category : #accessing }
DirectGeocoding >> country: anObject [

	country := anObject
]

{ #category : #accessing }
DirectGeocoding >> lat [

	^ lat
]

{ #category : #accessing }
DirectGeocoding >> lat: anObject [

	lat := anObject
]

{ #category : #accessing }
DirectGeocoding >> local_names [

	^ local_names
]

{ #category : #accessing }
DirectGeocoding >> local_names: anObject [

	local_names := anObject
]

{ #category : #accessing }
DirectGeocoding >> lon [

	^ lon
]

{ #category : #accessing }
DirectGeocoding >> lon: anObject [

	lon := anObject
]

{ #category : #accessing }
DirectGeocoding >> name [

	^ name
]

{ #category : #accessing }
DirectGeocoding >> name: anObject [

	name := anObject
]

{ #category : #accessing }
DirectGeocoding >> state [

	^ state
]

{ #category : #accessing }
DirectGeocoding >> state: anObject [

	state := anObject
]
