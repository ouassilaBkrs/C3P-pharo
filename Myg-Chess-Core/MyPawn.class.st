Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#instVars : [
		'hasMoved'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyPawn >> diagonalCaptures: aBoolean [
	" si couleur est diff de self et regard ele contenu de la diagonle , ajoute a liste target des pions que tu peux manger  square up left et square up righ"
	|captureSquares|
	
 captureSquares := OrderedCollection new.
    self isWhite
        ifTrue: [
            captureSquares add: (square up left).
            captureSquares add: (square up right).
        ]
        ifFalse: [
            captureSquares add: (square down left).
            captureSquares add: (square down right).
        ].
    ^ captureSquares
]

{ #category : 'as yet unclassified' }
MyPawn >> diagonalPawnCaptures [

	| leftCapture rightCapture captureSquares |
	"Calcul des cases diagonales pour les captures"
	leftCapture := self isWhite
		               ifTrue: [ square up left ]
		               ifFalse: [ square down left ].

	rightCapture := self isWhite
		                ifTrue: [ square up right ]
		                ifFalse: [ square down right ].

	"Filtrer les cases qui contiennent une pièce de couleur opposée"
	captureSquares := OrderedCollection new.
	
	leftCapture notNil ifTrue: [
		(leftCapture hasPiece and: [ leftCapture contents color ~= color ])
			ifTrue: [ captureSquares add: leftCapture ] ].

	rightCapture notNil ifTrue: [
		(rightCapture hasPiece and: [ rightCapture contents color ~= color ])
			ifTrue: [ captureSquares add: rightCapture ] ].

	^ captureSquares
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'initialization' }
MyPawn >> initialize [ 
    super initialize.
    hasMoved := false.
]

{ #category : 'testing' }
MyPawn >> isFirstMove [ 

"Transcript show: self square file;cr."

  ^ (self isWhite 
			ifTrue: [self square file = $2] 
			ifFalse: [self square file = $7])


]

{ #category : 'path commands' }
MyPawn >> moveTo: aSquare [ 
    "Déplace le pion sur une nouvelle case et met à jour son état."
    super moveTo: aSquare.
    aSquare contents: self.
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'initialization' }
MyPawn >> setPosition: aSquare [ 
        square := aSquare.
    
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	| singleStepSquare doubleStepSquare potentialSquares |
	singleStepSquare := self isWhite
		             ifTrue: [ square up ]
		             ifFalse: [ square down ].

	doubleStepSquare := self isWhite
		             ifTrue: [ square up up ]
		             ifFalse: [ square down down ].

	potentialSquares := (self isFirstMove and: [ doubleStepSquare hasPiece not ])
		                    ifTrue: [ { singleStepSquare} , { doubleStepSquare } ]
		                    ifFalse: [ { singleStepSquare } ]. " a mettre dans le return "

	^ potentialSquares select: [ :s |
		  s notNil and: [ s hasPiece not or: [ s contents color ~= color ] ] ]
]
