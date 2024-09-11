Class {
	#name : 'Person',
	#superclass : 'Object',
	#instVars : [
		'name'
	],
	#category : 'MyPerson',
	#package : 'MyPerson'
}

{ #category : 'accessing' }
Person >> name [ 
 ^name


]

{ #category : 'accessing' }
Person >> name: aName [

name := aName 
]

{ #category : 'as yet unclassified' }
Person >> personHello [

^'Hello, my name is ', self name 
]
