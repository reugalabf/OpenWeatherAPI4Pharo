"
|jsonFile|
jsonFile:='historyBulk.json' asFileReference.


(NeoJSONReader on: jsonFile readStream )
for: #ArrayOfHistoryBulk
customDo: [ :mapping | mapping listOfElementSchema: HistoryBulk ];
nextAs: #ArrayOfHistoryBulk


JSON's fields

city_name City name
lat Geographical coordinates of the location (latitude)
lon Geographical coordinates of the location (longitude)
main
main.temp Temperature
main.temp_min Minimum temperature at the moment. This is deviation from temperature that is possible for large cities and megalopolises geographically expanded (use these parameter optionally).
main.temp_max Maximum temperature at the moment. This is deviation from temperature that is possible for large cities and megalopolises geographically expanded (use these parameter optionally).
main.feels_like This temperature parameter accounts for the human perception of weather
main.pressure Atmospheric pressure (on the sea level), hPa
main.humidity Humidity, %
main.dew_point Atmospheric temperature (varying according to pressure and humidity) below which water droplets begin to condense and dew can form. Units – default: kelvin
wind
wind.speed Wind speed. Units – default: meter/sec
wind.deg Wind direction, degrees (meteorological)
wind.gust Wind gust. Units – default: meter/sec
clouds
clouds.all Cloudiness, %
rain
rain.1h Rain volume for the last hour, mm
rain.3h Rain volume for the last 3 hours, mm
snow
snow.1h Snow volume for the last hour, mm (in liquid state)
snow.3h Snow volume for the last 3 hours, mm (in liquid state)
weather (more info Weather condition codes)
weather.id Weather condition id
weather.main Group of weather parameters (Rain, Snow, Extreme etc.)
weather.description Weather condition within the group
weather.icon Weather icon id
visibility Average visibility, metres. The maximum value of the visibility is 10km
dt Time of data calculation, unix, UTC
dt_iso Date and time in UTC format
timezone Shift in seconds from UTC

"
Class {
	#name : #HistoryBulk,
	#superclass : #OpenWeatherDatedEntity,
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
		'visibility'
	],
	#category : #'OpenWeatherMap-Entities'
}

{ #category : #accessing }
HistoryBulk class >> neoJsonMapping: mapper [

	mapper for: self do: [ :mapping | mapping mapAllInstVars ]
]

{ #category : #accessing }
HistoryBulk >> rain [

	^ rain
]

{ #category : #accessing }
HistoryBulk >> rain1h [

	^ rain ifNil: [ 0 ] ifNotNil: [ :obj| obj at:'1h' ] 
]

{ #category : #accessing }
HistoryBulk >> snow [

	^ snow
]

{ #category : #accessing }
HistoryBulk >> snow1h [

	^ snow ifNil: [ 0 ] ifNotNil: [ :obj | obj at: '1h' ]
]

{ #category : #accessing }
HistoryBulk >> temperature [

	^ main at: #temp
]

{ #category : #accessing }
HistoryBulk >> weatherDescription [

	^ (weather at: 1) at: #description
]
