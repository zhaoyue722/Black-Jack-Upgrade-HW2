//
//  Deck.swift
//  Black Jack Upgrade
//
//  Created by Yue Zhao on 2/27/15.
//  Copyright (c) 2015 Yue Zhao. All rights reserved.
//

import Foundation
import UIKit

class Deck {
    var cards:[Card] = []
    
    //create a deck of cards
    //ranks is array? what does Rank.Ace format?
    func createDeck() {
        let ranks = [Rank.Ace, Rank.Two, Rank.Three, Rank.Four, Rank.Five, Rank.Six, Rank.Seven, Rank.Eight, Rank.Nine, Rank.Ten, Rank.Jack, Rank.Queen, Rank.King]
        let suits = [Suit.Spades, Suit.Hearts, Suit.Diamonds, Suit.Clubs]
        for eachS in 0..<suits.count {
            for eachR in 0..<ranks.count {
                var imageFileName: UIImage = UIImage(named: "\(ranks[eachR].simpleDescription())_of_\(suits[eachS].simpleDescritption()).png")! //ranks[eachR].simpleDescription() + suits[eachS].simpleDescritption()   //what imageFileName for
                cards.append(Card(rank: ranks[eachR], suit: suits[eachS], cardNum: imageFileName))
            }
        }
    }
    
    //
    func getCard() -> Card? {
        var randomNumberOne = Int(arc4random_uniform(UInt32(cards.count))) //??
        var oneCard = cards[randomNumberOne]
        cards.removeAtIndex(randomNumberOne)
        return oneCard
    }
    
    //after 5 times play, shuffle cards
    func shuffle() {
        var deckSize = cards.count
        for num in 0..<deckSize {
            var randomNumber = Int(arc4random_uniform(UInt32(deckSize-num)))
            var temp = cards[num]
            cards[num] = cards[randomNumber]
            cards[randomNumber] = temp
            
            
        }
    }
    
    
}


