//
//  PopularRestoViewCell.swift
//  MealMonkey
//
//  Created by MacBook Pro on 03/04/23.
//

import UIKit

class PopularRestoViewCell: UITableViewCell {
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var ratingAverageLable: UILabel!
    @IBOutlet weak var foodCategoryLable: UILabel!
    @IBOutlet weak var restoCategoryLable: UILabel!
    @IBOutlet weak var ratingCountLable: UILabel!
    @IBOutlet weak var RestoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
