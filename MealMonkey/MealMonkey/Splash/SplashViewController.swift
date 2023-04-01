//
//  SplashViewController.swift
//  MealMonkey
//
//  Created by MacBook Pro on 30/03/23.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var LoadingView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let isLogedIn=false
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            if isLogedIn{
                self.goToMain()
                
            }else{
                self.goToAuth()
            }
        }
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
extension UIWindow{
    func setRootViewController(_ viewController:UIViewController)  {
        self.rootViewController = viewController
        let options:UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 0.3
        UIView.transition(with: self, duration: duration, options: options, animations: {},completion: {completed in})
    }
}
extension UIApplication{
    var window:UIWindow{
        if #available(iOS 13.0, *){
            let scenes = UIApplication.shared.connectedScenes
            let windowScene=scenes.first as! UIWindowScene
            return windowScene.windows.first!
        }else{
            let appDelegate=UIApplication.shared.delegate as! AppDelegate
            return appDelegate.window!
            
        }
    }
}
extension UIViewController{
    func goToMain(){
        let stroyboard=UIStoryboard(name:"Main",bundle: nil)
        let viewController = stroyboard.instantiateViewController(withIdentifier: "Main")
        let window: UIWindow = UIApplication.shared.window
        
        
        window.setRootViewController(viewController)
    }
    func goToAuth(){
        let stroyboard=UIStoryboard(name:"Login",bundle: nil)
        let viewController = stroyboard.instantiateViewController(withIdentifier: "AuthViewController")
        let window: UIWindow = UIApplication.shared.window
      
        window.setRootViewController(viewController)
       
        
    }
    
}
