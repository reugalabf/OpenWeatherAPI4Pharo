Class {
	#name : #OpenWeatherBulkDailyAggregator,
	#superclass : #Object,
	#instVars : [
		'aggregation',
		'mappings'
	],
	#category : #'OpenWeatherMap-Client'
}

{ #category : #'instance creation' }
OpenWeatherBulkDailyAggregator class >> forRain: bulkCollection [

	^ self new aggregateRain: bulkCollection
]

{ #category : #'instance creation' }
OpenWeatherBulkDailyAggregator class >> forRainCSV: bulkCollection [

	^ self new aggregateRainCSV: bulkCollection
]

{ #category : #'instance creation' }
OpenWeatherBulkDailyAggregator class >> forSnow: bulkCollection [

	^ self new aggregateSnow: bulkCollection
]

{ #category : #'instance creation' }
OpenWeatherBulkDailyAggregator class >> forSnowCSV: bulkCollection [

	^ self new aggregateSnowCSV: bulkCollection
]

{ #category : #api }
OpenWeatherBulkDailyAggregator >> addRain1h [

	mappings at: #rain1h put: self sumAggregationBlock 
]

{ #category : #api }
OpenWeatherBulkDailyAggregator >> addSnow1h [

	mappings at: #snow1h put: self sumAggregationBlock
]

{ #category : #api }
OpenWeatherBulkDailyAggregator >> addTemperature [

	mappings at: #temperature put: self averageAggregationBlock
]

{ #category : #api }
OpenWeatherBulkDailyAggregator >> addWeatherDescription [

	mappings at: #weatherDescription put: self collateAggregationBlock 
]

{ #category : #api }
OpenWeatherBulkDailyAggregator >> aggregate: bulkCollection [

	| result key |
	bulkCollection do: [ :each | 
		key := each dateAndTime asDate.
		self applyMappingsTo: each key: key ].
	result := SortedCollection sortBlock: [ :a :b | a key < b key ].
	aggregation associationsDo: [ :each | result add: each ].


	^ result
]

{ #category : #api }
OpenWeatherBulkDailyAggregator >> aggregate: bulkCollection do: aBlock [

	(self aggregate: bulkCollection) do: aBlock
]

{ #category : #'api - export' }
OpenWeatherBulkDailyAggregator >> aggregateCSV: bulkCollection [

	^ String streamContents: [ :stream | 
		  | writer |
		  writer := NeoCSVWriter on: stream.
		  writer nextPut: self csvHeader. "#( date rain )"
		  writer addObjectFields: #( key ).
		  self configureCSVFieldsOn: writer.
		  writer nextPutAll: (self aggregate: bulkCollection) ]
]

{ #category : #'api - export' }
OpenWeatherBulkDailyAggregator >> aggregateCSV: bulkCollection on: fileRef [

	^ fileRef writeStreamDo: [ :stream | 
		  | writer |
		  writer := NeoCSVWriter on: stream.
		  writer nextPut: self csvHeader. "#( date rain )"
		  writer addObjectFields: #( key ).
		  self configureCSVFieldsOn: writer.
		  writer nextPutAll: (self aggregate: bulkCollection) ]
]

{ #category : #private }
OpenWeatherBulkDailyAggregator >> applyMappingsTo: row key: key [

	| result |
	result := Dictionary new.
	mappings keysAndValuesDo: [ :k :map | 
		aggregation
			at: key
			ifPresent: [ :v | 
			aggregation at: key put: (map value: row value: v value: k) ]
			ifAbsent: [ 
				aggregation
					at: key
					put: (map value: row value: Dictionary new value: k) ] ]
]

{ #category : #private }
OpenWeatherBulkDailyAggregator >> averageAggregationBlock [

	^ [ :bulk :outReg :key | 
	  | value |
	  value := bulk perform: key.
	  outReg
		  at: key
		  ifPresent: [ :v | 
			  outReg at: key put: (v
					   at: 1 put: (v at: 1) + value;
					   at: 2 put: (v at: 2) + 1;
					   yourself) ]
		  ifAbsent: [ 
			  outReg at: key put: { 
					  value.
					  1 } ].
	  outReg ]
]

{ #category : #private }
OpenWeatherBulkDailyAggregator >> collateAggregationBlock [

	^ [ :bulk :outReg :key | 
	  | value |
	  value := bulk perform: key.
	  outReg
		  at: key
		  ifPresent: [ :v | outReg at: key put: v , ' ' , value ]
		  ifAbsent: [ outReg at: key put: value ].
	  outReg ]
]

{ #category : #private }
OpenWeatherBulkDailyAggregator >> configureCSVFieldsOn: writer [

	mappings keysDo: [ :k | 
		writer addObjectField: [ :dict | 
			| obj |
			obj := dict value at: k asSymbol.
			obj isArray
				ifTrue: [ (obj first / obj second) asFloat ]
				ifFalse: [ obj ] ] ]
]

{ #category : #private }
OpenWeatherBulkDailyAggregator >> csvHeader [

	| header |
	header := OrderedCollection with: 'key'.
	header addAll: mappings keys.
	^ header
]

{ #category : #initialization }
OpenWeatherBulkDailyAggregator >> initialize [

	aggregation := Dictionary new.
	mappings := Dictionary new

]

{ #category : #private }
OpenWeatherBulkDailyAggregator >> sumAggregationBlock [
^[ :bulk :outReg :key | 
		| value |
		value := bulk perform: key.
		outReg
			at: key
			ifPresent: [ :v | outReg at: key put: value + v ]
			ifAbsent: [ outReg at: key put: value ].
		outReg ]
]
