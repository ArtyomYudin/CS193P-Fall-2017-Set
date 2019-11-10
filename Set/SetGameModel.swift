//
//  SetModel.swift
//  Set
//
//  Created by Artyom Yudin on 31.10.2019.
//  Copyright © 2019 Artyom Yudin. All rights reserved.
//

import Foundation

struct SetGameModel {
    
    private (set) var desk = PlayingCardDesk()              // колода карт
    private (set) var cardOnTable = [PlayingCard]()         // массив карт которые в данный момент на игральном столе
    
    // Коллекция выбранных карт
    private (set) var selectedCard = [Int: PlayingCard]() {
        didSet {
            selectedCardCount == 3 ? compareCard() : nil    //проверка если 3 карты
        }
    }
    private (set) var findSetCount = 0                      // количество найденных сетов
    
    // колличество выбранных карт
    private var selectedCardCount: Int {
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
            if selectedCardCount < 3 {
                cardOnTable[index].isSelected = false
                selectedCard.removeValue(forKey: index)
            }
        } else {
            cardOnTable[index].isSelected = true
            if selectedCardCount == 3 {
                desk.cards.count != 0 ? dealThreeCard() : selectedCard.removeAll()
            }
            selectedCard[index] = cardOnTable[index]
        }
    }
    
    mutating func dealThreeCard() -> Void {
        selectedCardCount == 3 ? selectedCard.removeAll() : nil
        deal: for _ in 1...3 {
            for index in cardOnTable.indices {
                if cardOnTable[index].inSet {
                    cardOnTable[index] = desk.dealCards()!
                    continue deal
                }
            }
            cardOnTable.append(desk.dealCards()!)
        }
    }
    
    // маркировка найденного сета на столе
    private mutating func markCardAsSet() -> Void {
        for key in selectedCard.keys {
            cardOnTable[key].inSet = true
        }
    }
    
    private mutating func compareCard() -> Void {
        print("Выбрано три карты! Идет сравнение!")
        
        // суммируем варианты каждого свойства карт в сете.
        // Сумма значений свойства в сете должна делиться на 3 без остатка.
        // Если все суммы кратны 3-м, то сет собран
        
        let symbolSet = selectedCard.reduce(0){$0 + $1.value.symbol.rawValue}
        let colorSet = selectedCard.reduce(0){$0 + $1.value.color.rawValue}
        let quantitySet = selectedCard.reduce(0){$0 + $1.value.quantity.rawValue}
        let textureSet = selectedCard.reduce(0){$0 + $1.value.texture.rawValue}
        
        if (symbolSet % 3 == 0) && (colorSet % 3 == 0) && (quantitySet % 3 == 0) && (textureSet % 3 == 0)   {
            findSetCount += 1
            markCardAsSet()
            print("Совпадение!!")
        } else {
            print("Не совпали")
            // если карты не совпали то, убераем с карт выделение
            for key in selectedCard.keys {
                cardOnTable[key].isSelected = false
            }
            selectedCard.removeAll()
        }
    }
}
