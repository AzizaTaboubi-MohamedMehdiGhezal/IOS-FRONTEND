//
//  DetailsProdViewController.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 29/12/2022.
//

import UIKit
import Alamofire

class DetailsProdViewController: UIViewController {
    
    var productID: String? = nil {
        didSet {
            fetchProduct()
        }
    }
    
    @IBOutlet weak var imgProd: UIImageView!
    @IBOutlet weak var prodNameLbl: UILabel!
    @IBOutlet weak var marqueLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var etatLbl: UILabel!
    
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var numTelLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    private func fetchProduct() {
        AF.request("\(Constants.BASE_URL)produit/\(productID ?? "")", encoding: JSONEncoding.default).responseDecodable(of: ProductWithUser.self) { [self] response in
            switch response.result {
            case .success(let productWithUser):
                let product = productWithUser.product
                let user = productWithUser.user
                prodNameLbl.text = product.nom
                marqueLbl.text = product.marque
                priceLbl.text = "\(product.prix)TND"
                typeLbl.text = product.type
                yearLbl.text = "\(product.annee)"
                etatLbl.text = product.etat
                userNameLbl.text = user.fullname
                numTelLbl.text = user.numTel
                cityLbl.text = product.city
                
                imgUser.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
                imgUser.layer.shadowOffset = CGSize(width: 6.0, height: 6.0)
                imgUser.layer.shadowOpacity = 1.0
                imgUser.layer.shadowRadius = 2.0
                imgUser.layer.masksToBounds = false
                imgUser.layer.cornerRadius = 4.0
                
                imgProd.clipsToBounds = true
                imgProd.layer.cornerRadius = 7
                
                ImageUtils.getImage(imageURL: product.image) { result in
                    switch result {
                    case .success(let data):
                        self.imgProd.image = UIImage(data: data)
                    case .failure(let error):
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    
}
