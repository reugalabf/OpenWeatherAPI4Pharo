Class {
	#name : #BaselineOfOpenWeatherMap,
	#superclass : #BaselineOf,
	#category : #BaselineOfOpenWeatherMap
}

{ #category : #baselines }
BaselineOfOpenWeatherMap >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		self neoBaselines: spec.
		spec
			package: #OpenWeatherMap
			with: [ spec requires: #( 'NeoJSON' 'NeoCSV' ) ];
			package: #'OpenWeatherMap-Tests'
			with: [ spec requires: #( 'OpenWeatherMap' ) ].
		spec
			group: 'Core' with: #( 'OpenWeatherMap' );
			group: 'Tests	' with: #( 'OpenWeatherMap-Tests' );
			group: 'default' with: #( 'Core' 'Tests' ) ]
]

{ #category : #baselines }
BaselineOfOpenWeatherMap >> neoBaselines: spec [

	spec
		baseline: 'NeoJSON'
		with: [ spec loads: 'github://svenvc/NeoJSON/repository' ].

	spec
		baseline: 'NeoCSV'
		with: [ spec loads: 'github://svenvc/NeoCSV/repository' ]
]

{ #category : #accessing }
BaselineOfOpenWeatherMap >> projectClass [
	^ 	MetacelloCypressBaselineProject
]
