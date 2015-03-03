//
//  Player.swift
//  Black Jack Upgrade
//
//  Created by Yue Zhao on 2/27/15.
//  Copyright (c) 2015 Yue Zhao. All rights reserved.
//

import Foundation
class Player {
    var name: String = "Player"
    var score = 0
    var cards:[Card] = []
    var chipAmount = 100
    var bet = 0
    var stand:Bool = false
    var isOut = false
    
    /*init (name: String) {
    self.playerName = "Player"  //??
    }*/
    
    //stand function
    func Stand() {
        
    }
    
    func addCard (card: Card){
        cards.append(card);
    }
    
    func checkSum() -> (intSum:Int, strSum: String) {
        var intSum = 0
        for each in cards
        {
            intSum += each.rank.values.first
        }
        if(intSum <= 11){
            for i in 0..<cards.count {
                if(cards[i].rank.simpleDescription() == "A"){
                    intSum += cards[i].rank.values.second! - 1;
                }
            }
        }
        var strSum = "\(intSum)"
        return (intSum,strSum)  
    }
    
    //changing the value for stand attribute ????
    var setStand: Bool {
        get {return self.stand}
        set(newBoolValue) { self.stand = newBoolValue}
    }
    
}