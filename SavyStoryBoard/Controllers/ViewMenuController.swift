//
//  ViewMenuController.swift
//  Savy
//
//  Created by ghezal0n on 13/11/2022.
//

import UIKit

class ViewMenuController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet var collectionView: UICollectionView!
    
    var arrIcons = [Icons]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        arrIcons.append(Icons(photo: UIImage(named: "tv.png")!, cat: "TV"))
        arrIcons.append(Icons(photo: UIImage(named: "tv.png")!, cat: "TV"))
        arrIcons.append(Icons(photo: UIImage(named: "tv.png")!, cat: "TV"))
        arrIcons.append(Icons(photo: UIImage(named: "tv.png")!, cat: "TV"))
        arrIcons.append(Icons(photo: UIImage(named: "tv.png")!, cat: "TV"))
        arrIcons.append(Icons(photo: UIImage(named: "tv.png")!, cat: "TV"))
        arrIcons.append(Icons(photo: UIImage(named: "tv.png")!, cat: "TV"))
        arrIcons.append(Icons(photo: UIImage(named: "tv.png")!, cat: "TV"))
        arrIcons.append(Icons(photo: UIImage(named: "tv.png")!, cat: "TV"))
        arrIcons.append(Icons(photo: UIImage(named: "tv.png")!, cat: "TV"))
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrIcons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "iconCell", for: indexPath) as! IconCollectionViewCell
        let icon = arrIcons[indexPath.row]
        cell.setupCell(photo: icon.photo, cat: icon.cat)
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
