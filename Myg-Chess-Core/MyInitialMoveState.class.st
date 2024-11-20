Class {
	#name : 'MyInitialMoveState',
	#superclass : 'MyPawnState',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyInitialMoveState >> diagonalPawnCaptures: aPawn [

	| leftCapture rightCapture captureSquares |
	"Calcul des cases diagonales pour les captures"
	leftCapture := aPawn isWhite
		               ifTrue: [ aPawn square up left ]
		               ifFalse: [ aPawn square down left ].

	rightCapture := aPawn isWhite
		                ifTrue: [ aPawn square up right ]
		                ifFalse: [ aPawn square down right ].

	"Filtrer les cases qui contiennent une pièce de couleur opposée"
	captureSquares := OrderedCollection new.

	leftCapture notNil ifTrue: [
		(leftCapture hasPiece and: [
			 leftCapture contents color ~= MyPiece color ]) ifTrue: [
			captureSquares add: leftCapture ] ].

	rightCapture notNil ifTrue: [
		(rightCapture hasPiece and: [
			 rightCapture contents color ~= MyPiece color ]) ifTrue: [
			captureSquares add: rightCapture ] ].

	^ captureSquares
]

{ #category : 'as yet unclassified' }
MyInitialMoveState >> moveTo: aSquare for: aPawn [
    "Déplace le pion sur une nouvelle case et met à jour son état."
aPawn square emptyContents.
	aPawn square: aSquare.
    aSquare contents: aPawn .
	aPawn state: MyStandardMoveState new.
    
]

{ #category : 'rendering' }
MyInitialMoveState >> targetSquaresLegal: aPawn [

	| singleStepSquare doubleStepSquare  |
	
	singleStepSquare := aPawn  isWhite
		             ifTrue: [ aPawn square up ]
		             ifFalse: [ aPawn square down ].

	doubleStepSquare := aPawn isWhite
		             ifTrue: [aPawn square up up ]
		             ifFalse: [ aPawn square down down ].
		
		


	^  { singleStepSquare} , { doubleStepSquare } select: [ :s |
		  s notNil and: [ s hasPiece not or: [ s contents color ~= MyPiece color ] ] ]
        

]
