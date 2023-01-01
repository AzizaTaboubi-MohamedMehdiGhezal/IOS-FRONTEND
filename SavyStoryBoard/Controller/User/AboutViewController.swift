//
//  AboutViewController.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 11/12/2022.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var numTelLbl: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        userNameLbl.text = "User name: \(appDelegate.user?.user.fullname ?? "")"
        userNameLbl.text = appDelegate.user?.user.fullname ?? ""
        emailLbl.text = appDelegate.user?.user.email ?? ""
        numTelLbl.text = appDelegate.user?.user.numTel ?? ""
        
        myImage.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        myImage.layer.shadowOffset = CGSize(width: 6.0, height: 6.0)
        myImage.layer.shadowOpacity = 1.0
        myImage.layer.shadowRadius = 2.0
        myImage.layer.masksToBounds = false
        myImage.layer.cornerRadius = 4.0
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
