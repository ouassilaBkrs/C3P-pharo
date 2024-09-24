Class {
	#name : 'RectangleBis',
	#superclass : 'Object',
	#instVars : [
		'width',
		'height'
	],
	#classInstVars : [
		'height',
		'width'
	],
	#category : 'MyRectangle',
	#package : 'MyRectangle'
}

{ #category : 'as yet unclassified' }
RectangleBis class >> createwithAWidth: aWidth  height: aHeight [ 

^self new 
width: aWidth;
height: aHeight;
yourself
]

{ #category : 'api' }
RectangleBis >> display [ 
^ 'Un rectangle de largeur: ', self width asString,' et de longueur: ', self height asString 
]

{ #category : 'accessing' }
RectangleBis >> height [

^height
]

{ #category : 'accessing' }
RectangleBis >> height: aHeight [

height := aHeight 
]

{ #category : 'accessing' }
RectangleBis >> width [ 

^width 
]

{ #category : 'accessing' }
RectangleBis >> width: aWidth [

width := aWidth 
]
