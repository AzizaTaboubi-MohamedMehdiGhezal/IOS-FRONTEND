//
//  MBProgressHUD.swift
//  SavyStoryBoard
//
//  Created by ghezal0n on 25/12/2022.
//

import Foundation
import UIKit
import MBProgressHUD

class MBProgressHUDUtils {
    static func mbProgressHUB(vc: UIViewController, text:String){
            DispatchQueue.main.async {
                let ProgressHUB = MBProgressHUD.showAdded(to: vc.view, animated: true)
                ProgressHUB.label.text = text
                // ProgressHUB.contentColor = green
                
            }
        }
        static func hideMBProgressHUB(vc: UIViewController){
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: vc.view, animated: true)
            }
        }

}
