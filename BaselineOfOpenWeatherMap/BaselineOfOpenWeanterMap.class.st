Class {
	#name : #BaselineOfOpenWeanterMap,
	#superclass : #BaselineOf,
	#category : #BaselineOfOpenWeatherMap
}

{ #category : #baselines }
BaselineOfOpenWeanterMap >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			package: #OpenWeatherMap
			with: [ spec requires: #( 'NeoJSON' #NeoCSV ) ];
			package: #'OpenWeatherMap-Tests'
			with: [ spec requires: #( 'OpenWeatherMap' ) ].
		spec
			group: 'default'
			with: #( 'OpenWeatherMap' 'OpenWeatherMap-Tests' ) ]
]
