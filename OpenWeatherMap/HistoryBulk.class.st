"
|jsonFile|
jsonFile:='historyBulk.json' asFileReference.


(NeoJSONReader on: jsonFile readStream )
for: #ArrayOfHistoryBulk
customDo: [ :mapping | mapping listOfElementSchema: HistoryBulk ];
nextAs: #ArrayOfHistoryBulk
"
Class {
	#name : #HistoryBulk,
	#superclass : #Object,
	#traits : 'DataTimeConversor',
	#classTraits : 'DataTimeConversor classTrait',
	#instVars : [
		'city_name',
		'lat',
		'lon',
		'main',
		'wind',
		'clouds',
		'rain',
		'snow',
		'weather',
		'visibility',
		'dt',
		'dt_iso',
		'timezone'
	],
	#category : #'OpenWeatherMap-Entities'
}

{ #category : #accessing }
HistoryBulk class >> neoJsonMapping: mapper [

	mapper for: self do: [ :mapping | mapping mapAllInstVars ]
]
