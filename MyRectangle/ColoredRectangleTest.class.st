Class {
	#name : 'ColoredRectangleTest',
	#superclass : 'RectangleBisTest',
	#category : 'MyRectangle',
	#package : 'MyRectangle'
}

{ #category : 'tests' }
ColoredRectangleTest >> testCreate [ 
|r|
r := ColoredRectangle  createwithAWidth: 12  height: 10 color: 'Red'.
self assert: r width equals: 12.
self assert: r height equals: 10.
self assert: r color equals: 'Red'

]

{ #category : 'tests' }
ColoredRectangleTest >> testDisplay [

	| r expectedres res |
	r:= ColoredRectangle  createwithAWidth: 12 height: 10 color: 'Red'.
	"r expectedWidth: r width."
	expectedres := 'Un rectangle de largeur: 12 et de longueur: 10 ,de couleur: Red'.
	res := r display.
	self assert: res equals: expectedres

]
