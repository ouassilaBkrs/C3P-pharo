Class {
	#name : 'MyTestPerson',
	#superclass : 'TestCase',
	#category : 'MyPerson',
	#package : 'MyPerson'
}

{ #category : 'tests' }
MyTestPerson >> testPerson [

| p |
p  := Person new.
p name:  'sara'.
self assert: p personHello equals:  'Hello, my name is sara'
]
