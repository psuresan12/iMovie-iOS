//
//  AiringMovieTableViewCell.swift
//  iMovie
//
//  Created by pratap surendran ganesan on 27/8/17.
//  Copyright © 2017 pratap surendran ganesan. All rights reserved.
//

import UIKit

class AiringMovieTableViewCell: UITableViewCell {

   
    @IBOutlet weak var airingMovieImage: UIImageView!
    @IBOutlet weak var airingMovieGenre: UILabel!
    @IBOutlet weak var airingMovieTitle: UILabel!
   
    
    @IBOutlet weak var likeStyatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func updateLikeButton(_ sender: Any) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLike(){
        
        self.likeStyatus.isHidden = false;
        
    }
    
    func setUnLike(){
        
         self.likeStyatus.isHidden = true
        
    }
    
    func checkLikeStatus(movieName: String){
        let likeStatus = FavoriteManager.sharedInstance.checkLikeStatus(movieName: movieName)
        
        if(likeStatus){
             setLike()
        }
        else{
             setUnLike()
        }
        
    }
    
    

}
