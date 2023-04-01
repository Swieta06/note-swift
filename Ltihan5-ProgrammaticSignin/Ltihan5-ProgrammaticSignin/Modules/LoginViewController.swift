//
//  LoginViewController.swift
//  Ltihan5-ProgrammaticSignin
//
//  Created by MacBook Pro on 27/03/23.
//

import UIKit

class LoginViewController: UIViewController {
    weak var bgImageView: UIImageView!
    weak var titleLable: UILabel!
    weak var signInButton: PrimaryButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        setupUI()
    }
    func setupUI(){
        // MARK: - Image View
        let imageView=UIImageView(image: UIImage(named: "bg_sign_in"))
        view.addSubview(imageView)
        self.bgImageView=imageView
        imageView.contentMode = .scaleAspectFill
        imageView.addOverlay(color: .blue,alpha: 0.2)
        
        // constraint dari image view
        imageView.translatesAutoresizingMaskIntoConstraints=false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // MARK: - Title Lable
        let titleLble=UILabel(frame: .zero)
        view.addSubview(titleLble)
        self.titleLable=titleLble
        titleLble.text="SIGN IN"
        titleLble.textColor = .white
        titleLble.font=UIFont.systemFont(ofSize: 36, weight: .bold)
        titleLble.translatesAutoresizingMaskIntoConstraints=false
        NSLayoutConstraint.activate([
            titleLble.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            titleLble.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 60)
        ])
        
        // MARK: Sign in button
        let signInButton = PrimaryButton()
        view.addSubview(signInButton)
        self.signInButton=signInButton
        signInButton.setTitle("SIGN IN", for: .normal)
        
        signInButton.translatesAutoresizingMaskIntoConstraints=false
        NSLayoutConstraint.activate([
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signInButton.widthAnchor.constraint(equalToConstant: 160),
            signInButton.heightAnchor.constraint(equalToConstant: 46)
        ])
        
    }

}

