//
//  shoe.swift
//  Black Jack Upgrade
//
//  Created by Yue Zhao on 2/27/15.
//  Copyright (c) 2015 Yue Zhao. All rights reserved.
//

import Foundation

class Shoe {
    var decks: [Deck] = []
    
    init(numDeck: Int) {
        var newdeck: Deck = Deck()
        for i in 0..<numDeck {
            var tmpDeck = Deck()
            tmpDeck.createDeck()
            decks.append(tmpDeck);
        }
    }
    
    func addDeck() {
        var tmpDeck = Deck()
        tmpDeck.createDeck()
        decks.append(tmpDeck)
    }
    
    func removeAllDeck() {
        decks.removeAll(keepCapacity: false);
    }
    
}
