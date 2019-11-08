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
    
    private var cardOnTableCount: Int {
        return game.cardOnTable.count
    }
    
    @IBOutlet private weak var findSetCountLabel: UILabel!
    @IBOutlet private weak var cardOnDeskLabel: UILabel!
    
    @IBOutlet private var cardButtons: [CustomCardButton]!
    
    @IBOutlet private weak var dealThreeCardButton: UIButton!
    
    @IBAction private func touchCard(_ sender: CustomCardButton) -> Void {
        if let cardNumber = cardButtons.firstIndex(of: sender), sender.isVisible {
            game.chooseCard(at: cardNumber)
            // sender.borderColor = cardBorder(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Кнопка не имеет карт!")
        }
    }
    
    @IBAction private func touchNewGame(_ sender: UIButton) -> Void {
        game = SetGameModel()   //пока так, не разобрался правильно ли сделано или нет
        updateViewFromModel()
    }
    
    @IBAction private func touchDealCard(_ sender: UIButton) -> Void {
        game.dealThreeCard()
        updateViewFromModel()
    }
    
    override func viewDidLoad() -> Void {
        super.viewDidLoad()
        updateViewFromModel()
    }
    
    // функция отображение карты на кнопке
    private func renderCard(_ card: PlayingCard, on button: CustomCardButton) -> Void {
        let figure = card.symbol.optionIndex
        let figureQuantity = card.quantity.rawValue
        let figureColor = card.color.optionIndex
        let figureFill = card.texture.optionIndex
        
        var title = ""
        
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
    
    // изменение цвета оконтовки карты если выбрана или нет
    private func cardBorder(at index: Int) -> UIColor {
        return game.cardOnTable[index].isSelected ? #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1) : #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    }
    
    private func updateViewFromModel() -> Void {
        for index in cardButtons.indices {
            if index <= (cardOnTableCount - 1) {
                renderCard(game.cardOnTable[index], on: cardButtons[index])
                cardButtons[index].isButtonVisible(true)
                cardButtons[index].borderColor = cardBorder(at: index)
            } else {
                cardButtons[index].isButtonVisible(false)
            }
        }
        findSetCountLabel.text = "Сеты: \(game.findSetCount)"
        cardOnDeskLabel.text = "В колоде: \(game.desk.cards.count)"
        dealThreeCardButton.isUserInteractionEnabled = (cardOnTableCount != 24)
    }
}
