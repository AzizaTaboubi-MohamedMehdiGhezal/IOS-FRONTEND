//
//  AddViewController.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 28/11/2022.
//

import UIKit
import Alamofire

class AddViewController: UIViewController {

    
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
    
    private var typeTxt: String = ""
    private var etatTxt: String = ""
    private var cityTxt: String = ""

    var produit: ProductsViewController.Product?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nom.center.x = self.view.frame.width + 50
        UIView.animate(withDuration: 1.0, delay: 00, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .allowAnimatedContent, animations: {
            self.nom.center.x = self.view.frame.width / 2
        }, completion: nil)
        
        let typeChosen = { (action: UIAction) in
            print(action.title)
            self.typeTxt = action.title
        }
        type.menu = UIMenu(children: [
             UIAction(title: "tablette", handler: typeChosen),
             UIAction(title: "mobile", handler: typeChosen),
             UIAction(title: "tv", handler: typeChosen),
             UIAction(title: "consol", handler: typeChosen),
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
        let prix = Double(prix.text!)!
        let description = desc.text ?? ""
        let boutique = bou.text ?? ""
        let annee = Int(ann.text!)!
        
        if (produit == nil) {
            let addRequest = AddRequest(nom: nom ,marque: marque, prix: prix, type: typeTxt, description: description, boutique: boutique, annee: annee, etat: "Occasion", city: cityTxt)
            if let data = try? JSONEncoder().encode(addRequest) {
                if let dictionary = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
                    AF.request("\(Constants.BASE_URL)produit/add_prod", method: .post, parameters: dictionary, encoding: JSONEncoding.default).responseJSON { response in
                        print(response.data)
                    }
                }
            }
        } else {
            let updateRequest = UpdateRequest(_id: produit?._id ?? "", nom: nom ,marque: marque, prix: prix, type: typeTxt, description: description, boutique: boutique, annee: annee, etat: etatTxt, city: cityTxt)
            if let data = try? JSONEncoder().encode(updateRequest) {
                if let dictionary = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
                    AF.request("\(Constants.BASE_URL)produit/update_prod", method: .post, parameters: dictionary, encoding: JSONEncoding.default).responseJSON { response in
                        print(response.data)
                    }
                }
            }
        }
    
        
    }
    
    public class AddRequest: Codable {
        let nom: String
        let marque: String
        let prix: Double
        let type: String
        let description: String
        let boutique: String
        let annee: Int
        let etat: String
        let city: String
        
        public init(nom: String, marque: String, prix: Double, type: String, description: String, boutique: String, annee:Int ,etat: String, city: String) {
            self.nom = nom
            self.marque = marque
            self.prix = prix
            self.type = type
            self.description = description
            self.boutique = boutique
            self.annee = annee
            self.etat = etat
            self.city = city
            
            
            
        }
    }
    
    public class UpdateRequest: Codable {
        let _id: String
        let nom: String
        let marque: String
        let prix: Double
        let type: String
        let description: String
        let boutique: String
        let annee: Int
        let etat: String
        let city: String
        
        public init(_id: String, nom: String, marque: String, prix: Double, type: String, description: String, boutique: String, annee:Int ,etat: String, city: String) {
            self._id = _id
            self.nom = nom
            self.marque = marque
            self.prix = prix
            self.type = type
            self.description = description
            self.boutique = boutique
            self.annee = annee
            self.etat = etat
            self.city = city
            
            
            
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
