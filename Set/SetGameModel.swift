//
//  SetModel.swift
//  Set
//
//  Created by Artyom Yudin on 31.10.2019.
//  Copyright © 2019 Artyom Yudin. All rights reserved.
//

import Foundation

struct SetGameModel {
        
    init() {
    }
    
    func chooseCard(at index: Int) {
        print("ChooseCard! \(index)")
    }
    
    func newGame() {
        print("New game!")
    }
    
    func dealCard() {
        print("Deal card!")
    }
}
