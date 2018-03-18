//
//  MockMovieAPI.swift
//  iMovie
//
//  Created by pratap surendran ganesan on 5/10/17.
//  Copyright © 2017 pratap surendran ganesan. All rights reserved.
//

import Foundation
@testable import iMovie

class MockMovieAPI: NetworkProtocol{
    
    var counter : Int = 0
    var isImageLoaded = false
    var isTrailorURLFetched = false
    
    func loadImage(imageURL: String){
        counter = counter+1;
        isImageLoaded = true
    }
    
    
    func getTrailorID(movieID: Int , completion : @escaping (String) -> Void){
        isTrailorURLFetched = true
    }
    
   
    func getCounter() -> Int{
        return self.counter
    }
    
    func getMediaStatus() -> Bool{
        return (isImageLoaded && isTrailorURLFetched)
    }
    

}
