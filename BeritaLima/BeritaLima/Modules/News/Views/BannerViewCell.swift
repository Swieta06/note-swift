//
//  BannerViewCell.swift
//  BeritaLima
//
//  Created by MacBook Pro on 27/03/23.
//

import UIKit

class BannerViewCell: UITableViewCell {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(){
        containerView.layer.cornerRadius=12
        containerView.layer.masksToBounds=true
        containerView.layer.borderColor=UIColor.lightGray.cgColor
        containerView.layer.borderWidth=1
    }
}
