//
//  SignUpViewController.swift
//  MealMonkey
//
//  Created by MacBook Pro on 31/03/23.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var checkPasswordTextField: InputTextField!
    @IBOutlet weak var passwordTextField: InputTextField!
    @IBOutlet weak var emailTextField: InputTextField!
    @IBOutlet weak var nameTextField: InputTextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let index = navigationController?.viewControllers.firstIndex(where: { $0 is LoginViewController }) {
            navigationController?.viewControllers.remove(at: index)
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
    func signUp(){
        let name=nameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let user=User(name: name, email: email, password: password)
        showLoadingView(message: "Signing up...")
        ApiService.shared.singUp(user: user) { [weak self] (error) in
            self?.hideLoadingView()
            if let error = error {
                print(error.localizedDescription)
            }else{
                self?.performSegue(withIdentifier: "show_login", sender: nil)
            }
        }
    
    
}
    func validateInput() -> Bool{
        let showAlert: (String) -> Void={(message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert,animated: true)
        }
        guard let name = nameTextField.text,name.count > 2 else {
            showAlert("Name must 2 chacracter")
            return false
        }
        guard let password = passwordTextField.text,password.count > 4 else {
            showAlert("Password must 4 or more chacracter")
            return false
        }
        guard let email = emailTextField.text,email.isEmail else {
            showAlert("email is not valid")
            return false
        }
        guard checkPasswordTextField.text == passwordTextField.text else {
            showAlert("password not matces")
            return false
        }
        return true
    }
    @IBAction func signUpButtonTapped(_ sender: Any) {
        if validateInput(){
            signUp()
        }
        
    }
}
