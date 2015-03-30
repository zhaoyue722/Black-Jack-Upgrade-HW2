//
//  Card.swift
//  Black Jack Upgrade
//
//  Created by Yue Zhao on 2/27/15.
//  Copyright (c) 2015 Yue Zhao. All rights reserved.
//

import Foundation
import UIKit
enum Rank: Int {
    case Two = 2
    case Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Ace, Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    //make a struct Values to give the the special cards values?
    struct Values {
        let first : Int, second: Int? //can return int or not int?
    }
    var values: Values {
        switch self {
        case .Ace:
            return Values (first: 1, second: 11)
        case .Jack, .Queen, .King:
            return Values(first: 10, second: nil)
        default:
            return Values (first: self.rawValue, second: nil)
            
        }
    }
}

enum Suit: Character {
    case Spades = "♠"
    case Hearts = "♥"
    case Diamonds = "♦"
    case Clubs = "♣"
    func simpleDescritption() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}

class Card {
    var rank: Rank
    var suit: Suit
    var hiddenCard = false
    var currentCard = 0 //???
    var cd:UIImage!
    init (rank: Rank, suit: Suit,cardNum: UIImage) {
        self.suit = suit
        self.rank = rank
        self.cd = cardNum  
        
    }
    var description: String {
        var output = "\(suit.rawValue)"
        output += "\(rank.values.first)"
        if let secondValue = rank.values.second {
            output += " or \(secondValue)"
        }
        return output
    }
}
