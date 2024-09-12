Class {
	#name : 'TrueMethods',
	#superclass : 'BooleanMethods',
	#category : 'MyBooleanMethods',
	#package : 'MyBooleanMethods'
}

{ #category : 'as yet unclassified' }
TrueMethods >> orEager [ | a |
a
"
| b| 

if ( a== true || b == false) return true 
if ( a == false || b == false ) return false "
]
