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
        
        showLoadingView(message:"Login ...")
        ApiService.shared.login(email: email, password: password) { [weak self] (result) in
            switch result{
            case .success(let accessToken):
                UserDefaults.standard.saveAccessToken(accessToken)
                self? .showLoadingView(message:"Load Profile ...")
                self?.getProfile(accessToken: accessToken.accesToken)
            case .failure(let error):
                self? .hideLoadingView()
                print(error.localizedDescription)
                let alert = UIAlertController(title: "Error", message:error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self?.present(alert,animated: true)
                
            }
        }
    }
    func getProfile(accessToken:String){
        ApiService.shared.getProfile(accessToken: accessToken) {[weak self] result in
            self?.hideLoadingView()
            switch result{
            case .success(let user):
                UserDefaults.standard.saveUser(user)
                print("\(user.id):\(user.name)")
            case .failure(let error):
                print(error.localizedDescription)
            }
            self?.goToMain()
        }
        
    }
    func validateInput() -> Bool{
        let showAlert: (String) -> Void={(message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert,animated: true)
        }
        guard let email=emailTxtField.text,email.count>0 else {
            showAlert("Email cannot be empty")
            return false
            
        }
        guard let password=passwordTxtField.text,password.count>0 else {
            showAlert("Password cannot be empty")
            return false
            
        }
        return true
    }
    @IBAction func LoginButtonTapped(_ sender: Any) {
        if validateInput(){
            login()
        }
        
    }
    
}
