//
//  Game.swift
//  Black Jack Upgrade
//
//  Created by Yue Zhao on 2/27/15.
//  Copyright (c) 2015 Yue Zhao. All rights reserved.
//

import Foundation

class Game {
    var decks: [Deck]=[]
    var player1: Player = Player()
    var player2: Player = Player()
    var dealer: Dealer = Dealer()
    var currentPlayer = 0
    var currentDeck = 0
    var deckSize: Int
   
    
    
    init (deckSize: Int, playerNumber: Int) {
        
        self.deckSize = deckSize
        var tempDeck = Deck ()
        tempDeck.createDeck()
        decks.append(tempDeck)
        
        for i in 0..<2 {
            player1.addCard(catchCard(currentDeck)!)
            
        }
        for j in 0..<2 {
            player2.addCard(catchCard(currentDeck)!)
        }
        dealer.addCard(catchCard(currentDeck)!)
        dealer.addCard(catchCard(currentDeck)!)
        dealer.hiddenCard = dealer.cards[0]
    }
    

    
    
    
    //clean deck to restart the game
    func cleanDeck() {
        decks.removeAll(keepCapacity: false)
    }
    
    func displayDeck() {
        for n in 0..<decks.count {
            for m in 0..<decks[n].cards.count {
                NSLog("\(decks[n].cards[m].description)")
                
            }
        }
    }
    
    func catchCard(cardm: Int) ->Card? {
        //if (size.decks[currentDeck].cards.count <= 10) {currentDeck += 1}
        return decks[cardm].getCard()
        
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

