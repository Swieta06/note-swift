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
        ApiService.shared.singUp(user: user) { [weak self] (error) in
            if let error = error {
                print(error.localizedDescription)
            }else{
                self?.performSegue(withIdentifier: "show_login", sender: nil)
            }
        }
    
    
}

    @IBAction func signUpButtonTapped(_ sender: Any) {
        signUp()
    }
}
