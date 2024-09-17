Class {
	#name : 'GoldenCaseTest',
	#superclass : 'GameCaseTest',
	#category : 'MyGameCase',
	#package : 'MyGameCase'
}

{ #category : 'tests' }
GoldenCaseTest >> testAddPoints [
| p |
p  := GoldenCase new.
p points: 2.
p addPoints.
self assert: p points  equals: 102
]
