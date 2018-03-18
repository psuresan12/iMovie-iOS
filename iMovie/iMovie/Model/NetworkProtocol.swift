//
//  NetworkProtocol.swift
//  iMovie
//
//  Created by pratap surendran ganesan on 5/10/17.
//  Copyright © 2017 pratap surendran ganesan. All rights reserved.
//

import Foundation

protocol NetworkProtocol{
    
    func loadImage(imageURL: String)
    
    func getTrailorID(movieID: Int , completion : @escaping (String) -> Void)
    

}
