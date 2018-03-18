//
//  ShowDetailViewController.swift
//  iMovie
//
//  Created by pratap surendran ganesan on 26/8/17.
//  Copyright © 2017 pratap surendran ganesan. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import CoreData

class ShowDetailViewController: UIViewController,YTPlayerViewDelegate {

    
    
    
   @IBOutlet weak var movieAd: YTPlayerView!
   @IBOutlet weak var movieTrailor: UIWebView!
   @IBOutlet weak var moviePoints: UILabel!
   
   var getMovieTitle = String()
   var getMovieImage = UIImage()
   var getMovieOverview = String()
   var getMovieTrailor = String()
   var getRating = Double()
   var getMovieId = Int()
   var getTableIndex = Int()
   var getImageURL = String()
   
    
    //video player attributes
    let avPlayerViewController = AVPlayerViewController()
    var avPlayer: AVPlayer?
    
    //MostLiked attributes
    var isMostLiked:Bool = false
    
    //instance of user
    let currentUser: UserDetail = UserDetail.sharedInstance
    
    //delegate attribute
    var AiringTableTableViewController: FavoriteDelegate?
    
    @IBOutlet weak var movieLikeButton: UIButton!
    @IBOutlet weak var movieOverview: UITextView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UITextView!
    
    
    let favoriteManager = FavoriteManager.sharedInstance
    
    func playerView(_ playerView: YTPlayerView, didChangeTo state: YTPlayerState)
    {
         switch (state) {
        case YTPlayerState.playing:
            print("Youtube is playing")
            currentUser.increasePoints(pts: 10)
            favoriteManager.updatePoints(points:10,movieName: getMovieTitle)
            self.viewDidLoad()
            
        
            break;
        default:
            break;
    }
}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         movieImage.image = getMovieImage
         movieOverview.text = getMovieOverview
         movieName.text = getMovieTitle
        
         //Initialize the URL for ad video
        let movieUrl: NSURL? = NSURL(string: "http://techslides.com/demos/sample-videos/small.mp4")
        
        if let url = movieUrl{
            self.avPlayer = AVPlayer(url: url as URL)
            self.avPlayerViewController.player = self.avPlayer
        }
        
        
        movieAd.delegate = self
        
        //using the Youtube library
        movieAd.load(withVideoId: getMovieTrailor)
        
        //check if the movie is MostLiked
        self.isMostLiked = favoriteManager.checkLikeStatus(movieName: getMovieTitle)
        updateLikeButton(isLiked: isMostLiked)
        
        
        
       //
//        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
        // Dispose of any resources that can be recreated.
    }
    
   
    //Listener to watch trailor button
    @IBAction func playTrailor(_ sender: Any) {
        //Trigger the video to play
        print("playing trailor")
        self.present(avPlayerViewController, animated: true){
            self.avPlayerViewController.player?.play()
        }
        
        currentUser.increasePoints(pts: 10)
        favoriteManager.updatePoints(points:10,movieName: getMovieTitle)
         self.viewDidLoad()
        
    }
    
   
    func updateLikeButton(isLiked : Bool){
        if(isLiked){
            setLike()
            updatePointsLabel()
        }
        else{
            setUnLike()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewDidLoad()
    }
    
    func updatePointsLabel(){
        self.moviePoints.text = " \(favoriteManager.getPoints(movieName: getMovieTitle)) pts "
    }
    
    
    
    @IBAction func changeLikeStatus(_ sender: Any) {
        if(self.movieLikeButton.titleLabel?.text == "LIKE"){
            //setLike()
            favoriteManager.save(movie_id: getMovieId, movie_name: getMovieTitle, movie_imageName: getImageURL, overview: getMovieOverview, rating:
                getRating, trailorID: getMovieTrailor)
          
        }
        
        else{
           
            favoriteManager.deleteMovie(movieName: getMovieTitle)
            
        }
        self.viewDidLoad()
    }
    
    
     func setLike(){
        self.movieLikeButton.setTitle("UNLIKE", for: UIControlState.normal)
        self.movieLikeButton.backgroundColor = UIColor.magenta
        AiringTableTableViewController?.setLike(path:getTableIndex)
        
    }
    
    func setUnLike(){
        self.movieLikeButton.setTitle("LIKE", for: UIControlState.normal)
        self.movieLikeButton.backgroundColor = UIColor.white
        AiringTableTableViewController?.setUnLike(path:getTableIndex)
        
        
        
    }
    
    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
