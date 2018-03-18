//
//  DataManager.swift
//  iMovie
//
//  Created by pratap surendran ganesan on 7/10/17.
//  Copyright © 2017 pratap surendran ganesan. All rights reserved.
//

import Foundation

import UIKit
import CoreData

class FavoriteManager{
    
    
    // Get a reference to your App Delegate
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // Hold a reference to the managed context
    let managedContext: NSManagedObjectContext
    
    var rewardResults = [MoviePoints]()
    var FavoriteMovieResults = [FavoriteMovie]()
    
    static let sharedInstance = FavoriteManager()
    
    
    private init(){
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    public func getMoviesFromCoreData(){
        fetchRewards()
        fetchFavoriteMovies()
        self.loadAllMostLikedImage()
    }
    
    func fetchRewards()
    {
        
        // Ask the Points class to fetch all the rewards records
        let rewaredResult: NSFetchRequest<MoviePoints> = MoviePoints.fetchRequest()
        
        
        do {
            // Use the managed context to execute the fetch request
            rewardResults = try managedContext.fetch(rewaredResult)
        }
        catch{
            print()
        }
        
    }
    
    
    func fetchFavoriteMovies()
    {
        // Ask the Publisher class to fetch all the publisher records
        let favoriteMovieResult: NSFetchRequest<FavoriteMovie> = FavoriteMovie.fetchRequest()
        
        
        
        do {
            FavoriteMovieResults = try managedContext.fetch(favoriteMovieResult)
        }
        catch{
            print()
        }
    }
    
    
    // Insert new entities into the managed context and persist them to the store.
    func save(movie_id: Int,movie_name: String, movie_imageName: String , overview: String, rating: Double, trailorID: String)
    {
        let favoriteMovie = NSEntityDescription.insertNewObject(forEntityName: "FavoriteMovie", into: managedContext) as! FavoriteMovie
        
        
        // Create a new favorite movie object and update it with the data passed in from the View Controller
        
        favoriteMovie.setValue(movie_id, forKeyPath: "id")
        favoriteMovie.setValue(movie_imageName, forKeyPath: "imageName")
        favoriteMovie.setValue(overview, forKeyPath: "overview")
        favoriteMovie.setValue(rating, forKeyPath: "rating")
        favoriteMovie.setValue(trailorID, forKeyPath: "trailorID")
        
        
        let moviePoints = NSEntityDescription.insertNewObject(forEntityName: "MoviePoints", into: managedContext) as! MoviePoints
        moviePoints.setValue(movie_name, forKeyPath: "name")
        moviePoints.setValue(5, forKeyPath: "reward")
        
        // Create Relationship - this should match the relationship you created in the data model
        moviePoints.setValue(favoriteMovie, forKey: "detail")
        
        FavoriteMovieResults.append(favoriteMovie as! FavoriteMovie)
        rewardResults.append(moviePoints as! MoviePoints)
        
        
        updateDatabase()
        displayFavoriteMovie()
        
        
    }
    
    
    func updatePoints(points:Int, movieName: String){
        let indexPath = getIndexPathByMovieName(movieName: movieName)
        if(indexPath != -1){
            let point = rewardResults[indexPath]
            point.reward = point.reward+points
            updateDatabase()
        }
        
        displayFavoriteMovie()
        
    }
    
    func loadAllMostLikedImage(){
        
        for item in FavoriteMovieResults{
            MovieAPI.shared.loadImage(imageURL: item.imageName!)
        }
        
    }
    
    
    func updateDatabase()
    {
        do
        {
            try managedContext.save()
        } catch let error as NSError
        {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    
    func displayFavoriteMovie(){
        
        print("************printing model starts*******")
        
        fetchFavoriteMovies()
        fetchRewards()
        
        for movie in FavoriteMovieResults{
            print("\(movie.id) && \(movie.moviepoints?.name)with \(movie.moviepoints?.reward)")
        }
        
        for point in rewardResults{
            print("\(point.name) && \(point.detail?.id) has \(point.reward)")
        }
        
        print("**********printing model ends**********")
        
    }
    
    
    func deleteMovie(movieName: String){
        
        let indexPath = getIndexPathByMovieName(movieName: movieName)
        if(indexPath != -1){
            let movie = rewardResults[indexPath]
            rewardResults.remove(at: indexPath)
            managedContext.delete(movie)
            updateDatabase()
        }
        
        displayFavoriteMovie()
        
        
    }
    
    func checkLikeStatus( movieName : String)-> Bool{
        
        
        var isLiked = false
        
        for item in rewardResults{
            
            if(movieName == item.name){
                isLiked = true
            }
        }
        
        print("status to be returned \(isLiked)")
        return isLiked
    }
    
    
    func getPoints(movieName : String) -> Int{
        var indexPath = getIndexPathByMovieName(movieName: movieName)
        if(indexPath != -1){
            return Int(rewardResults[indexPath].reward)
        }
        else{
            return 0
        }
    }
    
    
    func getIndexPathByMovieName(movieName : String) -> Int{
        var counter = 0
        for item in rewardResults{
            if(movieName == item.name){
                return counter
            }
            counter = counter+1
        }
        
        return -1
    }
    
    
    
    
}

