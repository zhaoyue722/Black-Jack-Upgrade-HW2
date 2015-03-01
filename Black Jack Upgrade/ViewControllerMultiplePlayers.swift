//
//  ViewControllerMultiplePlayers.swift
//  Black Jack Upgrade
//
//  Created by Yue Zhao on 2/27/15.
//  Copyright (c) 2015 Yue Zhao. All rights reserved.
//

import UIKit

class ViewControllerMultiplePlayers: UIViewController {

    @IBOutlet weak var dealerCard1: UILabel!
    
    @IBOutlet weak var dealerCard2: UILabel!
    
    @IBOutlet weak var dealerCard3: UILabel!
    
    @IBOutlet weak var dealerCard4: UILabel!
    
    @IBOutlet weak var dealerCard5: UILabel!
    
    @IBOutlet weak var player1Card1: UILabel!
  
    @IBOutlet weak var player1Card2: UILabel!
    
    @IBOutlet weak var player1Card3: UILabel!
    
    @IBOutlet weak var player1Card4: UILabel!
    
    @IBOutlet weak var player1Card5: UILabel!
    
    @IBOutlet weak var player2Card1: UILabel!
    
    @IBOutlet weak var player2Card2: UILabel!
    
    @IBOutlet weak var player2Card3: UILabel!
    
    @IBOutlet weak var player2Card4: UILabel!
    
    @IBOutlet weak var player2Card5: UILabel!
    
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
    
    var player1Labels:[UILabel] = []
    var player2Labels:[UILabel] = []
    var dealerLabels:[UILabel] = []
    var blackjack: Game!
    var player1cntchip: Int = 100
    var player2cntchip: Int = 100
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        player1Labels += [player1Card1, player1Card2, player1Card3, player1Card4, player1Card5]
        player2Labels += [player2Card1, player2Card2, player2Card3, player2Card4, player2Card5]
        dealerLabels += [dealerCard1, dealerCard2, dealerCard3, dealerCard4, dealerCard5]
        blackjack = Game (deckSize: 1, playerNumber: 2)
        // getPlayerStats()
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
        player2BetBalance.text = "\(player2BetBalance)"
        for i in 0..<1 {
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
        }
    }
    
    @IBAction func player1Stand(sender: UIButton) {
        blackjack.stand(0)
        getPlayerStats()
    }
    
    @IBAction func player2Stand(sender: UIButton) {
        blackjack.stand(0)
        getPlayerStats()
        
    }
    
    @IBAction func player1Hit(sender: UIButton) {
        blackjack.hit(blackjack.currentPlayer)
        for i in 0..<1 {
            var current: Int = blackjack.players[i].checkSum().intSum
            if (current > 21) {
                for x in 0..<blackjack.players[i].cards
                    .count {
                        player1Labels[x].text = nil
                }
                blackjack.stand(blackjack.currentPlayer)
            }
        }
        getPlayerStats()
    }
    
    @IBAction func player2Hit(sender: UIButton) {
        blackjack.hit(blackjack.currentPlayer)
        for i in 0..<1 {
            var current: Int = blackjack.players[i].checkSum().intSum
            if (current > 21) {
                for x in 0..<blackjack.players[i].cards
                    .count {
                        player1Labels[x].text = nil
                }
                blackjack.stand(blackjack.currentPlayer)
            }
        }
        getPlayerStats()
    }
    
    
    
    
    @IBAction func retry(sender: UIButton) {
        retryButton.hidden = true
        hitButton1.hidden = false
        hitButton2.hidden = false
        standButton1.hidden = false
        standButton2.hidden = false
        for i in 0..<2 {
            blackjack.players[i].stand = false
        }
        for i in 0..<2 {
            dealerLabels[i].text = " "
        }
        for i in 0..<5 {
            player1Labels[i].text = " "
        }
        for i in 0..<5 {
            player2Labels[i].text = " "
        }
        blackjack.dealer.cards.removeAll(keepCapacity: false)
        for i in 0..<2 {
            blackjack.players[i].cards.removeAll(keepCapacity: false)
        }
        
        for k in 0..<2 {
            for i in 0..<2 {
                blackjack.players[i].addCard(blackjack.catchCard(blackjack.currentDeck)!)
            }
        }
        
        blackjack.dealer.addCard(blackjack.catchCard(blackjack.currentDeck)!)
        blackjack.dealer.addCard(blackjack.catchCard(blackjack.currentDeck)!)
        getPlayerStats()
        
    }
    
    func reload() {
        for i in 0..<1 {
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
        }
    }
    
    
    func getPlayerStats() {
        var alreayStand1 = 0
        var alreayStand2 = 0
        
        reload()
        dealerSum.text = blackjack.dealer.checkSum("hidden").strSum
        for i in 0..<1 {
            if (blackjack.players[i].stand == true) {
                alreayStand1 += 1
            }
            
            if (alreayStand1 > 0) {
                dealerLabels[0].text = blackjack.dealer.cardShow()?.cd
                hitButton1.hidden = true
                //hitButton2.hidden = true
                standButton1.hidden = true
                //standButton2.hidden = true
                while (blackjack.dealer.checkSum().intSum < 16) {
                    blackjack.dealer.addCard(blackjack.catchCard(blackjack.currentDeck)!)
                    dealerSum.text = blackjack.dealer.checkSum().strSum
                    player1Sum.text = showScore1(blackjack.players[i].checkSum().intSum, dealerScore: blackjack.dealer.checkSum().intSum)
                    retryButton.hidden = false
                }
                
            }
        }
        for i in 0..<1 {
            if (blackjack.players[i].stand == true) {
                alreayStand2 += 1
            }
            
            if (alreayStand2 > 0) {
                dealerLabels[0].text = blackjack.dealer.cardShow()?.cd
                //hitButton1.hidden = true
                hitButton2.hidden = true
                //standButton1.hidden = true
                standButton2.hidden = true
                while (blackjack.dealer.checkSum().intSum < 16) {
                    blackjack.dealer.addCard(blackjack.catchCard(blackjack.currentDeck)!)
                    dealerSum.text = blackjack.dealer.checkSum().strSum
                    player1Sum.text = showScore1(blackjack.players[i].checkSum().intSum, dealerScore: blackjack.dealer.checkSum().intSum)
                    retryButton.hidden = false
                }
                
            }
        }
        player1BetBalance.text = "\(player1cntchip)"
        dealerLabels[0].hidden = true
        
        
    }
    
    func showScore1 (playerScore: Int, dealerScore: Int) -> String {
        if (playerScore > 21) {
            return ("Bust!")
        }
        
        if (dealerScore > 21) {
            dealerLabels[0].hidden = false
            player1cntchip += 2*player1BetInput.text.toInt()!
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
