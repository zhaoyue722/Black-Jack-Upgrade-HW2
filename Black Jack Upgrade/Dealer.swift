//
//  Dealer.swift
//  Black Jack Upgrade
//
//  Created by Yue Zhao on 2/27/15.
//  Copyright (c) 2015 Yue Zhao. All rights reserved.
//

import Foundation

class Dealer : Player{
    
    var hiddenCard: Card?
    var type :String = ""
    var positionName = "Dealer"
    
    
    //the card that the dealer show up
    func cardShow() -> Card? {
        cards[0].cd = hiddenCard?.cd! // the syntax??
        return cards[0]
    }
    
    //the sum of the cards of dealer
    func checkSum(type:String) -> (intSum: Int, strSum: String) {
        if (type == "hidden") {
            var intSum = 0
            for each in cards {intSum += each.rank.values.first}
            intSum = intSum - cards[0].rank.values.first
            var strSum: String = "\(intSum)"
            return (intSum, strSum)
        }
        else {
            var intSum = 0
            for each in cards {intSum += each.rank.values.first}
            var strSum:String = "\(intSum)"
            return (intSum, strSum)
        }
    }
    
}
