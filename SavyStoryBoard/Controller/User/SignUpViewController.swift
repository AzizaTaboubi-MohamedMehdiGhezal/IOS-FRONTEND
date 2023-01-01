//
//  SingUpViewController.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 19/11/2022.
//

import UIKit
import Alamofire
import GoogleSignIn
import WebKit
import SafariServices

class SingUpViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBOutlet weak var googleLogin: UIButton!
    
    let signInConfig = GIDConfiguration(clientID: "543276089041-hvh1dtd8b5alv7smlf62d620isgpjhu1.apps.googleusercontent.com")
   
   
    
   // @IBAction func termcond(_ sender: Any) {
     //   let vc = SFSafariViewController(url: URL(string: "https://www.app-privacy-policy.com/live.php?token=H1oYqCuk1hDIbxrMx35eR14pEIxR4HDd")!)
        //present(vc, animated: true)
    //}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapLogin(_ sender: Any) {
        let fullName = usernameField.text ?? ""
        let numTel = phoneField.text ?? ""
        let email = emailField.text ?? ""
        let password = passwordField.text ?? ""
        
        let signUpRequest = SingUpRequest(email: email, password: password, numTel: numTel, fullname: fullName)
        if let data = try? JSONEncoder().encode(signUpRequest) {
            if let dictionary = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
                AF.request("\(Constants.BASE_URL)user/register", method: .post, parameters: dictionary, encoding: JSONEncoding.default).responseJSON { response in
                    switch response.result {
                    case .success(let data):
                        print(data)
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
        
    }
    

    @IBAction func tapGoogle(_ sender: Any) {
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            
        }
    }
    
}
