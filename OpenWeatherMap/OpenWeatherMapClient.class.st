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
	ws contents
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

	^ ZnEasy get: (self currentWeatherCallWith: paramsDict)
]

{ #category : #initialization }
OpenWeatherMapClient >> initializeSettings: aDictionary [

	(aDictionary includesKey: #key)
		ifTrue: [ key := aDictionary at: #key ]
		ifFalse: [ self error: 'Incomplete settings' ]
]

{ #category : #api }
OpenWeatherMapClient >> oneCallFor: paramsDict [

	^ ZnEasy get: (self oneCallWith: paramsDict)
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
			nextPutAll: v ]
]
