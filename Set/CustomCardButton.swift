//
//  CustomSetCard.swift
//  Set
//
//  Created by Artyom Yudin on 31.10.2019.
//  Copyright © 2019 Artyom Yudin. All rights reserved.
//

import UIKit

@IBDesignable class CustomCardButton: UIButton {
    
    @IBInspectable var borderWight: CGFloat = 3.0 {
        didSet {
            layer.borderWidth = borderWight
        }
    }
    
    @IBInspectable var borderColor: UIColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1) {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderRadius: CGFloat = 8.0 {
        didSet {
            layer.cornerRadius = borderRadius
        }
    }
    
    var isVisible = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCustomCard()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCustomCard()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupCustomCard()
    }
    
    func setupCustomCard() {
        layer.borderColor =  #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        layer.cornerRadius = 8.0
        titleLabel?.lineBreakMode = .byWordWrapping
        titleLabel?.font = .systemFont(ofSize: 18)
    }
    
    func isButtonVisible(_ flag: Bool) -> Void {
        if flag {
            backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            borderWight = 3.0
            isVisible = true
        } else {
            backgroundColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
            borderWight = 0.0
            setAttributedTitle(nil, for: .normal)
            isVisible = false
        }
    }
}
