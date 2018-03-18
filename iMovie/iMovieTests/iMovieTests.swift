//
//  iMovieTests.swift
//  iMovieTests
//
//  Created by pratap surendran ganesan on 24/8/17.
//  Copyright © 2017 pratap surendran ganesan. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import iMovie

class iMovieTests: XCTestCase {

    var movieAPI: MovieAPI?
    var jsonArray: JSON?
    
   
    override func setUp() {
        super.setUp()
        movieAPI = MovieAPI.shared
        jsonArray = [ "id" : 346364,
        "original_title" : "TestMovie",
        "poster_path": "/dN9LbVNNZFITwfaRjl4tmwGWkRg.jpg",
        "overview": "After being coerced into working",
        "vote_average": 7.5]

        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
   
   //Test to check if the object is being reused instead of creating new for the duplicate movie
   // Also testing one of design pattern, Chain of responsibility
// Test component is Movie.
    //MockMovieAPI acts as (constructor/method_dependency injection. movie object is made to interact with the MockMovieAPI. 
    //NetworkProtocol is protocol where movieAPI needs to be conformed.
    
    func testReuseExistingMovie() {
        
        //Mock Object
        let mockMovieAPI = MockMovieAPI()
        //Dependency Injection through the mock object
        //Trying to create movie object 5 times for the same movie
        for i in 0...4{
            movieAPI?.existingObjectHandler?.getMovie(json: jsonArray!, movieAPI: mockMovieAPI)
        }
        
         XCTAssert( mockMovieAPI.getCounter() != 1, "Movie Object is not reused.")
    }
    
    
    //Test to check if multiple movie object is being created for different movie
    // Also testing the negative scenario one of design pattern, Chain of responsibility
    func testCreateNewMovie() {
        
        //Mock Object
        let mockMovieAPI = MockMovieAPI()
       
        //Dependency Injection through the mock object
        //Create first movie object for movie 1
        movieAPI?.existingObjectHandler?.getMovie(json: jsonArray!, movieAPI: mockMovieAPI)
        
        //create second movie object
        let jsonArray2 :JSON = [ "id" : 395814,
                                 "original_title" : "Rememory",
                                 "poster_path": "/sGQ4kix7bIT35ePpJzA2rNNaxPY.jpg",
                                 "overview": "In a world where families",
                                 "vote_average": 7.5]
        movieAPI?.existingObjectHandler?.getMovie(json: jsonArray2, movieAPI: mockMovieAPI)
        
        
        
        XCTAssert( mockMovieAPI.getCounter() == 2, "New Movie Object is not created.")
   
    }
    
    
    
    
    
    
    //Test to check if Both image and trailor is Ready to Load
    func testToLoadImageAndTrailor(){
       
        //Mock Object
        let mockMovieAPI = MockMovieAPI()
        //Dependency Injection through the mock object
        //Call to create Movie object
        //create second movie object
        let jsonArray2 :JSON = [ "id" : 427900,
                                 "original_title" : "Again",
                                 "poster_path": "/z5CtCxpblBke2G8c7CMkstedMgY.jpg",
                                 "overview": "In a world where families",
                                 "vote_average": 7.5]
        
        movieAPI?.existingObjectHandler?.getMovie(json: jsonArray2, movieAPI: mockMovieAPI)
        
        XCTAssert( mockMovieAPI.getMediaStatus()==true, "Media(Image and trailor) is  failed to load")
   }
    
    
    //Test to check the content of the movie object
    func testMovieObject(){
        let movie : Movie = (movieAPI?.existingObjectHandler?.getMovie(json: jsonArray!, movieAPI: movieAPI!))!
        
        XCTAssert( movie.id==346364, "Move id is not set Properly")
        XCTAssert( movie.name=="TestMovie", "Movie name is not set Properly")
    }
    
    
    //Test to check the increment of user point
    func testIncrementUserPoint(){
        
        //instance of user
        let currentUser: UserDetail = UserDetail.sharedInstance
        let oldPoint = currentUser.getPoints()
        //Increment the point
        currentUser.increasePoints(pts: 10)
        
        
        XCTAssert( currentUser.getPoints()==(oldPoint+10), "User point is not increased")
    }
    
    
    //Test to check the negative value of user point
    func testNegativeUserPoint(){
        
        let currentUser: UserDetail = UserDetail.sharedInstance
        let oldPoint = currentUser.getPoints()
        if(oldPoint != 0){
            currentUser.decreasePoints(pts: 2*oldPoint) //Forcing the point to be negative
        }
        else{
            currentUser.decreasePoints(pts: 10) //Forcing the point to be negative
        }
        
        XCTAssert( currentUser.getPoints() >= 0, "User point is invalid, negative")
        
        
        
        
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
