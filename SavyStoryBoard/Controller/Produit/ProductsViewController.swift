//
//  ProductsViewController.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 23/12/2022.
//

import UIKit
import Alamofire

class ProductsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var products: [UserProductsViewController.Product] = []
    var filterType: FilterType = .ALL
    
    enum FilterType {
        case NEW
        case PROMO
        case ALL
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.delegate = self
        tableView.dataSource = self
        
        switch filterType {
        case .NEW:
            self.title = "New products"
        case .PROMO:
            self.title = "Products in sales"
        case .ALL:
            self.title = "All products"
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var filter = ""
        switch self.filterType {
        case .NEW:
            filter = "nouveau"
        case .PROMO:
            filter = "promotion"
        case .ALL:
            filter = ""
        }
        AF.request("\(Constants.BASE_URL)produit/produits?filter=\(filter)", method: .get, encoding: JSONEncoding.default).responseDecodable(of: UserProductsViewController.Products.self) { response in
            switch response.result {
            case .success(let prodResponse):
                print(prodResponse)
                let code = response.response?.statusCode
                if (code == 200) {
                    self.products = prodResponse.Products
                    self.tableView.reloadData()
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CustomCell
        let product = products[indexPath.row]
        customCell.nomP.text = product.nom
        customCell.prixP.text = "\(String(product.prix)) TND"
        customCell.boutiqueLbl.text = product.boutique
        if let promo = product.promo {
            customCell.promoLbl.isHidden = false
            customCell.promoLbl.text = "-\(promo)%"
        } else {
            customCell.promoLbl.isHidden = true
        }
        return customCell
    }
}
