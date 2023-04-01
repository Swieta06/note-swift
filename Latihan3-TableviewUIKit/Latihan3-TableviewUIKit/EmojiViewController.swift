//
//  EmojiViewController.swift
//  Latihan3-TableViewUIKit
//
//  Created by MacBook Pro on 24/03/23.
//

import UIKit

class EmojiViewController: UIViewController {
    
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var emojiLable: UILabel!
    var emoji:EmojiModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        emojiLable.text=emoji.emoji
        nameLable.text=emoji.name
        descriptionLable.text=emoji.description
        
        // Do any additional setup after loading the view.
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

    extension UIViewController {
            func showEmojiViewController(emoji: EmojiModel ){
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "Emoji") as! EmojiViewController
                
                viewController.emoji = emoji
                
                navigationController?.pushViewController(viewController, animated: true)
            }
        }


