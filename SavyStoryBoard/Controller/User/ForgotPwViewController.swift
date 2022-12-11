//
//  ForgotPwViewController.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 20/11/2022.
//

import UIKit
import Alamofire

class ForgotPwViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapLogin(_ sender: Any) {
        let email = emailField.text ?? ""
        
        let forgotPwRequest = ForgotPwRequest(email: email)
        if let data = try? JSONEncoder().encode(forgotPwRequest) {
            if let dictionary = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
                AF.request("\(Constants.BASE_URL)user/forgotPassword", method: .post, parameters: dictionary, encoding: JSONEncoding.default).responseJSON { response in
                    print(response.data)
                }
            }
        }
        
    }
    
    public class ForgotPwRequest: Codable {
        let email: String
        
    
        public init(email: String) {
            self.email = email
        }
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
