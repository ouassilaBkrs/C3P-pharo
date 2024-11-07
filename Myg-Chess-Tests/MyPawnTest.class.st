Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testBlackPawnFirstMove [

	| pawn squares board1 expectedSquares |
	board1 := MyChessBoard empty.
	board1 at: 'f7' put: (pawn := MyPawn black).
	squares := pawn targetSquaresLegal: true.

	expectedSquares := OrderedCollection new.
	expectedSquares add: (board1 at: 'f6').
	self assert: squares asSet equals: expectedSquares asSet
]

{ #category : 'tests' }
MyPawnTest >> testMoves [

	| pawn squares board1 expectedSquares |
	board1 := MyChessBoard empty.
	board1 at: 'e2' put: (pawn := MyPawn white).
	squares := pawn targetSquaresLegal: true.

	expectedSquares := OrderedCollection new.
	expectedSquares add: (board1 at: 'e3').
	self assert: squares asSet equals: expectedSquares asSet
]

{ #category : 'tests' }
MyPawnTest >> testMovesDoubleStep [

	| pawn board expectedSquares squares |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).
	squares := pawn targetSquaresLegal: true.


	expectedSquares := OrderedCollection new.
	expectedSquares add: (board at: 'e4').
	"expectedSquares add: (board at: 'e4')."

	self assert: squares asSet equals: expectedSquares asSet.
	"board movePieceFrom: 'e2' to: 'e3'."

	"Vérifier que le double-step n'est plus autorisé"
	"squares := pawn targetSquaresLegal: true.
	expectedSquares := OrderedCollection with: (board at: 'e4'). Seulement un pas en avant autorisé maintenant"

	self assert: squares asSet equals: expectedSquares asSet
]

{ #category : 'tests' }
MyPawnTest >> testWhiteFirstStep [

	| pawn squares board1 expectedSquares |
	board1 := MyChessBoard empty.
	board1 at: 'e2' put: (pawn := MyPawn white).
	squares := pawn targetSquaresLegal: true.

	expectedSquares := OrderedCollection new.
	expectedSquares add: (board1 at: 'e3').
	self assert: squares asSet equals: expectedSquares asSet
]
