//
//  ProfilViewController.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 25/11/2022.
//

import UIKit

class ProfilViewController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var name: UILabel!
   
    
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
    
    @IBAction func DarkMode(_ sender: UISwitch) {
        if #available(ios 13.0 , *){
            let window = UIApplication.shared.windows.first
            if sender.isOn{
                themeLabel.text = "Dark Mode"

                window?.overrideUserInterfaceStyle = .dark
            }else{
                themeLabel.text = "Light Mode"

                window?.overrideUserInterfaceStyle = .light}
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        name.text = "User name: \(appDelegate.user?.user.fullname ?? "")"
        if (appDelegate.user == nil) {
            self.dismiss(animated: false)
        }
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"), style: .plain, target: self, action: #selector(didTapSignout))
        
       // name.text = products[indexPath.row].nom
        
        myImage.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        myImage.layer.shadowOffset = CGSize(width: 6.0, height: 6.0)
        myImage.layer.shadowOpacity = 1.0
        myImage.layer.shadowRadius = 2.0
        myImage.layer.masksToBounds = false
        myImage.layer.cornerRadius = 4.0
        
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
