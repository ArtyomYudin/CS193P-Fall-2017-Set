//
//  CustomSetCard.swift
//  Set
//
//  Created by Artyom Yudin on 31.10.2019.
//  Copyright © 2019 Artyom Yudin. All rights reserved.
//

import UIKit

@IBDesignable class CustomSetCard: UIButton {
    
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
    
    let figureColor = [UIColor.red, .green, .purple]
    
    let figureFill: [NSAttributedString.Key: Any] = [
        .strokeWidth: -5.0,
        .strokeColor: UIColor.red
    ]
    
    let figureStriped: [NSAttributedString.Key: Any] = [
        .strokeWidth: 5.0
    ]
    
    let figureOutline: [NSAttributedString.Key: Any] = [
        .strokeWidth: 5.0
    ]
    
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
        layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        layer.borderWidth = 3.0
        layer.cornerRadius = 8.0
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        titleLabel?.lineBreakMode = .byWordWrapping
        titleLabel?.numberOfLines = 3
        titleLabel?.textAlignment = .center
        // titleLabel?.font = .systemFont(ofSize: 20)
        // clipsToBounds = true
    }
}
