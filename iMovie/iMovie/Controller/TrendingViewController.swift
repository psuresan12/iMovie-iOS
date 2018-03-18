//
//  TrendingViewController.swift
//  iMovie
//
//  Created by pratap surendran ganesan on 25/8/17.
//  Copyright © 2017 pratap surendran ganesan. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    var movieAPI: MovieAPI = MovieAPI.shared
    

    

    @IBOutlet weak var TrendingView: UICollectionView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TrendingView.delegate = self
        self.TrendingView.dataSource = self
        
        self.movieAPI.loadTrendingShows()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.TrendingView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("printing the count for trending show \(movieAPI.trendingShows.count)")
        return movieAPI.trendingShows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingCell", for: indexPath) as! TrendingCollectionViewCell
        cell.TrendingImage.image =  movieAPI.imageCache[movieAPI.trendingShows[indexPath.row].imageName]
        return cell
    }

   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let movieDetail = storyBoard.instantiateViewController(withIdentifier: "ShowDetailViewController") as! ShowDetailViewController
        
       
       
        let trendingShows = movieAPI.trendingShows
        movieDetail.getMovieTitle  = trendingShows[indexPath.row].name
        movieDetail.getMovieImage =  movieAPI.imageCache[trendingShows[indexPath.row].imageName]!
        movieDetail.getMovieOverview = trendingShows[indexPath.row].overview
        movieDetail.getMovieTrailor = trendingShows[indexPath.row].trailorID!
        movieDetail.getMovieId = trendingShows[indexPath.row].id
        movieDetail.getRating = trendingShows[indexPath.row].rating
        movieDetail.getTableIndex = indexPath.row
        movieDetail.getImageURL = trendingShows[indexPath.row].imageName
         self.navigationController?.pushViewController(movieDetail, animated: true)        
       }
    
   
    
}


//
//extension TrendingViewController: UICollectionViewDelegateFlowLayout
//{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        var screenSize = CGFloat()
//        if UIDevice.current.orientation.isLandscape == true {
//            screenSize = UIScreen.main.bounds.size.width / 2.0
//        }
//        else {
//            screenSize = UIScreen.main.bounds.size.width / 3.0
//        }
//        
//        return CGSize.init(width: screenSize, height: screenSize)
//    }
//}







    public extension UIView
    {
        
        func addFullScreenConstraints(subview:UIView, insets: UIEdgeInsets = UIEdgeInsets() )
        {
            /* If you want to use Auto Layout to dynamically calculate the size and position of your view, you must set this property to false.*/
            subview.translatesAutoresizingMaskIntoConstraints = false
            
            let constraintLeading = NSLayoutConstraint(item: subview,
                                                       attribute: .left,
                                                       relatedBy: .equal,
                                                       toItem: self,
                                                       attribute: .left,
                                                       multiplier: 1,
                                                       constant: insets.left)
            
            let constraintTrailing = NSLayoutConstraint(item: self,
                                                        attribute: .right,
                                                        relatedBy: .equal,
                                                        toItem: subview,
                                                        attribute: .right,
                                                        multiplier: 1,
                                                        constant: insets.right)
            
            let constraintTop = NSLayoutConstraint(item: subview,
                                                   attribute: .top,
                                                   relatedBy: .equal,
                                                   toItem: self,
                                                   attribute: .top,
                                                   multiplier: 1,
                                                   constant: insets.top)
            
            let constraintBottom = NSLayoutConstraint(item: self,
                                                      attribute: .bottom,
                                                      relatedBy: .equal,
                                                      toItem: subview,
                                                      attribute: .bottom,
                                                      multiplier: 1,
                                                      constant: insets.bottom)
            
            addConstraints([constraintLeading, constraintTrailing, constraintTop, constraintBottom])
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
