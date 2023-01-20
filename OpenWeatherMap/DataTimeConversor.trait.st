Trait {
	#name : #DataTimeConversor,
	#category : #'OpenWeatherMap-Client'
}

{ #category : #enumerating }
DataTimeConversor >> date [

	^ (DateAndTime fromUnixTime: self dt) asDate
]

{ #category : #enumerating }
DataTimeConversor >> dateAndTime [

	^ DateAndTime fromString: self dt_iso " fromUnixTime: self dt"
]
