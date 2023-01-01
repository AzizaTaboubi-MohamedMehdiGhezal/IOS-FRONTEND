//
//  HomeViewController.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 24/12/2022.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    
    @IBOutlet weak var newsView: UIView!
    @IBOutlet weak var promoView: UIView!
    @IBOutlet weak var allView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsView.clipsToBounds = true
        newsView.layer.cornerRadius = 7
        promoView.clipsToBounds = true
        promoView.layer.cornerRadius = 7
        allView.clipsToBounds = true
        allView.layer.cornerRadius = 7
        
        let allTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(navigateToAll))
        allView.addGestureRecognizer(allTapRecognizer)
        let newsTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(navigateToNews))
        newsView.addGestureRecognizer(newsTapRecognizer)
        let promoTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(navigateToPromo))
        promoView.addGestureRecognizer(promoTapRecognizer)
    }
    
    @objc func navigateToPromo() {
        navigate(filterType: .PROMO)
    }
    
    @objc func navigateToNews() {
        navigate(filterType: .NEW)
    }
    
    @objc func navigateToAll() {
        navigate(filterType: .ALL)
    }
    
    private func navigate(filterType: FilterType) {
        MBProgressHUDUtils.mbProgressHUB(vc: self, text: "Loading...")
        let productsVC = self.storyboard?.instantiateViewController(withIdentifier: "productsVC") as! ProductsViewController
        switch filterType {
        case .NEW:
            productsVC.title = "New products"
        case .PROMO:
            productsVC.title = "Products in sales"
        case .ALL:
            productsVC.title = "All products"
        }
        
        var filter = ""
        switch filterType {
        case .NEW:
            filter = "nouveau"
        case .PROMO:
            filter = "promotion"
        case .ALL:
            filter = ""
        }
        AF.request("\(Constants.BASE_URL)produit/produits?filter=\(filter)", method: .get, encoding: JSONEncoding.default).responseDecodable(of: Products.self) { response in
            MBProgressHUDUtils.hideMBProgressHUB(vc: self)
            switch response.result {
            case .success(let prodResponse):
                print(prodResponse)
                let code = response.response?.statusCode
                if (code == 200) {
                    productsVC.products = prodResponse.Products
                    self.navigationController?.pushViewController(productsVC, animated: true)
                } else {
                    //mat3adihouch
                    print("fail to connect")
                }
            case .failure(let error):
                print(error)
                //mat3adihouch
                }
            
            }
        
    }
    
    enum FilterType {
        case NEW
        case PROMO
        case ALL
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
