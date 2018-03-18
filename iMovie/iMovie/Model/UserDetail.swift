//
//  UserDetail.swift
//  iMovie
//
//  Created by pratap surendran ganesan on 26/8/17.
//  Copyright © 2017 pratap surendran ganesan. All rights reserved.
//

import Foundation

class UserDetail{
    
    var name: String = "Pratap"
    var points: Int = 30
    let sharePoints = 10;
    
    static let sharedInstance = UserDetail()
    
    private init(){
        
    }
    
    func getName()-> String{
        return self.name
    }
    
    func getPoints() -> Int{
        return self.points
    }
    
    func increasePoints(pts:Int){
        self.points += pts
    }
    
    func decreasePoints(pts:Int){
        if(points >= pts){
            self.points -= pts
        }
    }
    
    
    
}
