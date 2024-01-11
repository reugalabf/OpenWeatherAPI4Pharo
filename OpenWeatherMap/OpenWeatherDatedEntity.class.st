Class {
	#name : #OpenWeatherDatedEntity,
	#superclass : #Object,
	#traits : 'DataTimeConversor',
	#classTraits : 'DataTimeConversor classTrait',
	#instVars : [
		'dt',
		'timezone'
	],
	#category : #'OpenWeatherMap-Entities'
}

{ #category : #accessing }
OpenWeatherDatedEntity >> dt [

	^ dt
]

{ #category : #accessing }
OpenWeatherDatedEntity >> dt_iso [

	^ (DateAndTime fromUnixTime: self dt) printString
]

{ #category : #accessing }
OpenWeatherDatedEntity >> timezone [

	^ timezone ifNil: [ timezone := 0 ] ifNotNil: [ timezone ]
]
