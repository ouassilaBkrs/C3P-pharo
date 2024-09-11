Class {
	#name : 'ConvertisseurFahrenheitTest',
	#superclass : 'TestCase',
	#instVars : [
		'celcius'
	],
	#category : 'MyConvertiseur',
	#package : 'MyConvertiseur'
}

{ #category : 'as yet unclassified' }
ConvertisseurFahrenheitTest >> testConvertToFahrenheit [
| c |
c  := ConvertiseurFahrenheit new.
c celcius: 20.
self assert: c  convertToFahrenheit equals: 68
]
