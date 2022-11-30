Trait {
	#name : #DataTimeConversor,
	#category : #OpenWeatherMap
}

{ #category : #enumerating }
DataTimeConversor >> dateAndTimes [

	^ DateAndTime fromUnixTime: self dt
]
