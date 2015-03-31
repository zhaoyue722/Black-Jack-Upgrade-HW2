//
//  Game.swift
//  Black Jack Upgrade
//
//  Created by Yue Zhao on 2/27/15.
//  Copyright (c) 2015 Yue Zhao. All rights reserved.
//

import Foundation
import UiKit

class Game {
    var shoe: Shoe
    var player1: Player = Player()
    var player2: Player = Player()
    var dealer: Dealer = Dealer()
    var currentPlayer = 0
    var currentDeck = 0
   
    
    
    init (deckSize: Int, playerNumber: Int) {
        
        shoe = Shoe(numDeck: deckSize)
        
        for i in 0..<2 {
            player1.addCard(catchCard(currentDeck)!)
            
        }
        for j in 0..<2 {
            player2.addCard(catchCard(currentDeck)!)
        }
        dealer.addCard(catchCard(currentDeck)!)
        dealer.addCard(catchCard(currentDeck)!)
        dealer.hiddenCard = dealer.cards[0]
        dealer.cards[0].cd = UIImage(named: "secertcard.jpg")
    }
    
    func catchCard(cardm: Int) ->Card? {
        if (shoe.decks[currentDeck].cards.count <= 10) {currentDeck += 1}
        return shoe.decks[cardm].getCard()!
        
    }
    
    func hit1 (playerm: Int) {
        var card = catchCard(currentDeck)
        player1.addCard(card!)
    }
    
    func hit2 (playerm: Int) {
        var card = catchCard(currentDeck)
        player2.addCard(card!)
    }
    
    func stand1 (playerm: Int) {
        if (player1.stand == false) {
            player1.setStand = true
        }
    }
    
    func stand2 (playerm: Int) {
        if (player2.stand == false) {
            player2.setStand = true
        }
    }
    
    
}

