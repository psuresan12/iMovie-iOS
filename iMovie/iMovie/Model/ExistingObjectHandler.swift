//
//  ExistingObjectHandler.swift
//  iMovie
//
//  Created by pratap surendran ganesan on 16/9/17.
//  Copyright © 2017 pratap surendran ganesan. All rights reserved.
//

import Foundation
import SwiftyJSON

class ExistingObjectHandler: ObjectHandler {
    
    var nextObjectHandler : ObjectHandler!
    var objectFactory : ObjectFactory
    
    
    init(){
        objectFactory = ObjectFactory()
    }
    
    func getMovie(json: JSON, movieAPI: NetworkProtocol) -> Movie {
        var movie = objectFactory.getMovie(movieID: json["id"].intValue)
        if(movie != nil){
            print("object is re-used..from getMovie inside ExistingObjectHandler")
            return movie!
        }
        else{
            
            movie = nextObjectHandler.getMovie(json: json, movieAPI: movieAPI)
            //insert the newly created movie into factory
            objectFactory.insertMovie(movie: movie!)
            return movie!
        }
        
    }
    
    
    func setNextObjectHandler(nextObjectHandler: ObjectHandler) {
        self.nextObjectHandler = nextObjectHandler
    }
    
    
    
    
}
