Class {
	#name : #OpenWeatherHistoryFlatBulkTest,
	#superclass : #TestCase,
	#category : #'OpenWeatherMap-Tests'
}

{ #category : #'as yet unclassified' }
OpenWeatherHistoryFlatBulkTest >> csvOneRecord [
^'dt,dt_iso,timezone,city_name,lat,lon,temp,visibility,dew_point,feels_like,temp_min,temp_max,pressure,sea_level,grnd_level,humidity,wind_speed,wind_deg,wind_gust,rain_1h,rain_3h,snow_1h,snow_3h,clouds_all,weather_id,weather_main,weather_description,weather_icon
1684800000,2023-05-23 00:00:00 +0000 UTC,-10800,Custom location,-34.946102,-57.956929,16.73,,16.57,17.04,16.64,18.95,1014,,,99,2.54,338,,0.28,,,,100,500,Rain,light rain,10n
'
]

{ #category : #tests }
OpenWeatherHistoryFlatBulkTest >> testCSVOneRecord [

	| converter string |
	converter := CSV2JSONStream source: self csvOneRecord readStream.
	string := converter nextAs: nil.
	self should: [ string notNil ]
]

{ #category : #tests }
OpenWeatherHistoryFlatBulkTest >> testCSVOneRecordAsDictionary [

	| converter dictionary |
	converter := CSV2JSONStream source: self csvOneRecord readStream.
	dictionary := converter nextAs: nil.
	self should: [ dictionary keys size = 28 ]
]

{ #category : #tests }
OpenWeatherHistoryFlatBulkTest >> testCSVOneRecordAsHistoryFlatBulk [

	| converter bulkEntry |
	converter := CSV2JSONStream source: self csvOneRecord readStream.
	bulkEntry := converter nextAs: HistoryFlatBulk.
	self should: [ 
		bulkEntry dateAndTime
		= (DateAndTime fromString: '2023-05-23 00:00:00 +0000 UTC') ]
]
