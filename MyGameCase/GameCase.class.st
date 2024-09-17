Class {
	#name : 'GameCase',
	#superclass : 'Object',
	#instVars : [
		'points'
	],
	#category : 'MyGameCase',
	#package : 'MyGameCase'
}

{ #category : 'adding' }
GameCase >> addPoints [ 
]

{ #category : 'accessing' }
GameCase >> points [

^points 
]

{ #category : 'accessing' }
GameCase >> points: anInteger [ 

points := anInteger 
]
