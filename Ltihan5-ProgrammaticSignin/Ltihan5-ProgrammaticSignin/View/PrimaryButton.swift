//
//  PrimaryButton.swift
//  Ltihan5-ProgrammaticSignin
//
//  Created by MacBook Pro on 27/03/23.
//

import UIKit

class PrimaryButton: UIButton {

    override init(frame: CGRect){
        super.init(frame: frame)
        
    }
    required init?(coder: NSCoder){
        super.init(coder: coder)
    }
    func setup(){
        self.tintColor = .brand2
        self.backgroundColor = .neutral1
        self.titleLabel?.font=UIFont.systemFont(ofSize: 16, weight: .bold)
        self.layer.cornerRadius=4
        self.layer.masksToBounds=true
    }
    
    //ini kita deklarasikan, kaena ingin membuat new button dari supperclass UIBotton
    
    convenience init() {
        self.init(type: .system)
        setup()
    }

}
