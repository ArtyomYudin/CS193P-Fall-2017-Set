//
//  ViewController.swift
//  Set
//
//  Created by Artyom Yudin on 31.10.2019.
//  Copyright © 2019 Artyom Yudin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var face = FaceCard()          // лицевая сторона карты
    private lazy var game = SetGameModel()

    @IBOutlet private var cardButtons: [CustomSetCard]!

    @IBAction private func touchCard(_ sender: CustomSetCard) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            sender.borderColor = game.cardOnTable[cardNumber].isSelected ? #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1) : #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        } else {
            print("Ouups!")
        }
    }
    
    @IBAction private func touchNewGame(_ sender: UIButton) {
        game = SetGameModel()   //пока так, не разобрался правильно ли сделано или нет
        game.newGame()
        updateViewFromModel()
    }
    
    @IBAction private func touchDealCard(_ sender: UIButton) {
        game.dealThreeCard()
        updateViewFromModel()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewFromModel()
       
        //print(cardOnTable)
    }
    
    // функция отображение карты на кнопке
    private func renderCard(_ card: PlayingCard, on button: CustomSetCard) {
        let figure = card.symbol.optionIndex
        let figureQuantity = card.quantity.rawValue
        let figureColor = card.color.optionIndex
        let figureFill = card.texture.optionIndex
        
        var title = ""//figure[figureIndex]
        for index in 1...figureQuantity {
            title += (face.type[figure] + (index == figureQuantity ? "" : "\n"))
        }
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth: -10.0,
            .strokeColor: face.color[figureColor],
            .foregroundColor: face.color[figureColor].withAlphaComponent(CGFloat(face.fill[figureFill]))
        ]
        button.setAttributedTitle(NSMutableAttributedString(string: title, attributes: attributes), for: .normal)
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            if index <= (game.cardOnTable.count - 1) {
                renderCard(game.cardOnTable[index], on: cardButtons[index])
                cardButtons[index].enabled(true)
            } else {
                cardButtons[index].enabled(false)
            }
        }
       // for index in game.cardOnTable.indices{
            //if let card = desk.dealCards() {
         //   renderCard(game.cardOnTable[index], on: cardButtons[index])
            //    cardOnTable += [card]
            //}
            
       // }
    }
}
