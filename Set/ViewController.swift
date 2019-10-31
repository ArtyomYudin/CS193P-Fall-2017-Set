//
//  ViewController.swift
//  Set
//
//  Created by Artyom Yudin on 31.10.2019.
//  Copyright © 2019 Artyom Yudin. All rights reserved.
//

import UIKit

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

class ViewController: UIViewController {

    private lazy var game = SetGameModel()
    
    @IBOutlet private var cardButtons: [CustomSetCard]!

    @IBAction private func touchCard(_ sender: CustomSetCard) {
        game.chooseCard()
    }
    
    @IBAction private func touchNewGame(_ sender: UIButton) {
        game.newGame()
    }
    
    @IBAction private func touchDealCard(_ sender: UIButton) {
        game.dealCard()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
