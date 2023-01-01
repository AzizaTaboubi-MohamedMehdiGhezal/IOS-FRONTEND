//
//  ProductsViewController.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 29/11/2022.
//

import UIKit
import Alamofire
import MBProgressHUD

class UserProductsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var products: [Product] = []

    
    //var arrProd = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        MBProgressHUDUtils.mbProgressHUB(vc: self, text: "Loading ...")
        
//        tableView.register(UINib(nibName: "myCell", bundle: nil), forCellReuseIdentifier: "myCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        AF.request("\(Constants.BASE_URL)produit/getByUserID/\(appDelegate?.user?.user._id ?? "")", method: .get, encoding: JSONEncoding.default).responseDecodable(of: Products.self) { response in
            switch response.result {
            case .success(let prodResponse):
                print(prodResponse)
                let code = response.response?.statusCode
                if (code == 200) {
                    self.products = prodResponse.Products
                    MBProgressHUDUtils.hideMBProgressHUB(vc: self)
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
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CustomCell
        let product = products[indexPath.row]
        customCell.nomP.text = product.nom
        customCell.prixP.text = "\(String(product.prix)) TND"
        customCell.boutiqueLbl.text = product.marque
        customCell.typeLbl.text = product.type
        
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
    
    func editProduit(row: Int) {
        let addViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        addViewController.produit = products[row]
        self.navigationController?.pushViewController(addViewController, animated: true)
    }
    
    func deleteProduit(indexPath: IndexPath) {
        let deleteRequest = DeleteRequest(_id: products[indexPath.row]._id)
        if let data = try? JSONEncoder().encode(deleteRequest) {
            if let dictionary = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any] {
                AF.request("\(Constants.BASE_URL)produit/delete_prod", method: .post, parameters: dictionary, encoding: JSONEncoding.default).responseDecodable(of: Products.self) { response in
                    switch response.result {
                    case .success(let prodResponse):
                        print(prodResponse)
                    case .failure(let error):
                        print(error)
                        }
                    
                    }
            }
        }
        products.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (action, sourceView, completionHandler) in

            let product = self.products[indexPath.row] as Product
            // Delete the book and associated records
            self.deleteProduit(indexPath: indexPath)
            // Remove the menu option from the screen
            completionHandler(true)
        } // end action Delete

        
        let editAction = UIContextualAction(style: .normal, title: "Edit") {
            (action, sourceView, completionHandler) in
            self.editProduit(row: indexPath.row)
            completionHandler(true)

        }
        
        editAction.backgroundColor = UIColor(red: 255/255.0, green: 128.0/255.0, blue: 0.0, alpha: 1.0)
    
        // SWIPE TO LEFT CONFIGURATION
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
        // Delete should not delete automatically
        swipeConfiguration.performsFirstActionWithFullSwipe = false
        
        return swipeConfiguration
    }


}
