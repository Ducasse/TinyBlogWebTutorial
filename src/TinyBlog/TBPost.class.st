"
I'm a simple class representing a Blog post
"
Class {
	#name : #TBPost,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible'
	],
	#category : #'TinyBlog-Model'
}

{ #category : #'instance creation' }
TBPost class >> title: aTitle text: aText [
   ^ self new
        title: aTitle;
        text: aText;
        yourself
]

{ #category : #'instance creation' }
TBPost class >> title: aTitle text: aText category: aCategory [
   ^ (self title: aTitle text: aText)
            category: aCategory;
            yourself
]

{ #category : #constant }
TBPost class >> unclassifiedTag [
   ^ 'Unclassified'
]

{ #category : #action }
TBPost >> beNotVisible [
	self visible: false

]

{ #category : #action }
TBPost >> beVisible [
	self visible: true

]

{ #category : #accessing }
TBPost >> category [
	^ category
]

{ #category : #accessing }
TBPost >> category: anObject [
	category := anObject
]

{ #category : #accessing }
TBPost >> date [
	^ date
]

{ #category : #accessing }
TBPost >> date: anObject [
	date := anObject
]

{ #category : #initialization }
TBPost >> initialize [
	super initialize.
   self category: TBPost unclassifiedTag.
   self date: Date today.
   self beNotVisible
]

{ #category : #testing }
TBPost >> isUnclassified [
   ^ self category = TBPost unclassifiedTag
]

{ #category : #testing }
TBPost >> isVisible [
   ^ self visible
]

{ #category : #accessing }
TBPost >> text [
	^ text
]

{ #category : #accessing }
TBPost >> text: anObject [
	text := anObject
]

{ #category : #accessing }
TBPost >> title [
   ^ title
]

{ #category : #accessing }
TBPost >> title: anObject [
	title := anObject
]

{ #category : #accessing }
TBPost >> visible [
	^ visible
]

{ #category : #accessing }
TBPost >> visible: anObject [
	visible := anObject
]
