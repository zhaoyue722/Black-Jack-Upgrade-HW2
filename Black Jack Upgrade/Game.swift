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
    var players: [Player] = []
    var dealer: Dealer = Dealer()
    var currentPlayer = 0
    var currentDeck = 0
    var deckSize: Int
   
    
    
    init (deckSize: Int, playerNumber: Int) {
        
        self.deckSize = deckSize
        var tempDeck = Deck ()
        tempDeck.createDeck()
        decks.append(tempDeck)
        
        for i in 0..<playerNumber {
            addPlayer()
        }
        
        for j in 0..<players.count {
           for i in 0..<2 {players[j].addCard(catchCard(currentDeck)!)}
           dealer.addCard(catchCard(currentDeck)!)
           dealer.addCard(catchCard(currentDeck)!)
           dealer.hiddenCard = dealer.cards[0]
        }
    }
    
    func addPlayer() {
        var newPlayer: Player = Player()
        players.append(newPlayer)
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
    
    func hit (playerm: Int) {
        var card = catchCard(currentDeck)
        players[playerm].addCard(card!)
    }
    
    func stand (playerm: Int) {
        if (players[playerm].stand == false) {
            players[playerm].setStand = true
            currentPlayer += 1
            if (currentPlayer > 0) {currentPlayer = 0}
        }
        else {
            currentPlayer += 1
            if (currentPlayer > 0) {currentPlayer = 0}
            
        }
    }
    
    
    
}

