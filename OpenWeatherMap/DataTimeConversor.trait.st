Trait {
	#name : #DataTimeConversor,
	#category : #'OpenWeatherMap-Client'
}

{ #category : #enumerating }
DataTimeConversor >> dateAndTimes [

	^ DateAndTime fromUnixTime: self dt
]
