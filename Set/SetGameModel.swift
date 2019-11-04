//
//  SetModel.swift
//  Set
//
//  Created by Artyom Yudin on 31.10.2019.
//  Copyright © 2019 Artyom Yudin. All rights reserved.
//

import Foundation

struct SetGameModel {
    
    private var desk = PlayingCardDesk()   // колода карт
    var cardOnTable = [PlayingCard]()   //массив карт которые в данный момент на игральном столе
    
    init() {
        for _ in 1...12 {
            let card = desk.dealCards()!
            cardOnTable += [card]
        }
    }
    
    mutating func chooseCard(at index: Int) {
        if cardOnTable[index].isSelected {
            cardOnTable[index].isSelected = false
        } else {
            cardOnTable[index].isSelected = true
        }
        print("ChooseCard! \(index)")
        print(cardOnTable[index])
    }
    
    func newGame() {
        print("Новая игра в колоде \(desk.cards.count)")
    }
    
    mutating func dealThreeCard() {
        if cardOnTable.count != 24 {
            for _ in 1...3 {
                //let card = desk.dealCards()!
                cardOnTable += [desk.dealCards()!]
            }
        } else {
            print("Весь стол занят !")
        }
        print("В колоде \(desk.cards.count)")
    }
}
