//
//  LoginViewController.swift
//  MealMonkey
//
//  Created by MacBook Pro on 30/03/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTxtField: InputTextField!
    @IBOutlet weak var emailTxtField: InputTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//buat destroy halaman sebelumnya
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let index=navigationController?.viewControllers.firstIndex(where: {$0 is SignUpViewController}){
            navigationController?.viewControllers.remove(at: index)
        }
        
    }
    /*
     func back{
     navigationController?.popViewController(animated: <#T##Bool#>)
//
     }
     
     */
    func login(){
        let email=emailTxtField.text ?? ""
        let password=passwordTxtField.text ?? ""
        ApiService.shared.login(email: email, password: password) { [weak self] (result) in
            switch result{
            case .success(let accessToken):
                self?.getProfile(accessToken: accessToken.accesToken)
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
    func getProfile(accessToken:String){
        ApiService.shared.getProfile(accessToken: accessToken) { result in
            switch result{
            case .success(let user):
                print("\(user.id):\(user.name)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    @IBAction func LoginButtonTapped(_ sender: Any) {
        login()
    }
    
}
