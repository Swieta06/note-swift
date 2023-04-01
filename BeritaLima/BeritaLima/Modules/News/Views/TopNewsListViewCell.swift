//
//  TopNewsListViewCell.swift
//  BeritaLima
//
//  Created by MacBook Pro on 27/03/23.
//

import UIKit

protocol TopNewsViewCellDelegate:AnyObject{
    func topNewsListViewCellPageControlValueChange(_ cell: TopNewsListViewCell)
}
class TopNewsListViewCell: UITableViewCell {

    @IBOutlet weak var titleLable: UILabel!
    
    @IBOutlet weak var subtitleLable: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    weak var delegate: TopNewsViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func pageControlValueChage(_ sender: Any) {
        delegate?.topNewsListViewCellPageControlValueChange(self)
    }
    
}
