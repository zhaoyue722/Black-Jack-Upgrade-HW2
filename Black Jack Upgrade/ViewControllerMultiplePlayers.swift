//
//  ViewControllerMultiplePlayers.swift
//  Black Jack Upgrade
//
//  Created by Yue Zhao on 2/27/15.
//  Copyright (c) 2015 Yue Zhao. All rights reserved.
//

import UIKit

class ViewControllerMultiplePlayers: UIViewController {
    
    @IBOutlet weak var dealerCard1: UIImageView!
 
    @IBOutlet weak var dealerCard2: UIImageView!
    
    @IBOutlet weak var dealerCard3: UIImageView!
    
    @IBOutlet weak var dealerCard4: UIImageView!
    
    @IBOutlet weak var dealerCard5: UIImageView!
    
    @IBOutlet weak var player1Card1: UIImageView!
    
    @IBOutlet weak var player1Card2: UIImageView!
    
    @IBOutlet weak var player1Card3: UIImageView!
    
    @IBOutlet weak var player1Card4: UIImageView!
    
    @IBOutlet weak var player1Card5: UIImageView!
    
    @IBOutlet weak var player2Card1: UIImageView!
    
    @IBOutlet weak var player2Card2: UIImageView!
    
    @IBOutlet weak var player2Card3: UIImageView!
    
    @IBOutlet weak var player2Card4: UIImageView!
    
    @IBOutlet weak var player2Card5: UIImageView!
    

    @IBOutlet weak var player1BetInput: UITextField!
    
    
    @IBOutlet weak var player1BetBalance: UILabel!
    
    @IBOutlet weak var player2BetInput: UITextField!
    
    @IBOutlet weak var player2BetBalance: UILabel!
    
    @IBOutlet weak var player1BetButton: UIButton!
    
    @IBOutlet weak var player2BetButton: UIButton!
    
    @IBOutlet weak var standButton1: UIButton!
    
    @IBOutlet weak var standButton2: UIButton!
    
    @IBOutlet weak var hitButton1: UIButton!
    
    @IBOutlet weak var hitButton2: UIButton!
    
    @IBOutlet weak var retryButton: UIButton!
    
    @IBOutlet weak var player1Sum: UILabel!
    
    @IBOutlet weak var player2Sum: UILabel!
    
    @IBOutlet weak var dealerSum: UILabel!
    
    
    @IBOutlet weak var player1Out: UILabel!
    
    @IBOutlet weak var player2Out: UILabel!
    
    
    var player1Labels:[UIImageView] = []
    var player2Labels:[UIImageView] = []
    var dealerLabels:[UIImageView] = []
    var blackjack: Game!
    var player1cntchip: Int = 100
    var player2cntchip: Int = 100
    var numberOfDeckSize : Int!
    var foreverOut1 = false
    var foreverOut2 = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        player1Labels += [player1Card1, player1Card2, player1Card3, player1Card4, player1Card5]
        player2Labels += [player2Card1, player2Card2, player2Card3, player2Card4, player2Card5]
        dealerLabels += [dealerCard1, dealerCard2, dealerCard3, dealerCard4, dealerCard5]
        blackjack = Game (deckSize : numberOfDeckSize, playerNumber: 2)
        player1Out.hidden = true
        player2Out.hidden = true
        getPlayer1Stats()
        getPlayer2Stats()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func player1Bet(sender: UIButton) {
        player1cntchip -= player1BetInput.text.toInt()!
        player1BetBalance.text = "\(player1cntchip)"
        
    }
    
    @IBAction func player2Bet(sender: UIButton) {
        player2cntchip -= player2BetInput.text.toInt()!
        player2BetBalance.text = "\(player2cntchip)"
       /* for i in 0..<1 {
            for x in 0..<blackjack.players[i].cards.count {
                player1Labels[x].text = blackjack.players[i].cards[x].cd
                player1Sum.text = blackjack.players[i].checkSum().strSum
                
            }
        }
        for i in 0..<1 {
            for x in 0..<blackjack.players[i].cards.count {
                player2Labels[x].text = blackjack.players[i].cards[x].cd
                player2Sum.text = blackjack.players[i].checkSum().strSum
                    
                }
        }
        for y in 0..<blackjack.dealer.cards.count {
            dealerLabels[y].text = blackjack.dealer.cards[y].cd
        }*/
    }
    
    @IBAction func player1Stand(sender: UIButton) {
        blackjack.stand1(0)
        getPlayer1Stats()
    }
    
    @IBAction func player2Stand(sender: UIButton) {
        blackjack.stand2(0)
        getPlayer2Stats()
        
    }
    
    @IBAction func player1Hit(sender: UIButton) {
        blackjack.hit1(blackjack.currentPlayer)
        var current: Int = blackjack.player1.checkSum().intSum
        if (current > 21) {
            for x in 0..<blackjack.player1.cards
                    .count {
                        player1Labels[x].image = nil
                }
                blackjack.stand1(blackjack.currentPlayer)
            }

        getPlayer1Stats()
    }
    
    @IBAction func player2Hit(sender: UIButton) {
        blackjack.hit2(blackjack.currentPlayer)
        for i in 0..<1 {
            var current: Int = blackjack.player2.checkSum().intSum
            if (current > 21) {
                for x in 0..<blackjack.player2.cards
                    .count {
                        player2Labels[x].image = nil
                }
                blackjack.stand2(blackjack.currentPlayer)
            }
        }
        getPlayer2Stats()
    }
    
    
    
    
    @IBAction func retry(sender: UIButton) {
        retryButton.hidden = true
        if !foreverOut1 {hitButton1.hidden = false}
        if !foreverOut2 {hitButton2.hidden = false}
        standButton1.hidden = false
        standButton2.hidden = false
        for i in 0..<2 {
            blackjack.player1.stand = false
        }
        for i in 0..<2 {
            dealerLabels[i].image = nil
        }
        for i in 0..<5 {
            player1Labels[i].image = nil
        }
        for i in 0..<5 {
            player2Labels[i].image = nil
        }
        blackjack.dealer.cards.removeAll(keepCapacity: false)
        blackjack.player1.cards.removeAll(keepCapacity: false)
        blackjack.player2.cards.removeAll(keepCapacity: false)
    
        
        if !blackjack.player1.isOut {
            
           for k in 0..<2 {
                blackjack.player1.addCard(blackjack.catchCard(blackjack.currentDeck)!)
           }
        }
        
        if !blackjack.player2.isOut {
            for k in 0..<2 {
                blackjack.player2.addCard(blackjack.catchCard(blackjack.currentDeck)!)
            }
        }
        blackjack.dealer.addCard(blackjack.catchCard(blackjack.currentDeck)!)
        blackjack.dealer.addCard(blackjack.catchCard(blackjack.currentDeck)!)
        getPlayer1Stats()
        getPlayer2Stats()
        
    }
    
    func reload() {
        for x in 0..<blackjack.player1.cards.count {
                player1Labels[x].image = blackjack.player1.cards[x].cd
                player1Sum.text = blackjack.player1.checkSum().strSum
                
        }
        for x in 0..<blackjack.player2.cards.count {
            player2Labels[x].image = blackjack.player2.cards[x].cd
            player2Sum.text = blackjack.player2.checkSum().strSum
            
        }


            for y in 0..<blackjack.dealer.cards.count {
            dealerLabels[y].image = blackjack.dealer.cards[y].cd
        }
    }
    
   
    
    
    func getPlayer1Stats() {
        var alreayStand1 = 0
        if blackjack.player1.isOut {
            hitButton1.hidden = true
            standButton1.hidden = true
            foreverOut1 = true;
        }
        
        reload()
        dealerSum.text = blackjack.dealer.checkSum("hidden").strSum
            if (blackjack.player1.stand == true) {
                alreayStand1 += 1
        
            
            if (blackjack.player1.stand == true) {
                dealerLabels[0].image = blackjack.dealer.cardShow()?.cd
                hitButton1.hidden = true
                standButton1.hidden = true
            }
        }

        player1BetBalance.text = "\(player1cntchip)"
        dealerLabels[0].hidden = true
        
        
    }
    
    
    func getPlayer2Stats() {
        
        
        if blackjack.player2.isOut {
            hitButton2.hidden = true
            standButton2.hidden = true
            foreverOut2 = true;
        }
        
        reload()
        

            
            
            if (blackjack.player2.stand == true && blackjack.player1.stand == true) {
                dealerLabels[0].image = blackjack.dealer.cardShow()?.cd
                //hitButton1.hidden = true
                hitButton2.hidden = true
                //standButton1.hidden = true
                standButton2.hidden = true
                while (blackjack.dealer.checkSum().intSum < 16) {
                    
                    blackjack.dealer.addCard(blackjack.catchCard(blackjack.currentDeck)!)
                    dealerSum.text = blackjack.dealer.checkSum().strSum
                }
                
                //player1socre
                player1Sum.text = showScore1(blackjack.player1.checkSum().intSum, dealerScore: blackjack.dealer.checkSum().intSum)
                if player1cntchip < 1 {
                    blackjack.player1.isOut = true
                    player1Out.hidden = false
                }
                
                //player2score
                player2Sum.text = showScore2(blackjack.player2.checkSum().intSum, dealerScore: blackjack.dealer.checkSum().intSum)
                
                if player2cntchip < 1 {
                    blackjack.player2.isOut = true
                    player2Out.hidden = false
                }
                
                dealerSum.text = blackjack.dealer.checkSum("a").strSum
                retryButton.hidden = false
                standButton2.hidden = true
                return
                
        }
        dealerSum.text = blackjack.dealer.checkSum("hidden").strSum
        player2BetBalance.text = "\(player2cntchip)"
        dealerLabels[0].hidden = true
    }
    
    func showScore1 (playerScore: Int, dealerScore: Int) -> String {
        if (playerScore > 21) {
            return ("Bust!")
        }
        
        if (dealerScore > 21) {
            dealerLabels[0].hidden = false
            player1cntchip += 2 * player1BetInput.text.toInt()!
            return ("Dealer bust! You Win!")
        }
        
        if (playerScore == 21 && dealerScore != 21) {
            dealerLabels[0].hidden = false
            player1cntchip += 4 * player1BetInput.text.toInt()!
            return ("😄Awesome! You got a Blak Jack!")
        }
        
        if (playerScore > dealerScore) {
            dealerLabels[0].hidden = false
            player1cntchip += 2 * player1BetInput.text.toInt()!
            return ("You win!")
        }
        
        if (playerScore < dealerScore) {
            dealerLabels[0].hidden = false
            return ("Unluck😔")
        }
        player1cntchip += player1BetInput.text.toInt()!
        dealerLabels[0].hidden = false
        return ("Push")
        
    }
    
    func showScore2 (playerScore: Int, dealerScore: Int) -> String {
        if (playerScore > 21) {
            return ("Bust!")
        }
        
        if (dealerScore > 21) {
            dealerLabels[0].hidden = false
            player2cntchip += 2*player2BetInput.text.toInt()!
            return ("Dealer bust! You Win!")
        }
        
        if (playerScore == 21 && dealerScore != 21) {
            dealerLabels[0].hidden = false
            player2cntchip += 4 * player2BetInput.text.toInt()!
            return ("😄Awesome! You got a Blak Jack!")
        }
        
        if (playerScore > dealerScore) {
            dealerLabels[0].hidden = false
            player2cntchip += 2 * player2BetInput.text.toInt()!
            return ("You win!")
        }
        
        if (playerScore < dealerScore) {
            dealerLabels[0].hidden = false
            return ("Unluck😔")
        }
        player2cntchip += player2BetInput.text.toInt()!
        dealerLabels[0].hidden = false
        return ("Push")
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
