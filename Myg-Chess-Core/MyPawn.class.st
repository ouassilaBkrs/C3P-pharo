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
    | legalMoves direction |
    legalMoves := OrderedCollection new.
    direction := self isWhite ifTrue: [ 1 ] ifFalse: [ -1 ].

    { self square left. self square right } do: [ :captureSquare |
        captureSquare ifNotNil: [
            captureSquare up: direction ifAbsent: [] do: [ :target |
                (target hasPiece and: [ target contents color ~= self color ]) ifTrue: [
                    legalMoves add: target ] ] ] ].
    
    ^ legalMoves


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

    | fowardOne fowardTwo potentialSquares |
    
    fowardOne := self isWhite
                    ifTrue: [ square up ]
                    ifFalse: [ square down ].
                    
    fowardTwo := self isWhite
                    ifTrue: [ square up up ]
                    ifFalse: [ square down down ].

    potentialSquares := (self isFirstMove and: [ fowardTwo hasPiece not ] )   " a mettre dans le return "
        ifTrue: [ { fowardTwo }, {fowardOne } ]
        ifFalse: [ { fowardOne } ].

    ^ potentialSquares select: [ :s | 
        s notNil and: [ 
            (s hasPiece not or: [ s contents color ~= color ])
        ]
    ].
]
