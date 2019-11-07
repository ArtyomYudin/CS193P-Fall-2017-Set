//
//  SetModel.swift
//  Set
//
//  Created by Artyom Yudin on 31.10.2019.
//  Copyright © 2019 Artyom Yudin. All rights reserved.
//

import Foundation

struct SetGameModel {
    
    private var desk = PlayingCardDesk()        // колода карт
    var cardOnTable = [PlayingCard]()           // массив карт которые в данный момент на игральном столе
    var selectedCard = [Int: PlayingCard]()     // Коллекция выбранных карт
    
    var selectedCardCount: Int {                // колличество выбранных карт
        return selectedCard.count
    }
    
    init() {
        for _ in 1...12 {
            let card = desk.dealCards()!
            cardOnTable += [card]
        }
    }
    
    mutating func chooseCard(at index: Int) -> Void {
        if cardOnTable[index].isSelected {
            cardOnTable[index].isSelected = false
        } else {
            if  selectedCardCount < 3 {
                cardOnTable[index].isSelected = true
                selectedCard[index] = cardOnTable[index]
            } else {
                compareCard()
            }
        }
    }
    
    func newGame() -> Void {
        print("Новая игра!")
        
    }
    
    mutating func dealThreeCard() -> Void {
        if cardOnTable.count != 24 {
            for _ in 1...3 {
                //let card = desk.dealCards()!
                cardOnTable += [desk.dealCards()!]
            }
        } else {
            print("Весь стол занят!")
        }
        // print("В колоде \(desk.cards.count)")
    }
    
    mutating func compareCard() -> Void {
        print("Выбрано три карты! Идет сравнение!")
        
        // суммируем варианты каждого свойства карт в сете.
        // Сумма значений свойства в сете должна делиться на 3 без остатка.
        // Если все суммы кратны 3-м, то сет собран
        
        let symbolSet = selectedCard.reduce(0){$0 + $1.value.symbol.rawValue}
        let colorSet = selectedCard.reduce(0){$0 + $1.value.color.rawValue}
        let quantitySet = selectedCard.reduce(0){$0 + $1.value.quantity.rawValue}
        let textureSet = selectedCard.reduce(0){$0 + $1.value.texture.rawValue}
        
        if (symbolSet % 3 == 0) && (colorSet % 3 == 0) && (quantitySet % 3 == 0) && (textureSet % 3 == 0)   {
            print("Совпадение!!")
        } else {
            print("Не совпали")
            for key in selectedCard.keys {
                cardOnTable[key].isSelected = false
            }
            selectedCard = [:]
       }
    }
}
