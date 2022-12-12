//
//  UsedProdViewController.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 5/12/2022.
//

import UIKit

class UsedProdViewController: UIViewController {

    
    @IBOutlet weak var type: UIButton!
    @IBOutlet weak var nom: UIButton!
    @IBOutlet weak var annee: UIButton!
    @IBOutlet weak var city: UIButton!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func changeValue(_ sender: Any) {
        price.text = "\(String(Int(slider.value))) TND"
    }
    
    private var typeTxt: String = ""
    private var nomTxt: String = ""
    private var anneeTxt: String = ""
    private var cityTxt: String = ""
    
    var produit: ProductsViewController.Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.maximumValue = 5000
        slider.minimumValue = 0
        
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
        
        let anneeChosen = { (action: UIAction) in
            print(action.title)
            self.anneeTxt = action.title
        }
        annee.menu = UIMenu(children: [
             UIAction(title: "2022", handler: anneeChosen),
             UIAction(title: "2021", handler: anneeChosen),
             UIAction(title: "2020", handler: anneeChosen),
             UIAction(title: "2019", handler: anneeChosen),
             UIAction(title: "2018", handler: anneeChosen),
             UIAction(title: "2017", handler: anneeChosen),
             UIAction(title: "2016", handler: anneeChosen),
             UIAction(title: "2015", handler: anneeChosen),
             UIAction(title: "2014", handler: anneeChosen),
             UIAction(title: "2013", handler: anneeChosen),
             UIAction(title: "2012", handler: anneeChosen),
             UIAction(title: "2011", handler: anneeChosen),
             UIAction(title: "2010", handler: anneeChosen),
             UIAction(title: "2009", handler: anneeChosen),
             UIAction(title: "2008", handler: anneeChosen),
             UIAction(title: "2007", handler: anneeChosen),
             UIAction(title: "2006", handler: anneeChosen)
           ])
        annee.menu?.children.forEach({ menuItem in
            if let menuItem = menuItem as? UIAction {
                if (Int(menuItem.title) == produit?.annee) {
                    menuItem.state = .on
                } else {
                    menuItem.state = .off
                }
            }
        })
        
        
        typeTxt = produit?.type ?? ""
        nomTxt = produit?.nom ?? ""
//        anneeTxt = produit?.annee ?? ""
        cityTxt = produit?.city ?? ""
        
        if (produit == nil) {
            typeTxt = "tablette"
            cityTxt = "Ariana"
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
