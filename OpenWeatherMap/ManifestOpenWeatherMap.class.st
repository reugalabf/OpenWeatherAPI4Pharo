"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestOpenWeatherMap,
	#superclass : #PackageManifest,
	#category : #'OpenWeatherMap-Manifest'
}

{ #category : #'code-critics' }
ManifestOpenWeatherMap class >> ruleBadMessageRule2V1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#OpenWeatherBulkDailyAggregator #sumAggregationBlock #false)) #'2023-01-20T16:30:42.119467-03:00') #(#(#RGMethodDefinition #(#OpenWeatherBulkDailyAggregator #averageAggregationBlock #false)) #'2023-01-20T16:31:23.74512-03:00') #(#(#RGMethodDefinition #(#OpenWeatherBulkDailyAggregator #collateAggregationBlock #false)) #'2023-01-20T16:32:09.687527-03:00') )
]
