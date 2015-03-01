//
//  shoe.swift
//  Black Jack Upgrade
//
//  Created by Yue Zhao on 2/27/15.
//  Copyright (c) 2015 Yue Zhao. All rights reserved.
//

import Foundation

class Shoe {
    var shoes: [Card] = []
    
    init (deckSize: Int) {
        initshoe(deckSize)
    }
    
    func initshoe (deckSize: Int) {
        var newdeck: Deck = Deck()
        for i in 0..<deckSize {
            for j in 0..<newdeck.cards.count {
                  shoes.append (newdeck.cards[j])
        
           }
        }
    }
    
}
