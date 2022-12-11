//
//  IconDetailViewController.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 15/11/2022.
//

import UIKit

class IconDetailViewController: UIViewController {

    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var textDetail: UILabel!
    
    var name = ""
    //var sproduct:Icons!=nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textDetail.text = name
        imageDetail.image = UIImage(named: name)
        
//        imageDetail.image = sproduct.photo
//        textDetail.text = sproduct.cat

        // Do any additional setup after loading the view.
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
