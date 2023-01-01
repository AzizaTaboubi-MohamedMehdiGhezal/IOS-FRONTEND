//
//  TermsAndConditionsViewController.swift
//  SavyStoryBoard
//
//  Created by Aziza Taboubi on 1/1/2023.
//

import UIKit
import WebKit

class TermsAndConditionsViewController: UIViewController {

    @IBOutlet weak var termCondition: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        termCondition.load(URLRequest(url: URL(string: "https://www.app-privacy-policy.com/live.php?token=H1oYqCuk1hDIbxrMx35eR14pEIxR4HDd")!))

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
