//
//  ProductsViewController.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 23/12/2022.
//

import UIKit
import Alamofire

class ProductsViewController: UIViewController, UISearchResultsUpdating {
    
    @IBOutlet weak var tableView: UITableView!
    
    var products: [UserProductsViewController.Product] = []
    var filteredProducts: [UserProductsViewController.Product] = []
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
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.delegate = self
        // Place the search bar in the navigation bar.
        navigationItem.searchController = searchController
        
        // Make the search bar always visible.
        navigationItem.hidesSearchBarWhenScrolling = true
        
        definesPresentationContext = true
    
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
                    self.filteredProducts.removeAll()
                    self.filteredProducts.append(contentsOf: self.products)
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
        filteredProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CustomCell
        let product = filteredProducts[indexPath.row]
        customCell.nomP.text = product.nom
        customCell.prixP.text = "\(String(product.prix)) TND"
        customCell.boutiqueLbl.text = product.marque
        if let promo = product.promo {
            customCell.promoLbl.isHidden = false
            customCell.promoLbl.text = "-\(promo)%"
        } else {
            customCell.promoLbl.isHidden = true
        }
        if let image = product.image {
            if (image != "") {
                AF.request("\(Constants.BASE_URL)images/\(image)").responseData { (response) in
                    switch response.result {
                    case .success(let data):
                        customCell.productImgView.image = UIImage(data: data)
                    case .failure(let error):
                        print(error)
                        customCell.productImgView.image = UIImage(named: "audio")
                    }
                }
            }
        }
        return customCell
    }
}

extension ProductsViewController: UISearchControllerDelegate, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        let strippedString = searchController.searchBar.text ?? ""
        filteredProducts.removeAll()
        filteredProducts.append(contentsOf: self.products.filter({ product in
            product.nom.lowercased().contains(strippedString.lowercased())
        }))
        tableView.reloadData()
    }
    
}
