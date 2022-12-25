//
//  AddViewController.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 28/11/2022.
//

import UIKit
import Alamofire

class AddViewController: UIViewController {

    
    @IBOutlet weak var userImgView: UIImageView!
    @IBOutlet weak var nom: UITextField!
    @IBOutlet weak var mar: UITextField!
    @IBOutlet weak var prix: UITextField!
//    @IBOutlet weak var type: UITextField!
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var bou: UITextField!
    @IBOutlet weak var ann: UITextField!
//    @IBOutlet weak var etat: UITextField!

    
    @IBOutlet weak var type: UIButton!
    @IBOutlet weak var etat: UIButton!
    @IBOutlet weak var city: UIButton!
    @IBOutlet weak var errorLbl: UILabel!
    
    private var typeTxt: String = ""
    private var etatTxt: String = ""
    private var cityTxt: String = ""
    private var imageURL: URL?
    
    var imagePicker = UIImagePickerController()

    var produit: UserProductsViewController.Product?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nom.center.x = self.view.frame.width + 50
        UIView.animate(withDuration: 1.0, delay: 00, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .allowAnimatedContent, animations: {
            self.nom.center.x = self.view.frame.width / 2
        }, completion: nil)
        
        mar.center.x = self.view.frame.width + 50
        UIView.animate(withDuration: 1.0, delay: 00, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .allowAnimatedContent, animations: {
            self.mar.center.x = self.view.frame.width / 2
        }, completion: nil)
        
        prix.center.x = self.view.frame.width + 50
        UIView.animate(withDuration: 1.0, delay: 00, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .allowAnimatedContent, animations: {
            self.prix.center.x = self.view.frame.width / 2
        }, completion: nil)
        
        desc.center.x = self.view.frame.width + 50
        UIView.animate(withDuration: 1.0, delay: 00, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .allowAnimatedContent, animations: {
            self.desc.center.x = self.view.frame.width / 2
        }, completion: nil)
        
        ann.center.x = self.view.frame.width + 50
        UIView.animate(withDuration: 1.0, delay: 00, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .allowAnimatedContent, animations: {
            self.ann.center.x = self.view.frame.width / 2
        }, completion: nil)
        
        bou.center.x = self.view.frame.width + 50
        UIView.animate(withDuration: 1.0, delay: 00, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .allowAnimatedContent, animations: {
            self.bou.center.x = self.view.frame.width / 2
        }, completion: nil)
        
        
        let typeChosen = { (action: UIAction) in
            print(action.title)
            self.typeTxt = action.title
        }
        type.menu = UIMenu(children: [
             UIAction(title: "tablette", handler: typeChosen),
             UIAction(title: "mobile", handler: typeChosen),
             UIAction(title: "tv", handler: typeChosen),
             UIAction(title: "console", handler: typeChosen),
             UIAction(title: "laptop", handler: typeChosen),
             UIAction(title: "desktop", handler: typeChosen),
             UIAction(title: "camera", handler: typeChosen),
             UIAction(title: "mouse", handler: typeChosen),
             UIAction(title: "audio", handler: typeChosen),
             UIAction(title: "keyboard", handler: typeChosen),
             UIAction(title: "smartwatch", handler: typeChosen),
             UIAction(title: "fridge", handler: typeChosen),
             UIAction(title: "other", handler: typeChosen)
           ])
        
        type.menu?.children.forEach({ menuItem in
            if let menuItem = menuItem as? UIAction {
                if (menuItem.title == produit?.type) {
                    menuItem.state = .on
                } else {
                    menuItem.state = .off
                }
            }
        })
        
        typeTxt = produit?.type ?? ""
        cityTxt = produit?.city ?? ""
        if (produit == nil) {
            typeTxt = "tablette"
            cityTxt = "Ariana"
        }
        
        let etatChosen = { (action: UIAction) in
            print(action.title)
            self.typeTxt = action.title
        }
        etat.menu = UIMenu(children: [
             UIAction(title: "Occasion", state: .on, handler: etatChosen)
           ])

        nom.text = produit?.nom
        mar.text = produit?.marque
        prix.text = String(produit?.prix ?? 0)
        bou.text = produit?.boutique
        desc.text = produit?.description
        ann.text = String(produit?.annee ?? 0)
        
        if (produit?.image ?? "") != "" {
            AF.request("\(Constants.BASE_URL)images/\(produit?.image ?? "")").responseData { (response) in
                switch response.result {
                case .success(let data):
                    self.userImgView.image = UIImage(data: data)
                case .failure(let error):
                    print(error)
                    self.userImgView.image = UIImage(named: "iconUser")
                }
            }
        }
        
        
        let cityChosen = { (action: UIAction) in
            print(action.title)
            self.cityTxt = action.title
        }
        city.menu = UIMenu(children: [
             UIAction(title: "Ariana", handler: cityChosen),
             UIAction(title: "Beja", handler: cityChosen),
             UIAction(title: "Ben Arous", handler: cityChosen),
             UIAction(title: "Bizert", handler: cityChosen),
             UIAction(title: "Gabes", handler: cityChosen),
             UIAction(title: "Gafsa", handler: cityChosen),
             UIAction(title: "Jendouba", handler: cityChosen),
             UIAction(title: "Kairaouan", handler: cityChosen),
             UIAction(title: "Kasserine", handler: cityChosen),
             UIAction(title: "Kebili", handler: cityChosen),
             UIAction(title: "Kef", handler: cityChosen),
             UIAction(title: "Mahdia", handler: cityChosen),
             UIAction(title: "Manouba", handler: cityChosen),
             UIAction(title: "Medenine", handler: cityChosen),
             UIAction(title: "Monastir", handler: cityChosen),
             UIAction(title: "Nabeul", handler: cityChosen),
             UIAction(title: "Sfax", handler: cityChosen),
             UIAction(title: "Sidi Bouzid", handler: cityChosen),
             UIAction(title: "Siliana", handler: cityChosen),
             UIAction(title: "Sousse", handler: cityChosen),
             UIAction(title: "Tataouine", handler: cityChosen),
             UIAction(title: "Tozeur", handler: cityChosen),
             UIAction(title: "Tunis", handler: cityChosen),
             UIAction(title: "Zaghouan", handler: cityChosen)
           ])
        
        city.menu?.children.forEach({ menuItem in
            if let menuItem = menuItem as? UIAction {
                if (menuItem.title == produit?.city) {
                    menuItem.state = .on
                } else {
                    menuItem.state = .off
                }
            }
        })
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapLogin(_ sender: Any) {
        let nom = nom .text ?? ""
        let marque = mar.text ?? ""
        let prix = prix.text ?? "0"
        let description = desc.text ?? ""
        let boutique = bou.text ?? ""
        let annee = ann.text ?? "0"
        
        if (produit == nil) {
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            let userID = appDelegate?.user?.user._id ?? ""
            
            AF.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(Data(userID.utf8), withName: "userID")
                multipartFormData.append(Data(nom.utf8), withName: "nom")
                multipartFormData.append(Data(marque.utf8), withName: "marque")
                multipartFormData.append(Data(prix.utf8), withName: "prix")
                multipartFormData.append(Data(description.utf8), withName: "description")
                multipartFormData.append(Data(boutique.utf8), withName: "boutique")
                multipartFormData.append(Data(annee.utf8), withName: "annee")
                multipartFormData.append(Data(self.typeTxt.utf8), withName: "type")
                multipartFormData.append(Data(self.cityTxt.utf8), withName: "city")
                multipartFormData.append(Data("Occasion".utf8), withName: "etat")
                if let url = self.imageURL {
                    multipartFormData.append(url, withName: "image")
                }
            }, to: "\(Constants.BASE_URL)produit/add_prod").responseJSON { response in
                print(response)
                if (response.response?.statusCode == 200) {
                    self.navigationController?.popViewController(animated: true)
                } else {
                    self.errorLbl.isHidden = false
                }
            }
        } else {
            AF.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(Data((self.produit?._id ?? "").utf8), withName: "_id")
                multipartFormData.append(Data(nom.utf8), withName: "nom")
                multipartFormData.append(Data(marque.utf8), withName: "marque")
                multipartFormData.append(Data(prix.utf8), withName: "prix")
                multipartFormData.append(Data(description.utf8), withName: "description")
                multipartFormData.append(Data(boutique.utf8), withName: "boutique")
                multipartFormData.append(Data(annee.utf8), withName: "annee")
                multipartFormData.append(Data(self.typeTxt.utf8), withName: "type")
                multipartFormData.append(Data(self.cityTxt.utf8), withName: "city")
                multipartFormData.append(Data("Occasion".utf8), withName: "etat")
                if let url = self.imageURL {
                    multipartFormData.append(url, withName: "image")
                }
            }, to: "\(Constants.BASE_URL)produit/update_prod").responseJSON { response in
                print(response)
                if (response.response?.statusCode == 200) {
                    self.navigationController?.popViewController(animated: true)
                } else {
                    self.errorLbl.isHidden = false
                }
            }
        }
    }
    
    @IBAction func editImageTap(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")

            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false

            present(imagePicker, animated: true, completion: nil)
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

extension AddViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            userImgView.image = image
            imageURL = info[UIImagePickerController.InfoKey.imageURL] as? URL
          }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("x")
    }
}
