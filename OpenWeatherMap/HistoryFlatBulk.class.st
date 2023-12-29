Class {
	#name : #HistoryFlatBulk,
	#superclass : #Object,
	#traits : 'DataTimeConversor',
	#classTraits : 'DataTimeConversor classTrait',
	#instVars : [
		'lon',
		'temp_max',
		'snow_3h',
		'weather_icon',
		'grnd_level',
		'dew_point',
		'pressure',
		'rain_1h',
		'visibility',
		'temp_min',
		'wind_gust',
		'weather_main',
		'lat',
		'feels_like',
		'wind_deg',
		'rain_3h',
		'temp',
		'city_name',
		'wind_speed',
		'weather_id',
		'timezone',
		'humidity',
		'dt_iso',
		'dt',
		'clouds_all',
		'weather_description',
		'snow_1h',
		'sea_level'
	],
	#category : #'OpenWeatherMap-Entities'
}

{ #category : #accessing }
HistoryFlatBulk class >> neoJsonMapping: mapper [

	mapper for: self do: [ :mapping | mapping mapAllInstVars ]
]

{ #category : #accessing }
HistoryFlatBulk >> city_name [

	^ city_name
]

{ #category : #accessing }
HistoryFlatBulk >> city_name: anObject [

	city_name := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> clouds_all [

	^ clouds_all
]

{ #category : #accessing }
HistoryFlatBulk >> clouds_all: anObject [

	clouds_all := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> dew_point [

	^ dew_point
]

{ #category : #accessing }
HistoryFlatBulk >> dew_point: anObject [

	dew_point := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> dt [

	^ dt
]

{ #category : #accessing }
HistoryFlatBulk >> dt: anObject [

	dt := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> dt_iso [

	^ dt_iso
]

{ #category : #accessing }
HistoryFlatBulk >> dt_iso: anObject [

	dt_iso := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> feels_like [

	^ feels_like
]

{ #category : #accessing }
HistoryFlatBulk >> feels_like: anObject [

	feels_like := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> grnd_level [

	^ grnd_level
]

{ #category : #accessing }
HistoryFlatBulk >> grnd_level: anObject [

	grnd_level := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> humidity [

	^ humidity
]

{ #category : #accessing }
HistoryFlatBulk >> humidity: anObject [

	humidity := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> lat [

	^ lat
]

{ #category : #accessing }
HistoryFlatBulk >> lat: anObject [

	lat := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> lon [

	^ lon
]

{ #category : #accessing }
HistoryFlatBulk >> lon: anObject [

	lon := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> pressure [

	^ pressure
]

{ #category : #accessing }
HistoryFlatBulk >> pressure: anObject [

	pressure := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> rain_1h [

	^ rain_1h
]

{ #category : #accessing }
HistoryFlatBulk >> rain_1h: anObject [

	rain_1h := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> rain_3h [

	^ rain_3h
]

{ #category : #accessing }
HistoryFlatBulk >> rain_3h: anObject [

	rain_3h := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> sea_level [

	^ sea_level
]

{ #category : #accessing }
HistoryFlatBulk >> sea_level: anObject [

	sea_level := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> snow_1h [

	^ snow_1h
]

{ #category : #accessing }
HistoryFlatBulk >> snow_1h: anObject [

	snow_1h := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> snow_3h [

	^ snow_3h
]

{ #category : #accessing }
HistoryFlatBulk >> snow_3h: anObject [

	snow_3h := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> temp [

	^ temp
]

{ #category : #accessing }
HistoryFlatBulk >> temp: anObject [

	temp := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> temp_max [

	^ temp_max
]

{ #category : #accessing }
HistoryFlatBulk >> temp_max: anObject [

	temp_max := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> temp_min [

	^ temp_min
]

{ #category : #accessing }
HistoryFlatBulk >> temp_min: anObject [

	temp_min := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> timezone [

	^ timezone
]

{ #category : #accessing }
HistoryFlatBulk >> timezone: anObject [

	timezone := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> visibility [

	^ visibility
]

{ #category : #accessing }
HistoryFlatBulk >> visibility: anObject [

	visibility := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> weather_description [

	^ weather_description
]

{ #category : #accessing }
HistoryFlatBulk >> weather_description: anObject [

	weather_description := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> weather_icon [

	^ weather_icon
]

{ #category : #accessing }
HistoryFlatBulk >> weather_icon: anObject [

	weather_icon := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> weather_id [

	^ weather_id
]

{ #category : #accessing }
HistoryFlatBulk >> weather_id: anObject [

	weather_id := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> weather_main [

	^ weather_main
]

{ #category : #accessing }
HistoryFlatBulk >> weather_main: anObject [

	weather_main := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> wind_deg [

	^ wind_deg
]

{ #category : #accessing }
HistoryFlatBulk >> wind_deg: anObject [

	wind_deg := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> wind_gust [

	^ wind_gust
]

{ #category : #accessing }
HistoryFlatBulk >> wind_gust: anObject [

	wind_gust := anObject
]

{ #category : #accessing }
HistoryFlatBulk >> wind_speed [

	^ wind_speed
]

{ #category : #accessing }
HistoryFlatBulk >> wind_speed: anObject [

	wind_speed := anObject
]
