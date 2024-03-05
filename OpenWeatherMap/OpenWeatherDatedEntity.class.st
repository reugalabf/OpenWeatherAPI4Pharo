Class {
	#name : #OpenWeatherDatedEntity,
	#superclass : #Object,
	#traits : 'DataTimeConversor',
	#classTraits : 'DataTimeConversor classTrait',
	#instVars : [
		'dt',
		'timezone',
		'dt_iso'
	],
	#category : #'OpenWeatherMap-Entities'
}

{ #category : #enumerating }
OpenWeatherDatedEntity >> dateAndTime [

	"
	^ (DateAndTime fromString: self dt_iso) offset: self timezone"

	^ self dt_iso offset: self timezone
]

{ #category : #accessing }
OpenWeatherDatedEntity >> dt [

	^ dt
]

{ #category : #accessing }
OpenWeatherDatedEntity >> dt_iso [

	^ dt_iso
		  ifNil: [ (DateAndTime fromUnixTime: self dt) printString ]
		  ifNotNil: [ DateAndTime fromString: dt_iso ]
]

{ #category : #accessing }
OpenWeatherDatedEntity >> initialize [

	timezone := 0.
	^self
]

{ #category : #accessing }
OpenWeatherDatedEntity >> timezone [

	^ timezone isNumber
		  ifFalse: [ timezone := Integer readFromString: timezone ]
		  ifTrue: [ timezone ]
]
