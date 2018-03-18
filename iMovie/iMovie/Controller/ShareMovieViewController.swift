//
//  ShareMovieViewController.swift
//  iMovie
//
//  Created by pratap surendran ganesan on 26/8/17.
//  Copyright © 2017 pratap surendran ganesan. All rights reserved.
//

import UIKit

class ShareMovieViewController: UIViewController {

    let currentUser: UserDetail = UserDetail.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func shareMovie(_ sender: Any) {
       
        currentUser.increasePoints(pts: currentUser.sharePoints)
        dismiss(animated: true, completion: nil)
            
            
       
    }
    
    
    @IBAction func closeSharePopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
