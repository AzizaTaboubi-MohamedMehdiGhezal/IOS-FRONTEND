//
//  ProfilViewController.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 25/11/2022.
//

import UIKit

class ProfilViewController: UIViewController {

    @IBOutlet weak var SliderView: UICollectionView!
    @IBOutlet weak var PageView: UIPageControl!
    
    var img = [
                UIImage(named: "jumia"),
                UIImage(named: "istore"),
                UIImage(named: "mytek"),
                UIImage(named: "numedia"),
                UIImage(named: "oxtek"),
                UIImage(named: "sbs"),
                UIImage(named: "scoopinfo"),
                UIImage(named: "spacenet"),
                UIImage(named: "tayara"),
                UIImage(named: "tunisianet"),
                UIImage(named: "vongo"),
                UIImage(named: "wiki"),
                UIImage(named: "tdiscount"),
              ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if (appDelegate.user == nil) {
            self.dismiss(animated: false)
        }
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .plain, target: self, action: #selector(didTapSignout))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func didTapSignout() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.user = nil
        self.dismiss(animated: true)
    }

}

extension ProfilViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return img.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let vc = cell.viewWithTag(111) as? UIImageView{
            vc.image = img[indexPath.row]
        }
        else
        if let ab = cell.viewWithTag(222) as? UIPageControl{
            ab.currentPage = indexPath.row
        }
        return cell
    }
    
}
