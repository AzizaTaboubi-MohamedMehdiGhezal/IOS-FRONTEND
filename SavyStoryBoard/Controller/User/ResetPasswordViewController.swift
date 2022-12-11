//
//  ResetPasswordViewController.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 28/11/2022.
//

import UIKit
import Alamofire

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var newPass: UITextField!
    @IBOutlet weak var confPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapLogin(_ sender: Any) {
        let new = newPass.text ?? ""
        let conf = confPass.text ?? ""
        
        let restPassRequest = RestPassRequest(new: new, conf: conf)
        if let data = try? JSONEncoder().encode(restPassRequest) {
            if let dictionary = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
                AF.request("\(Constants.BASE_URL)user/ResetPassword", method: .post, parameters: dictionary, encoding: JSONEncoding.default).responseJSON { response in
                    print(response.data)
                }
            }
        }
        
    }
    
    public class RestPassRequest: Codable {
        let new: String
        let conf: String
    
        public init(new: String, conf:String ) {
            self.new = new
            self.conf = conf
            
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
