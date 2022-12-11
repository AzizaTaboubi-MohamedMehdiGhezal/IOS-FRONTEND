//
//  SingUpViewController.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 19/11/2022.
//

import UIKit
import Alamofire
import GoogleSignIn

class SingUpViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBOutlet weak var googleLogin: UIButton!
    
    let signInConfig = GIDConfiguration(clientID: "543276089041-hvh1dtd8b5alv7smlf62d620isgpjhu1.apps.googleusercontent.com")
    
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
    
    public class SingUpRequest: Codable {
        let email: String
        let password: String
        let numTel: String
        let fullname: String
    
        public init(email: String, password: String, numTel: String, fullname: String) {
            self.email = email
            self.password = password
            self.numTel = numTel
            self.fullname = fullname
        }
    }

    @IBAction func tapGoogle(_ sender: Any) {
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            
        }
    }
    
}
