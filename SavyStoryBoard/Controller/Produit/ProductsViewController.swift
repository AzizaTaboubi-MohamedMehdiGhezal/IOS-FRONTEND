//
//  ProductsViewController.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 29/11/2022.
//

import UIKit
import Alamofire

class ProductsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var products: [Product] = []
    
    struct Product : Codable {
        let _id: String
        let nom: String
        let marque: String
        let boutique: String
        let prix: Int
        let annee: Int
        let description: String
        let type: String
        let city: String
    }
    
    struct Products: Codable {
        let Products: [Product]
    }
    
    //var arrProd = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.register(UINib(nibName: "myCell", bundle: nil), forCellReuseIdentifier: "myCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        AF.request("\(Constants.BASE_URL)produit/produits", method: .get, encoding: JSONEncoding.default).responseDecodable(of: Products.self) { response in
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
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CustomCell
        customCell.nomP.text = products[indexPath.row].nom
        customCell.marqueP.text = products[indexPath.row].marque
        customCell.boutiqueP.text = products[indexPath.row].boutique
        customCell.prixP.text = String(products[indexPath.row].prix)
        customCell.editBtn.tag = indexPath.row
        customCell.editBtn.addTarget(self, action: #selector(editProduit), for: .touchUpInside)
        
        return customCell
    }
    
    @objc func editProduit(sender: UIButton) {
        let row = sender.tag
        let addViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        addViewController.produit = products[row]
        self.navigationController?.pushViewController(addViewController, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return products.count
//    }
//
//   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
//        cell.products.text = products[indexPath.row]
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        arrProd.swapAt(sourceIndexPath.row, destinationIndexPath.row)
//    }
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
//            (action, view, completionHandler) in self.arrProd.remove(at: indexPath.row)
//            tableView.beginUpdates()
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//            tableView.endUpdates()
//            completionHandler(true)
//        }
//        return UISwipeActionsConfiguration(actions: [deleteAction])
//    }
}

