//
//  MovieAPI.swift
//  iMovie
//
//  Created by pratap surendran ganesan on 13/9/17.
//  Copyright © 2017 pratap surendran ganesan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MovieAPI : NetworkProtocol{
   
    static let shared = MovieAPI()
    
    //URL
    let BASE_URL:String  = "https://api.themoviedb.org/3/movie/"
    let AIRING_SHOWS:String = "now_playing"
    let TRENDING_SHOWS:String = "popular"
    let TRAILOR_URL: String = "/videos"
    let API_KEY:String = "?api_key=e93538bb421ea6554bf10471e433142e"
    
    //Image Dictionary:
    var imageCache = [String: UIImage] ()
    
    //Chain of responsibility variables
    var existingObjectHandler : ExistingObjectHandler?
    var newObjectHandler : NewObjectHandler?
    
   
    
    var airingShows = [Movie]()
    var trendingShows = [Movie]()
//    var recommendedShows : [Movie] = nil
//    var favoriteShows : [Movie] = nil
//    var trendingShows : [Movie] = nil
    
    private init(){
        //Initializing the chain of responsibility classes
        existingObjectHandler  = ExistingObjectHandler()
        newObjectHandler = NewObjectHandler()
        //assign the chain of reposonisbilty
        existingObjectHandler!.setNextObjectHandler(nextObjectHandler: newObjectHandler!)
        
    }
    
    
    
    func loadAiringShows(){
       
        Alamofire.request(generateAiringURL(),method: .get).validate().responseJSON {response in
        
        switch response.result{
            case .success(let value):
                let json = JSON(value)
                for i in 0...20{
                   // self.airingShows.append(Movie(json: json["results"][i],movieAPI: self)!)
                    let movie = self.existingObjectHandler?.getMovie(json: json["results"][i], movieAPI: self)
                    self.airingShows.append(movie!)
            }
            
            
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    
    func loadTrendingShows(){
        print("Entered into Trending shows")
        Alamofire.request(generateTrendingURL(),method: .get).validate().responseJSON {response in
            
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                for i in 0...20{
                    print("Entered into For loop")
                    
                    let movie = self.existingObjectHandler?.getMovie(json: json["results"][i], movieAPI: self)
                    self.trendingShows.append(movie!)
                }
                
                
            case .failure(let error):
                print(error)
            }
           print("End of for loop")
        }
    }
    
    
    
    
    func generateAiringURL()-> String{
        return BASE_URL+AIRING_SHOWS+API_KEY
    }
    
    func generateTrailorUrl(movieID: Int) -> String{
        return BASE_URL+"\(movieID)"+TRAILOR_URL+API_KEY
    }
    
    func generateTrendingURL()-> String{
        return BASE_URL+TRENDING_SHOWS+API_KEY
    }
    
    
    func loadImage(imageURL : String){
        
        
        if(self.imageCache[imageURL] == nil){
            print("Image is Not in Cache,Hence downloading the image")
        
            //downloading the image
            Alamofire.request("https://image.tmdb.org/t/p/w500"+imageURL).responseData {(response) in
               
                if let data = response.result.value{
                    self.imageCache[imageURL] = UIImage(data: data)
                }
            }
        }
    }

    
        
    func getTrailorID(movieID: Int , completion : @escaping (String) -> Void){
        Alamofire.request(generateTrailorUrl(movieID:movieID),method: .get).validate().responseJSON { response in
           
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                let trailorID = json["results"][0]["key"].stringValue
                if (trailorID.characters.count > 0){
                    completion(trailorID)}
                else{
                completion("tETiiqK7Cvc")
                }
            case .failure(let error):
                completion("tETiiqK7Cvc") // link to Default youtube video.
            }
       
            
        }
    
    }
    
    
    func appendFavoriteMovie(){
        
    }

}


