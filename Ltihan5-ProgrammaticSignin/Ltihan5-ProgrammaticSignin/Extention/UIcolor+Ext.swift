//
//  UIcolor+Ext.swift
//  Ltihan5-ProgrammaticSignin
//
//  Created by MacBook Pro on 27/03/23.
//
import Foundation
import UIKit

extension UIColor {
    /// #CBFB5E
    static var brand1: UIColor = UIColor(rgb: 0xCBFB5E)
    /// #0E0B1F
    static var brand2: UIColor = UIColor(rgb: 0x0E0B1F)
    /// #EEEEEE
    static var neutral1: UIColor = UIColor(rgb: 0xEEEEEE)
    /// #7A7C81
    static var neutral2: UIColor = UIColor(rgb: 0x71737B)
    /// #20242F
    static var neutral3: UIColor = UIColor(rgb: 0x20242F)
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
