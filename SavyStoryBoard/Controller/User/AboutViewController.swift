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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        userNameLbl.text = "User name: \(appDelegate.user?.user.fullname ?? "")"
        emailLbl.text = "Email: \(appDelegate.user?.user.email ?? "")"
        numTelLbl.text = "Phone number: \(appDelegate.user?.user.numTel ?? "")"
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
