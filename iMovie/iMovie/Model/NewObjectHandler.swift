//
//  NewObjectHandler.swift
//  iMovie
//
//  Created by pratap surendran ganesan on 16/9/17.
//  Copyright © 2017 pratap surendran ganesan. All rights reserved.
//

import Foundation
import SwiftyJSON

class NewObjectHandler : ObjectHandler{
    
    func getMovie(json: JSON, movieAPI: NetworkProtocol) -> Movie {
        print("Object newly created..from getMovie inside NewObjectHandler")
        return Movie(json: json, movieAPI: movieAPI)!
    }
    
    func setNextObjectHandler(nextObjectHandler: ObjectHandler) {
       // No Object handler.
    }
    
    }
