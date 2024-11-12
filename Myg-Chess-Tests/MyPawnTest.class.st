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
MyPawnTest >> testBlackPawnMovesDoubleStep [

	| pawn board expectedSquares squares |
	board := MyChessBoard empty.
	board at: 'e7' put: (pawn := MyPawn black).
	squares := pawn targetSquaresLegal: true.
	expectedSquares := OrderedCollection new.
	expectedSquares add: (board at: 'e6').
	expectedSquares add: (board at: 'e5').
	self assert: squares asSet equals: expectedSquares asSet
	
]

{ #category : 'tests' }
MyPawnTest >> testCaptureSquares [ 
    | board whitePawn blackPawn whiteSquare blackSquare captureMoves allyPawn allySquare emptySquare |
    
    "Créer un plateau de jeu vide"
    board := MyChessBoard new.
    
    "Placer un pion blanc sur e5"
    whitePawn := MyPawn white.
    whiteSquare := board at: 'e5'.
    whitePawn square: whiteSquare.

    "Placer un pion noir sur d6 et f6"
    blackPawn := MyPawn black.
    blackSquare := board at: 'd6'.
    blackPawn square: blackSquare.

    "Vérifier les cases où le pion blanc peut capturer"
    captureMoves := whitePawn captureSquares.
    "Afficher les cases où le pion blanc peut capturer"
    captureMoves do: [ :square |
        Transcript show: 'Capture possible sur: ', square name; cr.
    ].
    "Vérifier que le pion blanc peut capturer sur d6 et f6"
    captureMoves shouldContain: (board at: 'd6'). "Capture diagonale gauche"
    captureMoves shouldContain: (board at: 'f6'). "Capture diagonale droite"

    "Placer un pion blanc sur d6 pour tester que le pion blanc ne peut pas capturer ses propres pièces"
    allyPawn := MyPawn white.
    allySquare := board at: 'd6'.
    allyPawn square: allySquare.
    
    "Vérifier que d6 n'est plus une case où le pion blanc peut capturer"
    captureMoves := whitePawn captureSquares.
    captureMoves shouldNotContain: allySquare. "La case d6 ne doit plus être une capture valide"

    "Placer une case vide pour tester les captures sur une case sans pièce ennemie"
    emptySquare := board at: 'e6'.
    
    "Vérifier que e6 n'est pas une case de capture valide"
    captureMoves := whitePawn captureSquares.
    captureMoves shouldNotContain: emptySquare. "La case e6 ne doit pas être une capture valide"
    
    "Tester pour un pion noir (capture diagonale vers le bas)"
    blackPawn := MyPawn black.
    blackSquare := board at: 'e4'.
    blackPawn square: blackSquare.
    captureMoves := blackPawn captureSquares.
    
    "Vérifier les captures possibles pour un pion noir"
    captureMoves do: [ :square |
        Transcript show: 'Capture possible sur: ', square name; cr.
    ].
    captureMoves shouldContain: (board at: 'd3'). "Capture diagonale gauche pour pion noir"
    captureMoves shouldContain: (board at: 'f3'). "Capture diagonale droite pour pion noir"


]

{ #category : 'tests' }
MyPawnTest >> testInitialWhitePawnMoves [

	| pawn squares board1 expectedSquares |
	board1 := MyChessBoard empty.
	board1 at: 'e2' put: (pawn := MyPawn white).
	squares := pawn targetSquaresLegal: true.

	expectedSquares := OrderedCollection new.
	expectedSquares add: (board1 at: 'e3').
	self assert: squares asSet equals: expectedSquares asSet
]

{ #category : 'as yet unclassified' }
MyPawnTest >> testIsFirstMove [ 

	|pawnWhite pawnBlack board|
     
		  board := MyChessBoard empty.
	     board at: 'e2' put: (pawnWhite:= MyPawn white).
 		  board at: 'e7' put: (pawnBlack := MyPawn black).
        
			"Verifie si le pion est sur la case de départ"
        self assert: (pawnWhite isFirstMove).
        self assert: (pawnBlack isFirstMove).

        "Modification des positions des pions"
		  " board at: 'e3' put: (pawnWhite:= MyPawn white).
 		  board at: 'e6' put: (pawnBlack := MyPawn black).

        self deny: (pawnWhite isFirstMove).
        self deny: (pawnBlack isFirstMove). "

]

{ #category : 'tests' }
MyPawnTest >> testSingleMove [


	| pawn squares board1 expectedSquares |
	board1 := MyChessBoard empty.
	board1 at: 'f4' put: (pawn := MyPawn black).
	squares := pawn targetSquaresLegal: true.

	expectedSquares := OrderedCollection new.
	expectedSquares add: (board1 at: 'f3').
	self assert: squares asSet equals: expectedSquares asSet
]

{ #category : 'tests' }
MyPawnTest >> testWhitePawnMovesDoubleStep [

	| pawn board expectedSquares squares |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).
	squares := pawn targetSquaresLegal: true.
	expectedSquares := OrderedCollection new.
	expectedSquares add: (board at: 'e3').
	expectedSquares add: (board at: 'e4').
	self assert: squares asSet equals: expectedSquares asSet
	
]
