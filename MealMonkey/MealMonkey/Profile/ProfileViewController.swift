//
//  ProfileViewController.swift
//  MealMonkey
//
//  Created by MacBook Pro on 06/04/23.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var addressTextField: InputTextField!
    @IBOutlet weak var emailTextField: InputTextField!
    @IBOutlet weak var nameTextField: InputTextField!
    
    var profileImage:UIImage?{
        didSet{
            profileImageView.image=profileImage
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let user=UserDefaults.standard.user
        nameLable.text="Hi \(user?.name ?? "")"
        nameTextField.text=user?.name
        emailTextField.text=user?.email
    }
    
    @IBAction func CameraButtonTapped(_ sender: Any) {
        pickImage()
    }
    
    @IBAction func addressButtonTapped(_ sender: Any) {
        showAdressViewController { _, address in
            self.addressTextField.text=address
        }
    }
    
    @IBAction func SignoutButtonTapped(_ sender: Any) {
        UserDefaults.standard.deleteToken()
        UserDefaults.standard.deleteUser()
        goToAuth()
    }
    
    func pickImage(){
        let actionSheet=UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default,handler: { _ in
            self.showImagePicker(source: .camera)
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default,handler: { _ in
            self.showImagePicker(source: .photoLibrary)
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancle", style: .cancel))
        present(actionSheet,animated: true)
    }
    
    // let viewController=UIImagePickerController()
    func showImagePicker(source:UIImagePickerController.SourceType){
        let viewController=UIImagePickerController()
        viewController.sourceType=source
        viewController.delegate=self
        present(viewController,animated: true)
    }
}

extension ProfileViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image=info[.originalImage] as? UIImage
        profileImage=image
        dismiss(animated: true)
    }
}
