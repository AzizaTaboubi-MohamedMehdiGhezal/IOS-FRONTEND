//
//  ViewMenuController.swift
//  Savy
//
//  Created by ghezal0n on 13/11/2022.
//

import UIKit

class ViewMenuController: UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrIcons = ["tv","laptop","desktop","phone1","tablet","camera","console","mouse","audio","keyborad","smartwatch","other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        collectionView.delegate = self
        //        collectionView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

    extension ViewMenuController: UICollectionViewDelegate, UICollectionViewDataSource{
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return arrIcons.count
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "iconCell", for: indexPath) as! IconCollectionViewCell
        //let icon = arrIcons[indexPath.row]
        //cell.setupCell(photo: icon.photo, cat: icon.cat)
        cell.imgicon.image = UIImage(named: arrIcons[indexPath.row])
        cell.labelicon.text = arrIcons[indexPath.row]
        
        //cell.imageDetail.tag = indexPath.row
        //cell.imageDetail.addTarget(self, action: #selector(viewdetail), for: .touchUpInside)
//        @objc func viewdetail(sender:UIButton){
//            let indexpath1 = indexPath(row: sender.tag, section : 0)
//            let home = self.storyboard?.instantiateViewController(withIdentifier: "IconDetailViewController") as! IconDetailViewController
//            home.sproduct = arrIcons[indexpath1.row]
//        }
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "IconDetailViewController") as? IconDetailViewController
        vc?.name = arrIcons[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
        }
    
//    struct Icons {
//        let photo : UIImage
//        let cat : String
//    }
    
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//
    
}
