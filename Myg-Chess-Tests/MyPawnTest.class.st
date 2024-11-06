Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testMoves [

	| pawn squares board expectedSquares |
	board := MyChessBoard empty.
	board at: 'd6' put: (pawn := MyPawn white).
	squares := pawn targetSquaresLegal: true.

	
	expectedSquares := OrderedCollection new.
	expectedSquares add: (board at: 'd7'). 
	expectedSquares add: (board at: 'c7').
	expectedSquares add: (board at: 'e7').
	self assert: squares asSet equals: expectedSquares asSet
]

{ #category : 'tests' }
MyPawnTest >> testMovesDoubleStep [

    | pawn board expectedSquares squares |
    board := MyChessBoard empty.
    board at: 'e2' put: (pawn := MyPawn white).
    squares := pawn targetSquaresLegal: true.


    expectedSquares := OrderedCollection new.
    expectedSquares add: (board at: 'e3'). 
    expectedSquares add: (board at: 'e4'). 
    
    self assert: squares asSet equals: expectedSquares asSet.
    board movePieceFrom: 'e2' to: 'e3'.

    "Vérifier que le double-step n'est plus autorisé"
    squares := pawn targetSquaresLegal: true.
    expectedSquares := OrderedCollection with: (board at: 'e4'). "Seulement un pas en avant autorisé maintenant"
    
    self assert: squares asSet equals: expectedSquares asSet.

]
