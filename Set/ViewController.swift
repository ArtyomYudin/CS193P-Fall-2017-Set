//
//  ViewController.swift
//  Set
//
//  Created by Artyom Yudin on 31.10.2019.
//  Copyright © 2019 Artyom Yudin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var desk = PlayingCardDesk()
    
    @IBOutlet private var cardButtons: [CustomSetCard]!

    @IBAction private func touchCard(_ sender: CustomSetCard) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            // game.chooseCard(at: cardNumber)
            sender.borderColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        } else {
            print("Ouups!")
        }
    }
    
    @IBAction private func touchNewGame(_ sender: UIButton) {
        // game.newGame()
    }
    
    @IBAction private func touchDealCard(_ sender: UIButton) {
        // game.dealCard()
    }
    
    let figure = ["△","○","□"]
    
    let figureFill: [NSAttributedString.Key: Any] = [
        .strokeWidth: -5.0,
        .strokeColor: UIColor.red
    ]
    
    private var ori: String {
        return UIDevice.current.orientation.isPortrait ? " ": "\n"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //updateViewFromModel()
        for index in 0...23 {
            if let card = desk.dealCards() {
                renderCard(card, on: cardButtons[index])
            }
            
        }
    }

    private func renderCard(_ card: PlayingCard, on button: CustomSetCard) {
        let figureIndex = card.symbol.optionIndex
        let figureQuantity = card.quantity.rawValue
        let figureColorIndex = card.color.optionIndex
        
        var title = figure[figureIndex]
        for _ in 1...figureQuantity {
            title = title + (ori + figure[figureIndex])
        }
        button.setAttributedTitle(NSMutableAttributedString(string: title, attributes: figureFill), for: .normal)
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            button.setTitle("△\n○\n□", for: .normal)
            if index >= 12 {
                button.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            }
        }
    }
}
