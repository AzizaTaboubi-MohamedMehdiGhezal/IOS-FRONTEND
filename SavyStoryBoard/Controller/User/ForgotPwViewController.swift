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
        AF.request("\(Constants.BASE_URL)user/forgotPassword", method: .post, parameters: forgotPwRequest.getDictionary(), encoding: JSONEncoding.default).responseJSON { response in
            print(response.data)
            let confirmationOTPVC = self.storyboard?.instantiateViewController(withIdentifier: "ConfirmationOTPViewController") as! ConfirmationOTPViewController
            confirmationOTPVC.email = email
            self.navigationController?.pushViewController(confirmationOTPVC, animated: true)
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
