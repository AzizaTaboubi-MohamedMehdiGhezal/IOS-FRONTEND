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
    
    var email: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapLogin(_ sender: Any) {
        let rest = code.text ?? ""
        
        let forgotPwRequest = confirmOTPRequest(otp: rest, email: email)
        AF.request("\(Constants.BASE_URL)user/ConfirmationOtp1", method: .post, parameters: forgotPwRequest.getDictionary(), encoding: JSONEncoding.default).responseJSON { response in
            print(response.data)
            if (response.response?.statusCode == 200) {
                let resetPasswdVC = self.storyboard?.instantiateViewController(withIdentifier: "resetPasswdVC") as! ResetPasswordViewController
                resetPasswdVC.otp = rest
                resetPasswdVC.email = self.email
                self.navigationController?.pushViewController(resetPasswdVC, animated: true)
            }
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
