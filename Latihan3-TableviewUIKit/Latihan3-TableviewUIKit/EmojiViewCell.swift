//
//  EmojiViewCell.swift
//  Latihan3-TableViewUIKit
//
//  Created by MacBook Pro on 24/03/23.
//

import UIKit

class EmojiViewCell: UITableViewCell {
    @IBOutlet weak var EmojiLable: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
