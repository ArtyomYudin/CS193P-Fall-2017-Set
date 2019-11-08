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

// структура колоды игральных карт
struct PlayingCardDesk {
    
    private (set) var cards = [PlayingCard]()
    
    init() {
        // формирование колоды карт. 81 карта в колоде
        for symbol in PlayingCard.Option.all {
            for color in PlayingCard.Option.all {
                for quantity in PlayingCard.Option.all {
                    for texture in PlayingCard.Option.all {
                        cards.append(PlayingCard(symbol: symbol, color: color, quantity: quantity, texture: texture, isSelected: false, isSet: false))
                    }
                }
            }
            
        }
        cards.shuffle() // перетасовка карт
        //TODO: модифицировать перетасовку карт
    }
    
    // функция раздачи карт, выданная карта удаляется из колоды
    mutating func dealCards() -> PlayingCard? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4random)
        } else {
            return nil
        }
    }
}
