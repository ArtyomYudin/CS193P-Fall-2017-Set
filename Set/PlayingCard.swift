//
//  Card.swift
//  Set
//
//  Created by Artyom Yudin on 31.10.2019.
//  Copyright © 2019 Artyom Yudin. All rights reserved.
//

import Foundation

// структура игральной карты
struct PlayingCard {
    var symbol: Option      // символ (круг, треугольник и квалрат)
    var color: Option       // цвет символа
    var quantity: Option    // количество символов на карте
    var texture: Option     // текстура символа (залит, заштрихован или контур)
    var isSelected = false  // карта выбрана или нет
    
    // у каждого свойства карты есть три варианта
    enum Option: Int {
        case option1 = 1
        case option2
        case option3
        
        static var all = [Option.option1, .option2, .option3]   // массив всех вариантов свойств
        var optionIndex: Int { return (rawValue - 1) }          // переменная для преобразования значения в индекс
    }
    
}

