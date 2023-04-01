//
//  InputTextField.swift
//  MealMonkey
//
//  Created by MacBook Pro on 30/03/23.
//

import UIKit
@IBDesignable
class InputTextField: UITextField {
    @IBInspectable var cornerRadius: CGFloat=28{
        didSet{
            update()
            
        }
    }
    @IBInspectable var padding: CGFloat=34{
        didSet{
            layoutIfNeeded()
        }
    }
    //untuk manggil button diluar storiboard
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    //untuk update di storyboard
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding))
        }
        
        override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding))
        }
        
        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding))
        }
    
    //biar bisa dipanggil di program yg lain
    convenience init() {
        self.init(frame: .zero)
        setup()
    }
    func setup(){
        backgroundColor = UIColor(rgb: 0xF2F2F2)
        textColor=UIColor(named: "PrimaryText", in: Bundle(for: self.classForCoder), compatibleWith: nil)
        font=UIFont.systemFont(ofSize: 14,weight: .regular)
        update()
    }
    func update(){
        layer.cornerRadius=self.cornerRadius
        layer.masksToBounds=true
        
    }

}
