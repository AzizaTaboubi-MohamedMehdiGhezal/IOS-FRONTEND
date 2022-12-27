//
//  HomeViewController.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 24/12/2022.
//

import UIKit

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
        navigate(filter: .PROMO)
    }
    
    @objc func navigateToNews() {
        navigate(filter: .NEW)
    }
    
    @objc func navigateToAll() {
        navigate(filter: .ALL)
    }
    
    private func navigate(filter: ProductsViewController.FilterType) {
        let productsVC = self.storyboard?.instantiateViewController(withIdentifier: "productsVC") as! ProductsViewController
        productsVC.filterType = filter
        self.navigationController?.pushViewController(productsVC, animated: true)
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
