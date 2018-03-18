 
## STATEMENT OF PURPOSE:
      iMovie provides the platform to stay updated   with   the   latest   released   and   trending   movies, and   to   get   rewarded   by   sharing   your   favorite   movies   in   Facebook   and   by   liking   those   movies in   iMovie.

###### Example use case:

1) User   access   the   list   of   currently   airing   movies   by   accessing   iMovies   mobile application.
2) User   earns   the   reward   points   by   Liking   the   movie.
3) User   earns   the   reward   points   by   playing   advertisement   and   Youtube   URL.
4) User   Can   see   the   reward   points   for   their   favorite   shows
5) User   redeems   the   earned   points   using   redeem   button

    
## Implementation of multiple   view:
1) Collection   view   -   To   view   the   trending   shows   from   API,   a   better   layout   to   view   a   large collection   of   set   that   are   trending   in   social   network.
2) Split   view   :   To   view   the   currently   airing   show   ,   a   better   view   for   certain   amount   of data   set,   enabling   the   user   set   to   navigate   to   the   different   set   while   viewing   the   detail page   simultaneously.
3) Collection   view   -   To   View   the   carousel   list   of   favorite   shows   in   the   home   page,   a better   way   to   have   quick   glance   of   user   favorite   list.
4) UIView   -   To   incorporate   the   image   ,   share   and   cancel   buttons   while   sharing   the movie   in   the   Facebook.
5) Table   View   -   Search   Movies   Functionality.

## Adaptive   Layout(Size   classes):
1) Home   Screen:   Placement   of   Buttons   and   Image.
2)   Show   Detail   screen:   Length   of   the   buttons   and   color   of   the   screen   background
#Cocoa   Framework:
AVFoundation   was   used   to   implement   Cocoa   Framework.
Business   Use   case:
Advertisement   video   will   be   played   using   AVPlayer,   and   the   user   gets   points   for   viewing   the
video.

## Design   Pattern:
###### Chain of Responsibility:
        System uses chain of responsibility to create movie object.The same movie object is being made to reuse from the object factory if the object is already exists for the same movie.First,ExistingObjectHandler handles the request if the condition satisfies and returns the
        movie object from the factory, or NewObjectHandler takes the request and creates a new object.
 
 ###### Delegation:
       Delegation has been implemented in table view controller. When the movie like status has been changed, it is made to reflect in the table view cell when we navigate back to the table view cell.
 
 ## Persistent   Data(Core   Data)
 ###### One   to   One   relation
MoviePoints      -   Parent.
FavoriteMove   -   Chid.

All the Favorite Movie are stored in Coredata.Points earned through these Favorite movie are also stored in the Database.
The above model were implemented using cascade style.Neither cannot exists alone.In other words, the points are only stored for the favorite movie.
 
 CRUD operation are also implemented (FavoriteManager.swift inside the Model) 
 
## Unit   Test:
Test   components:   Movie.
Dependency   Injection:   Movie   object   has   been   testing   using   MockMovieAPI.   Dependency injection   has   been   implemented   using   the   technique   constructor/method   injection   where MockMovieAPI   has   been   passed   to   Movie   object,   and   Movie   object   has   made   to   interact with   MockMovieAPI.

Please   also   note   that   MovieAPI   has   also   been   used   to   initiate   the   correct   working   behaviour for   other   cases.
Both   MovieAPI   and   MockMovieAPI   conformed   to   NetworkProtocol

## Test   Case:
a) testReuseExistingMovie   -   Test   chain   of   Responsibility,   and   check   if   the   objects   have
been   reused.
b) testCreateNewMovie   -   Test   chain   of   Responsibility,   and   check   if   the   objects   have
been   created   for   new   movie.
c) testToLoadImageAndTrailor   -   Test   if   the   request   for   image   and   youtube   URL   has
been   initiated   correctly   at   correct   place.
d) testMovieObject   -   Test   if   the   movie   object   has   been   created   with   correct   data   ,   and
attributes   can   be   accessed   after   creating   movie   object.

## Mock:
Test   Components - UserDetail TestCase:
a) testIncrementUserPoint   -   Test   to   check   if   the   user   points   gets   incremented.
b) testNegativeUserPoint   -   Test   to   check   if   the   user   points   should   not   be   negative.
