//
//  AiringTableTableViewController.swift
//  iMovie
//
//  Created by pratap surendran ganesan on 27/8/17.
//  Copyright © 2017 pratap surendran ganesan. All rights reserved.
//

import UIKit

class AiringTableTableViewController: UITableViewController,FavoriteDelegate {
   
    var movieAPI: MovieAPI = MovieAPI.shared
    
    
    var cell: AiringMovieTableViewCell?
    var row :Int?
    
   

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
         movieAPI.loadAiringShows()
        
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let airingShows = movieAPI.airingShows
        return airingShows.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         cell = tableView.dequeueReusableCell(withIdentifier: "AiringMovieCell", for: indexPath) as! AiringMovieTableViewCell
        
        //duplicate variables, why not declare it as global variable
        let airingShows = movieAPI.airingShows

        // Configure the cell..
        cell?.airingMovieTitle.text = airingShows[indexPath.row].name
        cell?.airingMovieImage.image = movieAPI.imageCache[airingShows[indexPath.row].imageName]
        cell?.checkLikeStatus(movieName: airingShows[indexPath.row].name)
        // cell.airingMovieImage.image = UIImage(named: MovieList.getList()[indexPath.row].imageName)
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // print("\(movieList[indexPath.row])");
          self.performSegue(withIdentifier: "showDetail", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        print("am segue")
        if segue.identifier == "showDetail"{
            print("entered")
            let indexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
            let movieDetail = segue.destination as! ShowDetailViewController
            //duplicate variables, why not declare it as global variable
            let airingShows = movieAPI.airingShows
            //set delegate
            movieDetail.AiringTableTableViewController = self
            
            movieDetail.getMovieTitle  = airingShows[indexPath.row].name
            movieDetail.getMovieImage =  movieAPI.imageCache[airingShows[indexPath.row].imageName]!
            movieDetail.getMovieOverview = airingShows[indexPath.row].overview
            movieDetail.getMovieTrailor = airingShows[indexPath.row].trailorID!
            movieDetail.getMovieId = airingShows[indexPath.row].id
            movieDetail.getRating = airingShows[indexPath.row].rating
            movieDetail.getTableIndex = indexPath.row
            movieDetail.getImageURL = airingShows[indexPath.row].imageName

        }
    }
    
    
    func setLike(path : Int){
        cell?.setLike()
        updateCell(path: path)
        
    }
    
    
    func setUnLike(path: Int){
        
        cell?.setUnLike()
        updateCell(path: path)
        
    }
    
    
    func updateCell(path:Int){
        let indexPath = IndexPath(item: path, section: 0)
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
        reloadInputViews()
       
        
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
