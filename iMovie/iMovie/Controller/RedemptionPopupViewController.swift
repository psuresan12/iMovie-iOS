//
//  RedemptionPopupViewController.swift
//  iMovie
//
//  Created by pratap surendran ganesan on 26/8/17.
//  Copyright © 2017 pratap surendran ganesan. All rights reserved.
//

import UIKit

class RedemptionPopupViewController: UIViewController {
    
    let currentUser: UserDetail = UserDetail.sharedInstance

    @IBOutlet weak var pointDisplay: UILabel!
    @IBOutlet weak var pointsToRedeem: UITextField!
    @IBOutlet weak var redemptionPopupView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        redemptionPopupView.layer.cornerRadius = 10
        redemptionPopupView.layer.masksToBounds = true
        pointDisplay.text = "Available points is \(currentUser.getPoints())"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelPopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func redeemPoints(_ sender: Any) {
        
        if(currentUser.getPoints() >= Int(pointsToRedeem.text!)!){
            currentUser.decreasePoints(pts: Int(pointsToRedeem.text!)!)
            dismiss(animated: true, completion: nil)
            
            
        }
        
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
