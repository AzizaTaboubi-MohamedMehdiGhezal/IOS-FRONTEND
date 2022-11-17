//
//  ViewMenuController.swift
//  Savy
//
//  Created by ghezal0n on 13/11/2022.
//

import UIKit

class ViewMenuController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrIcons = [Icons]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        arrIcons.append(Icons(photo: UIImage(named: "tv")!, cat: "TV"))
        arrIcons.append(Icons(photo: UIImage(named: "laptop")!, cat: "LAPTOP"))
        arrIcons.append(Icons(photo: UIImage(named: "desktop")!, cat: "DESKTOP"))
        arrIcons.append(Icons(photo: UIImage(named: "phone1")!, cat: "PHONE"))
        arrIcons.append(Icons(photo: UIImage(named: "tablet")!, cat: "TABLET"))
        arrIcons.append(Icons(photo: UIImage(named: "camera")!, cat: "CAMERA"))
        arrIcons.append(Icons(photo: UIImage(named: "console")!, cat: "CONSOLE"))
        arrIcons.append(Icons(photo: UIImage(named: "mouse")!, cat: "MOUSE"))
        arrIcons.append(Icons(photo: UIImage(named: "audio")!, cat: "AUDIO"))
        arrIcons.append(Icons(photo: UIImage(named: "keyborad")!, cat: "KEYBOARD"))
        arrIcons.append(Icons(photo: UIImage(named: "smartwatch")!, cat: "SMARTWATCH"))
        arrIcons.append(Icons(photo: UIImage(named: "other")!, cat: "MORE"))
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrIcons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "iconCell", for: indexPath) as! IconCollectionViewCell
        let icon = arrIcons[indexPath.row]
        cell.setupCell(photo: icon.photo, cat: icon.cat)
        cell.imgicon.image = arrIcons[indexPath.row].photo
        cell.labelicon.text = arrIcons[indexPath.row].cat
        
        //cell.imageDetail.tag = indexPath.row
        //cell.imageDetail.addTarget(self, action: #selector(viewdetail), for: .touchUpInside)
        
//        @objc func viewdetail(sender:UIButton){
//            let indexpath1 = indexPath(row: sender.tag, section : 0)
//            let home = self.storyboard?.instantiateViewController(withIdentifier: "IconDetailViewController") as! IconDetailViewController
//            home.sproduct = arrIcons[indexpath1.row]
//        }
        
        return cell
    }
    
    struct Icons {
        let photo : UIImage
        let cat : String
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
