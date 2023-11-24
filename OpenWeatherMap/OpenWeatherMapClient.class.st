"
|client|
client :=  OpenWeatherMapClient withSettings: ((Dictionary new) at:#key put:'YOUR-KEY'; yourself).
client oneCallFor: ((Dictionary new) 
							at:#lat put: '-33.995386'; 
							at:#lon put:'-58.286154'; 
							at:#units put: 'metric';
							at:#exclude put:'minutely,hourly';
							yourself  ).
							
(client currentWeatherFor: ((Dictionary new) 
							at:#lat put: '-33.995386'; 
							at:#lon put:'-58.286154'; 
							at:#units put: 'metric';
							at:#exclude put:'minutely,hourly';
							yourself  )).							

(client directGeocodingWith: ((Dictionary new) 
							at:#q put: 'La Plata, Buenos Aires, AR'; 
							yourself  )).												
(client directGeocodingWith: ((Dictionary new) 
							at:#q put: 'La Plata, AR'; 
							yourself  )).												

"
Class {
	#name : #OpenWeatherMapClient,
	#superclass : #Object,
	#instVars : [
		'callCount',
		'key'
	],
	#category : #'OpenWeatherMap-Client'
}

{ #category : #'instance creation' }
OpenWeatherMapClient class >> fromJson: aFilePathString [

	^ self withSettings:
		  (NeoJSONReader on: aFilePathString asFileReference readStream)
			  next
]

{ #category : #'instance creation' }
OpenWeatherMapClient class >> new [

	^ self shouldNotImplement
]

{ #category : #'instance creation' }
OpenWeatherMapClient class >> withSettings: aDictionary [

	^ super new
		  initializeSettings: aDictionary;
		  yourself
]

{ #category : #private }
OpenWeatherMapClient >> buildCallURL: urlString with: paramsDict [

	| ws |
	ws := WriteStream on: String new.
	ws nextPutAll: urlString.
	ws nextPut: $?.
	self urlParametersOn: ws with: paramsDict.
	^ws contents
]

{ #category : #private }
OpenWeatherMapClient >> currentWeatherCallWith: paramsDict [

	"'https://api.openweathermap.org/data/2.5/weather?lat=-33.995386&lon=-58.286154&appid=XXXXXX'."

	((paramsDict includesKey: #lat) and: [ paramsDict includesKey: #lon ])
		ifFalse: [ ^ self error: 'Missing required parameters' ]
		ifTrue: [ 
			^ self
				  buildCallURL: 'https://api.openweathermap.org/data/2.5/weather'
				  with: paramsDict ]
]

{ #category : #api }
OpenWeatherMapClient >> currentWeatherFor: paramsDict [

	| rsp |
	rsp := ZnEasy get: (self currentWeatherCallWith: paramsDict).
	rsp isError ifTrue: [ ^ self error: 'Error fetching Current Weather' ].
	^(NeoJSONReader on: rsp entity readStream) nextAs: CurrentWeather
]

{ #category : #api }
OpenWeatherMapClient >> directGeocodingFor: paramsDict [

	| rsp |
	rsp := ZnEasy get: (self directGeocodingWith: paramsDict).
	rsp isError ifTrue: [ 
		^ self error: 'Error fetching One Call Weather Report' ].
	^ (NeoJSONReader on: rsp entity readStream) nextListAs: DirectGeocoding 
]

{ #category : #private }
OpenWeatherMapClient >> directGeocodingWith: paramsDict [

	"http://api.openweathermap.org/geo/1.0/direct?q={city name},{state code},{country code}&limit={limit}&appid={API key}"

	"q ===> City name, state code (only for the US) and country code divided by comma. Please use ISO 3166 country codes."

	(paramsDict includesKey: #q)
		ifFalse: [ ^ self error: 'Missing required parameters' ]
		ifTrue: [ 
			^ self
				  buildCallURL: 'https://api.openweathermap.org/geo/1.0/direct'
				  with: (paramsDict
						   at: #limit put: '5';
						   yourself) ]
]

{ #category : #initialization }
OpenWeatherMapClient >> initializeSettings: aDictionary [

	(aDictionary includesKey: #key)
		ifTrue: [ key := aDictionary at: #key ]
		ifFalse: [ self error: 'Incomplete settings' ]
]

{ #category : #api }
OpenWeatherMapClient >> oneCallFor: paramsDict [

	| rsp |
	rsp := ZnEasy get: (self oneCallWith: paramsDict).
	rsp isError ifTrue: [ 
		^ self error: 'Error fetching One Call Weather Report' ].
	^ (NeoJSONReader on: rsp entity readStream) nextAs: OneCallReport
]

{ #category : #private }
OpenWeatherMapClient >> oneCallWith: paramsDict [

	"'https://api.openweathermap.org/data/2.5/weather?lat=-33.995386&lon=-58.286154&appid=XXXXXX'."

	((paramsDict includesKey: #lat) and: [ paramsDict includesKey: #lon ])
		ifFalse: [ ^ self error: 'Missing required parameters' ]
		ifTrue: [ 
			^ self
				  buildCallURL: 'https://api.openweathermap.org/data/3.0/onecall'
				  with: paramsDict ]
]

{ #category : #private }
OpenWeatherMapClient >> urlParametersOn: ws with: paramsDict [

	ws
		nextPutAll: 'appid=';
		nextPutAll: key.
	paramsDict keysAndValuesDo: [ :k :v | 
		ws
			nextPut: $&;
			nextPutAll: k;
			nextPut: $=;
			nextPutAll: v ].
	^ ws contents
]
