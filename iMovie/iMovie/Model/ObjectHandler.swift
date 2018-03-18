//
//  Handler.swift
//  iMovie
//
//  Created by pratap surendran ganesan on 16/9/17.
//  Copyright © 2017 pratap surendran ganesan. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol  ObjectHandler {
    func getMovie(json: JSON, movieAPI: NetworkProtocol) -> Movie
    func setNextObjectHandler(nextObjectHandler : ObjectHandler)
}
