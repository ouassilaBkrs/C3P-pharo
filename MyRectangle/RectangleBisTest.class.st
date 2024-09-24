Class {
	#name : 'RectangleBisTest',
	#superclass : 'TestCase',
	#category : 'MyRectangle',
	#package : 'MyRectangle'
}

{ #category : 'tests' }
RectangleBisTest >> testCreate [ 
|r|
r := RectangleBis  createwithAWidth: 12  height: 10.
self assert: r width equals: 12.
self assert: r height equals: 10 
]

{ #category : 'tests' }
RectangleBisTest >> testDisplay [

	| r expectedres res |
	r:= RectangleBis  createwithAWidth: 12 height: 10.
	"r expectedWidth: r width."
	expectedres := 'Un rectangle de largeur: 12 et de longueur: 10'.
	res := r display.
	self assert: res equals: expectedres


]
