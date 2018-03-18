//
//  Movie.swift
//  iMovie
//
//  Created by pratap surendran ganesan on 13/9/17.
//  Copyright © 2017 pratap surendran ganesan. All rights reserved.
//

import Foundation
import SwiftyJSON

class Movie{
    
    let id : Int
    var name : String
    var imageName : String
    var overview : String
    var rating : Double
    var trailorID : String?
    
    init?(json: JSON, movieAPI: NetworkProtocol){
        
        self.id = json["id"].intValue
        self.name = json["original_title"].stringValue
        self.imageName = json["poster_path"].stringValue
        self.overview = json["overview"].stringValue
        self.rating = json["vote_average"].doubleValue
        movieAPI.loadImage(imageURL: self.imageName)
        //self.trailorID = "YqhvVyiEpI0"
        movieAPI.getTrailorID(movieID: self.id, completion: { (ID) in
            self.trailorID = ID
        })
    }
   
    
}
