//
//  UIView+Ext.swift
//  Ltihan5-ProgrammaticSignin
//
//  Created by MacBook Pro on 27/03/23.
//

import Foundation
import UIKit

extension UIView{
    func addOverlay(color:UIColor = .black, alpha: CGFloat=0.6 ){
        let overlay = UIView()
        overlay.autoresizingMask=[.flexibleWidth, .flexibleHeight]
        overlay.frame=bounds
        overlay.backgroundColor=color
        overlay.alpha=alpha
        addSubview(overlay)
    }
}

