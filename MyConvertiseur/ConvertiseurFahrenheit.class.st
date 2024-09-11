Class {
	#name : 'ConvertiseurFahrenheit',
	#superclass : 'Object',
	#instVars : [
		'celcius'
	],
	#category : 'MyConvertiseur',
	#package : 'MyConvertiseur'
}

{ #category : 'accessing' }
ConvertiseurFahrenheit >> celcius [ 

^celcius 

]

{ #category : 'accessing' }
ConvertiseurFahrenheit >> celcius: anInteger [ 

	celcius := anInteger 
]

{ #category : 'as yet unclassified' }
ConvertiseurFahrenheit >> convertToFahrenheit [

^  32 + ((9/5) * self celcius). 

 
]
