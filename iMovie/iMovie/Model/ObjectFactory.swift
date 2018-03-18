//
//  MovieFactory.swift
//  iMovie
//
//  Created by pratap surendran ganesan on 16/9/17.
//  Copyright © 2017 pratap surendran ganesan. All rights reserved.
//

import Foundation

class ObjectFactory{
    
    var movieList = [Movie]()
    var imageList = [String : UIImage] ()
    
    func getMovie(movieID :Int) -> Movie?{
        
        for movie in movieList{
            if(movie.id == movieID){
                return movie
            }
                
            
        }
        return nil
    }
    
    
    func insertMovie(movie:Movie){
        movieList.append(movie)
    }
    
    
    func getImage(imageURL : String) -> UIImage?{
        let image:UIImage? = imageList[imageURL]!
        return image
        
    }
}

