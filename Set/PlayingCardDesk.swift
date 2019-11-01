//
//  PlayingCardDesk.swift
//  Set
//
//  Created by Artyom Yudin on 01.11.2019.
//  Copyright © 2019 Artyom Yudin. All rights reserved.
//

import Foundation

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

struct PlayingCardDesk {
    
    private (set) var cards = [PlayingCard]()
    
    init() {
        for symbol in PlayingCard.Option.all {
            for color in PlayingCard.Option.all {
                for quantity in PlayingCard.Option.all {
                    for texture in PlayingCard.Option.all {
                        cards.append(PlayingCard(symbol: symbol, color: color, quantity: quantity, texture: texture))
                    }
                }
            }
            
        }
        cards.shuffle()
    }
    
    mutating func dealCards() -> PlayingCard? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4random)
        } else {
            return nil
        }
    }
}
