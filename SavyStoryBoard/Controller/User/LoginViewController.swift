//
//  LoginViewController.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 19/11/2022.
//

import UIKit
import Alamofire
import LocalAuthentication

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var loginErrorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefault = UserDefaults.standard
        if let data = userDefault.data(forKey: "user") {
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(LoginResponse.self, from: data)
                let appDelegate = UIApplication.shared.delegate as? AppDelegate
                appDelegate?.user = user
                self.performSegue(withIdentifier: "loginSegue", sender: self)
            } catch {
                print("Unable to Decode user (\(error))")
            }
        }


        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func faceId(_ sender: Any) {
        authenticate()
    }
    
    private func authenticate(){
        let context = LAContext()
        var error:NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            let reason = "explantion for authentication"
            
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason){
                success, AuthenticationError in
                
                if success{
//                    DispatchQueue.main.async {
//                        //self.alert(with: "Authentication success !!")
//                        guard let HOME = UIStoryboard(name: "¨¨¨¨¨¨", bundle: nil).instantiateViewController(withIdentifier: "Home") as? HOME else{
//                            fatalError()
//                        }
//                        Home.modalPresentationStyle = .fullScreen
//                        self.present(HOME, animated: true, completion: nil)
//                    }
//
                }else{
                    print("Authentication failure")
                }
            }
        }else{
            alert(with: "Authentication not avalible")
        }
    }
    
    private func alert(with message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated:  true, completion: nil)
    }
    
    @IBAction func tapLogin(_ sender: Any) {
        let email = emailField.text ?? ""
        let password = passwordField.text ?? ""
        let loginRequest = LoginRequest(email: email, password: password)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if let data = try? JSONEncoder().encode(loginRequest) {
            if let dictionary = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
                AF.request("\(Constants.BASE_URL)user/login", method: .post, parameters: dictionary, encoding: JSONEncoding.default).responseDecodable(of: LoginResponse.self) { response in
                    switch response.result {
                    case .success(let loginResponse):
                        print(loginResponse)
                        let code = response.response?.statusCode
                        if (code == 200) {
                            //3adih
                            appDelegate.user = loginResponse
                            self.performSegue(withIdentifier: "loginSegue", sender: self)
                        } else {
                            //mat3adihouch
                            print("fail to connect")
                            appDelegate.user = nil
                            self.loginErrorLbl.isHidden = false
                        }
                    case .failure(let error):
                        print(error)
                        appDelegate.user = nil
                        self.loginErrorLbl.isHidden = false
                        //mat3adihouch
                    }
                }
            }
        }
        
        
        
    }
    
    
    public class LoginRequest: Codable {
        let email: String
        let password: String
    
        public init(email: String, password: String) {
            self.email = email
            self.password = password
        }
    }
    
    public class LoginResponse: Codable {
        let token: String
        let user: User
    }
    
    public class User: Codable {
        let _id: String
        let numTel: String
        let fullname: String
        let email: String
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
