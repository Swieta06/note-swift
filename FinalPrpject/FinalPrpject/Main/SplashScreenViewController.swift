//
//  SplashScreenViewController.swift
//  FinalPrpject
//
//  Created by MacBook Pro on 03/04/23.
//

import UIKit
import SwiftUI

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let splashScreen = UIHostingController(rootView: SplashScreen())
              splashScreen.view.frame = view.frame
              addChild(splashScreen)
              view.addSubview(splashScreen.view)
              splashScreen.didMove(toParent: self)
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
