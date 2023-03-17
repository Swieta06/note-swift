//
//  ViewController.swift
//  latihan1
//
//  Created by MacBook Pro on 17/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var astronoutBotton: UIButton!
    @IBOutlet weak var rockStarBotton: UIButton!
    @IBOutlet weak var enginerrBotton: UIButton!
    @IBOutlet weak var rocketBotton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    //Mark: -Helper
    func showAlert(with title:String, and subtitle:String){
        let alert=UIAlertController(title: title, message: subtitle, preferredStyle:.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
    
    @IBAction func astronoutBottonTapped(_ sender: Any) {
        showAlert(with: "Your Job", and:"Astronout")
    }
    
    @IBAction func rockStarBottonTapped(_ sender: Any) {
        showAlert(with: "Your Job", and:"Rockstar")
    }
    
    @IBAction func programmerBottonTapped(_ sender: Any) {
        showAlert(with: "Your Job", and:"Engineer")
    }
    
    @IBAction func rockButtonTapped(_ sender: Any) {
        showAlert(with: "Your Job", and:"Rocket Scientist")
    }
    
    
}

