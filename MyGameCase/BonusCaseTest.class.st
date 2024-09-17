Class {
	#name : 'BonusCaseTest',
	#superclass : 'GameCaseTest',
	#category : 'MyGameCase',
	#package : 'MyGameCase'
}

{ #category : 'tests' }
BonusCaseTest >> testAddPoints [
| p |
p  := BonusCase new.
p points: 2.
p addPoints.
self assert: p points  equals: 52
]
