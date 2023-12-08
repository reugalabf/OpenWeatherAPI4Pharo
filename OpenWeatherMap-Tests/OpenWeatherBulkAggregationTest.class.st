Class {
	#name : #OpenWeatherBulkAggregationTest,
	#superclass : #TestCase,
	#instVars : [
		'bulkDataset',
		'aggregator'
	],
	#category : #'OpenWeatherMap-Tests'
}

{ #category : #running }
OpenWeatherBulkAggregationTest >> jsonRegisters [

	^ '[{"dt":1577836800,"dt_iso":"2020-01-01 00:00:00 +0000 UTC","timezone":12600,"main":{"temp":2.07,"temp_min":1.65,"temp_max":2.52,"feels_like":-0.74,"pressure":1015,"humidity":85,"dew_point":-0.16},"clouds":{"all":0},"rain":{"1h":0.2},"weather":[{"id":701,"main":"Mist","description":"mist","icon":"50n"}],"visibility":3200,"wind":{"speed":2.68,"deg":300},"city_name":"Custom location","lon":51.431379,"lat":35.684455},{"dt":1577840400,"dt_iso":"2020-01-01 01:00:00 +0000 UTC","timezone":12600,"main":{"temp":1.39,"temp_min":0.94,"temp_max":1.65,"feels_like":-1.91,"pressure":1013,"humidity":93,"dew_point":0.38},"clouds":{"all":0},"weather":[{"id":701,"main":"Mist","description":"mist","icon":"50n"}],"visibility":3000,"wind":{"speed":3.1,"deg":290},"city_name":"Custom location","lon":51.431379,"lat":35.684455},{"dt":1577844000,"dt_iso":"2020-01-01 02:00:00 +0000 UTC","timezone":12600,"main":{"temp":2.01,"temp_min":0.94,"temp_max":2.32,"feels_like":-0.81,"pressure":1013,"humidity":86,"dew_point":-0.07},"clouds":{"all":0},"weather":[{"id":701,"main":"Mist","description":"mist","icon":"50n"}],"visibility":3800,"wind":{"speed":2.68,"deg":300},"city_name":"Custom location","lon":51.431379,"lat":35.684455, "rain":{"1h":0.2}},{"dt":1577847600,"dt_iso":"2020-01-01 03:00:00 +0000 UTC","timezone":12600,"main":{"temp":1.85,"temp_min":-0.06,"temp_max":2.14,"feels_like":-1.36,"pressure":1015,"humidity":82,"dew_point":-0.79},"rain":{"1h":0.2},"clouds":{"all":1},"weather":[{"id":701,"main":"Mist","description":"mist","icon":"50n"}],"visibility":4000,"wind":{"speed":3.1,"deg":300},"city_name":"Custom location","lon":51.431379,"lat":35.684455}]'
]

{ #category : #running }
OpenWeatherBulkAggregationTest >> setUp [

	
	super setUp.

	bulkDataset := (NeoJSONReader on: self jsonRegisters readStream)
		               for: #ArrayOfHistoryBulk
		               customDo: [ :mapping | 
			               mapping listOfElementSchema: HistoryBulk ];
		               nextAs: #ArrayOfHistoryBulk.
		
	aggregator := OpenWeatherBulkDailyAggregator new.
]

{ #category : #tests }
OpenWeatherBulkAggregationTest >> testAggregationDo [

	| agg result|
   result := 0.
	self assert: bulkDataset size equals: 4.
	aggregator addRain1h.
	aggregator aggregate: bulkDataset do:[:each| result := result + (each value at:#rain1h )].

"	self assert: agg notEmpty.
	self assert: agg value first value keys first equals: 'rain1h'
"	
self assert: (result round:2) equals: 0.6 
]

{ #category : #tests }
OpenWeatherBulkAggregationTest >> testAggregationDoTest [

	| agg result|
   result := 0.
	self assert: bulkDataset size equals: 4.
	aggregator addRain1h.
	aggregator aggregate: bulkDataset do:[:each| result := result + (each value at:#rain1h )].

"	self assert: agg notEmpty.
	self assert: agg value first value keys first equals: 'rain1h'
"	
self assert: (result round:2) equals: 0.6 
]

{ #category : #tests }
OpenWeatherBulkAggregationTest >> testMappingAggregationCSV [

	| csv records |
	self assert: bulkDataset size equals: 4.
	aggregator
		addAverageTemperature;
		addRain1h;
		addSnow1h;
		addWeatherDescription.
	csv := aggregator aggregateCSV: bulkDataset.


	self assert: csv notEmpty.
	records := (NeoCSVReader on: csv readStream) upToEnd.
	self assert: records size equals: 2.
	self
		assert: (records at: 1)
		equals:
		#( 'key' 'rain1h' 'snow1h' 'weatherDescription' 'temperature' )
]

{ #category : #tests }
OpenWeatherBulkAggregationTest >> testMaxTemperatureMappingAggregation [

	| agg |
	self assert: bulkDataset size equals: 4.
	aggregator
		addMaxTemperature;
		addRain1h;
		addSnow1h.
	agg := aggregator aggregate: bulkDataset.

	self assert: agg notEmpty.
	self assert: (agg value first value keys includes: 'temperature').
	self assert: (agg value first value at: 'temperature') equals: 2.07.

	self assert: (agg value first value keys includes: 'rain1h').
	self assert: (agg value first value keys includes: 'snow1h')
]

{ #category : #tests }
OpenWeatherBulkAggregationTest >> testRainMappingAggregation [

	| agg |
	self assert: bulkDataset size equals: 4.
	aggregator addRain1h.
	agg := aggregator aggregate: bulkDataset.
	agg inspect.
	self assert: agg notEmpty.
	self assert: agg value first value keys first equals: 'rain1h'
]

{ #category : #tests }
OpenWeatherBulkAggregationTest >> testSnowMappingAggregation [

	| agg |
	self assert: bulkDataset size equals: 4.
	aggregator addSnow1h.
	agg := aggregator aggregate: bulkDataset.
	self assert: agg notEmpty.
	self assert: agg value first value keys first equals: 'snow1h'
]

{ #category : #tests }
OpenWeatherBulkAggregationTest >> testSnowRainMappingAggregation [

	| agg |
	self assert: bulkDataset size equals: 4.
	aggregator addSnow1h.
	aggregator addRain1h.
	agg := aggregator aggregate: bulkDataset.
	
	self assert: agg notEmpty.
	self assert: agg value first value keys first equals: 'snow1h'.
	self assert: agg value first value keys last equals: 'rain1h'
]

{ #category : #tests }
OpenWeatherBulkAggregationTest >> testTemperatureMappingAggregation [

	| agg |
	self assert: bulkDataset size equals: 4.
	aggregator
		addAverageTemperature;
		addRain1h;
		addSnow1h.
	agg := aggregator aggregate: bulkDataset.
	
	self assert: agg notEmpty.
	self assert: (agg value first value keys includes: 'temperature').

	self assert: (agg value first value keys includes: 'rain1h').
	self assert: (agg value first value keys includes: 'snow1h')
]
