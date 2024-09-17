Class {
	#name : 'NormalCaseTest',
	#superclass : 'GameCaseTest',
	#category : 'MyGameCase',
	#package : 'MyGameCase'
}

{ #category : 'tests' }
NormalCaseTest >> testAddPoints [
| p |
p  := NormalCase new.
p points: 2.
p addPoints.
self assert: p points  equals: 3
]
