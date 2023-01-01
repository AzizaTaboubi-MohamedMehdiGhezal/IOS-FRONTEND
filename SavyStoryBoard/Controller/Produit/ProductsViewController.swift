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
    
    var products: [Product] = []
    var filteredProducts: [Product] = []
    
    var vcTitle: String = ""
    
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
        
        self.filteredProducts.removeAll()
        self.filteredProducts.append(contentsOf: self.products)
        self.tableView.reloadData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
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
        
        ImageUtils.getImage(imageURL: product.image) { result in
            switch result {
            case .success(let data):
                customCell.productImgView.image = UIImage(data: data)
            case .failure(let error):
                print(error)
                customCell.productImgView.image = UIImage(named: "audio")
            }
        }
        return customCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        if let productDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "productDetails") as? DetailsProdViewController {
            productDetailsVC.productID = product._id
            self.navigationController?.pushViewController(productDetailsVC, animated: true)
        }
    }
}

extension ProductsViewController: UISearchControllerDelegate, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        let strippedString = searchController.searchBar.text ?? ""
        filteredProducts.removeAll()
        if (strippedString == "") {
            filteredProducts.append(contentsOf: self.products)
        } else {
            filteredProducts.append(contentsOf: self.products.filter({ product in
                product.nom.lowercased().contains(strippedString.lowercased())
            }))
        }
        tableView.reloadData()
    }
    
}
