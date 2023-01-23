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
			package: #OpenWeatherMap with: [ 
				spec
					repository: 'https://github.com/svenvc/NeoJSON.git';
					repository: 'https://github.com/svenvc/NeoCSV.git';
					yourself ];
			package: #'OpenWeatherMap-Tests'
			with: [ spec requires: #( 'OpenWeatherMap' ) ].
		spec
			group: 'Core' with: #( 'OpenWeatherMap' );
			group: 'Tests	' with: #( 'OpenWeatherMap-Tests' );
			group: 'default' with: #( 'Core' 'Tests' ) ]
]

{ #category : #accessing }
BaselineOfOpenWeanterMap >> projectClass [
	^ 	MetacelloCypressBaselineProject
]
