//
//  ConfirmationOTPViewController.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 28/11/2022.
//

import UIKit
import Alamofire

class ConfirmationOTPViewController: UIViewController {

    @IBOutlet weak var code: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapLogin(_ sender: Any) {
        let rest = code.text ?? ""
        
        let forgotPwRequest = confirmOTPRequest(rest: rest)
        if let data = try? JSONEncoder().encode(forgotPwRequest) {
            if let dictionary = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
                AF.request("\(Constants.BASE_URL)user/ConfirmationOtp", method: .post, parameters: dictionary, encoding: JSONEncoding.default).responseJSON { response in
                    print(response.data)
                }
            }
        }
        
    }
    
    public class confirmOTPRequest: Codable {
        let rest: String
        
    
        public init(rest: String) {
            self.rest = rest
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
