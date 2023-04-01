//
//  NewsViewCell.swift
//  BeritaLima
//
//  Created by MacBook Pro on 28/03/23.
//

import UIKit
protocol NewsViewCellDelegate: AnyObject{
    func newsViewCellBookmarkButtonTapped(_ cell: NewsViewCell)
    
}

class NewsViewCell: UITableViewCell {
    
    @IBOutlet weak var bookmarkButton: UIButton!
    @IBOutlet weak var subTitleLable: UILabel!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var thumbImageView: UIImageView!
    
    var delegate: NewsViewCellDelegate?

    @IBAction func bookMarkButtonTapped(_ sender: Any) {
        delegate?.newsViewCellBookmarkButtonTapped(self)
    }
    
}
