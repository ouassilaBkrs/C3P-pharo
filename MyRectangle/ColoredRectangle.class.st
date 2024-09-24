Class {
	#name : 'ColoredRectangle',
	#superclass : 'RectangleBis',
	#instVars : [
		'color'
	],
	#classInstVars : [
		'color'
	],
	#category : 'MyRectangle',
	#package : 'MyRectangle'
}

{ #category : 'as yet unclassified' }
ColoredRectangle class >> createwithAWidth: aWidth  height: aHeight color: aColor [

^self new 
width: aWidth;
height: aHeight;
color: aColor;
yourself 
]

{ #category : 'accessing' }
ColoredRectangle >> color [

^color
]

{ #category : 'accessing' }
ColoredRectangle >> color: aColor [

^color := aColor
]

{ #category : 'api' }
ColoredRectangle >> display [ 
|inst|

inst := super display.
inst initialize.
^inst, ', de couleur: ',  color.
]
