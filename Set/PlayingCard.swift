//
//  Card.swift
//  Set
//
//  Created by Artyom Yudin on 31.10.2019.
//  Copyright © 2019 Artyom Yudin. All rights reserved.
//

import Foundation

struct PlayingCard {
    var symbol: Option
    var color: Option
    var quantity: Option
    var texture: Option

    enum Option: Int {
        case option1 = 1
        case option2
        case option3
        
        static var all = [Option.option1, .option2, .option3]
        var optionIndex: Int { return (rawValue - 1) }
    }
    
}

