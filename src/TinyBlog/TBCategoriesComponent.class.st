Class {
	#name : #TBCategoriesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'categories',
		'postsList'
	],
	#category : #'TinyBlog-Components'
}

{ #category : #'instance creation' }
TBCategoriesComponent class >> categories: aCollectionOfCategories postsList: aTBScreen [
   ^ self new categories: aCollectionOfCategories; postsList: aTBScreen 
]

{ #category : #accessing }
TBCategoriesComponent >> categories [
	^ categories
]

{ #category : #accessing }
TBCategoriesComponent >> categories: anObject [
	categories := anObject
]

{ #category : #accessing }
TBCategoriesComponent >> postsList [
	^ postsList
]

{ #category : #accessing }
TBCategoriesComponent >> postsList: anObject [
	postsList := anObject
]

{ #category : #rendering }
TBCategoriesComponent >> readSelectedPosts [
   ^ self currentCategory
      ifNil: [ self blog allVisibleBlogPosts ]
      ifNotNil: [ self blog allVisibleBlogPostsFromCategory: self currentCategory ]
]

{ #category : #rendering }
TBCategoriesComponent >> renderCategoryLinkOn: html with: aCategory [
   html tbsLinkifyListGroupItem
      class: 'active' if: aCategory = self postsList currentCategory ;
      callback: [ self selectCategory: aCategory ]; 
      with: aCategory
]

{ #category : #rendering }
TBCategoriesComponent >> renderContentOn: html [
   super renderContentOn: html.
   html tbsContainer: [
      html tbsRow showGrid;
         with: [
            html tbsColumn
               extraSmallSize: 12;
               smallSize: 2;
               mediumSize:  4;
               with: [
                  html render: (TBCategoriesComponent
                    categories: (self blog allCategories)
                    postsList: self) ].
      html tbsColumn
               extraSmallSize: 12;
               smallSize: 10;
               mediumSize: 8;
               with: [
         self readSelectedPosts do: [ :p |
             html render: (TBPostComponent new post: p) ] ] ] ]
]

{ #category : #operations }
TBCategoriesComponent >> selectCategory: aCategory [
   postsList currentCategory: aCategory
]
