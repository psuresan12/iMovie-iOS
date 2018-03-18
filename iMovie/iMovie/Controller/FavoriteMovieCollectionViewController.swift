//
//  FavoriteMovieCollectionViewController.swift
//  iMovie
//
//  Created by pratap surendran ganesan on 25/8/17.
//  Copyright © 2017 pratap surendran ganesan. All rights reserved.
//

import UIKit


class FavoriteMovieCollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var noFavoriteText: UILabel!
    @IBOutlet  weak var redeemButton: UIButton!
    @IBOutlet weak var FavoriteView: UICollectionView!
    
    @IBAction func viewTrendingShows(_ sender: Any) {
        
        tabBarController?.selectedIndex = 2;
    }
        //Reference to FavoriteManager
    let favoriteManager = FavoriteManager.sharedInstance
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteManager.getMoviesFromCoreData()
        self.FavoriteView.delegate = self
        self.FavoriteView.dataSource = self
        self.setRedemptionStatus()
        self.noFavoriteText.isHidden = true
        //trigger trending shows , to avoid time delay
        MovieAPI.shared.loadTrendingShows();
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.FavoriteView.reloadData()
    }
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let favoriteCount = favoriteManager.FavoriteMovieResults.count
        if(favoriteCount < 1){
        self.noFavoriteText.isHidden = false
        }else{
            self.noFavoriteText.isHidden = true
        }
        return favoriteCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as! FavoriteCollectionViewCell
        cell.FavoriteImage.image = MovieAPI.shared.imageCache[favoriteManager.FavoriteMovieResults[indexPath.row].imageName!]
        return cell
   
    }
    
   
    
    func setRedemptionStatus(){
        if(UserDetail.sharedInstance.getPoints() > 1){
            redeemButton.isEnabled = true
           
        }
        
        else{
            redeemButton.isEnabled = false
            redeemButton.setTitle("share to earn points", for: UIControlState.disabled)
            redeemButton.backgroundColor = UIColor.gray
        }
        
        
    }
    

}
