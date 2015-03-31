//
//  ViewControllerSinglePlayer.swift
//  Black Jack Upgrade
//
//  Created by Yue Zhao on 2/27/15.
//  Copyright (c) 2015 Yue Zhao. All rights reserved.
//

import UIKit

class ViewControllerSinglePlayer: UIViewController {

    @IBOutlet weak var betInput: UITextField!
    @IBOutlet weak var betButton: UIButton!
    @IBOutlet weak var chipBalance: UILabel!

    @IBOutlet weak var Playercard1: UIImageView!
  
    @IBOutlet weak var Playercard2: UIImageView!
    
    @IBOutlet weak var Playercard3: UIImageView!
    
    @IBOutlet weak var Playercard4: UIImageView!
    
    @IBOutlet weak var Playercard5: UIImageView!
    
    @IBOutlet weak var standButton: UIButton!
    @IBOutlet weak var hitButton: UIButton!
    @IBOutlet weak var playersum: UILabel!
    
    @IBOutlet weak var dealercard1: UIImageView!
    
    @IBOutlet weak var dealercard2: UIImageView!
    
    @IBOutlet weak var dealercard3: UIImageView!
    
    @IBOutlet weak var dealercard4: UIImageView!
    
    @IBOutlet weak var dealercard5: UIImageView!
    
   

    @IBOutlet weak var dealersum: UILabel!
    
    @IBOutlet weak var retryButton: UIButton!
    
    var playerLabels:[UIImageView] = []
    var dealerLabels:[UIImageView] = []
    var blackjack: Game!
    var cntchip:Int = 100
    var numberOfDeckSize: Int = 1
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playerLabels += [Playercard1, Playercard2, Playercard3, Playercard4, Playercard5]
        dealerLabels += [dealercard1, dealercard2, dealercard3, dealercard4, dealercard5]
        blackjack = Game (deckSize: numberOfDeckSize, playerNumber: 1)
        getPlayerStats()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Bet(sender: UIButton) {
        cntchip -= betInput.text.toInt()!
        chipBalance.text = "\(cntchip)"
        
    }
    
    @IBAction func standButton(sender: UIButton) {
        blackjack.stand1(0)
        getPlayerStats()
    }
    
    @IBAction func hitButton(sender: UIButton) {
        blackjack.hit1(blackjack.currentPlayer)
        var current:Int = blackjack.player1.checkSum().intSum
        if (current > 21) {
            for x in 0..<blackjack.player1.cards.count {
                playerLabels[x].image = nil
            }
            blackjack.stand1(blackjack.currentPlayer)
        }
        getPlayerStats()

    }
    
    @IBAction func retry(sender: UIButton) {
        retryButton.hidden = true
        hitButton.hidden = false
        standButton.hidden = false
        blackjack.player1.stand = false
        //dealerLabels[0].hidden = true
        //dealerLabels.removeAll(keepCapacity: false)
        for i in 0..<2 {dealerLabels[i].image = nil}
        for i in 0..<5 {playerLabels[i].image = nil}
        
        blackjack.player1.cards.removeAll(keepCapacity: false)
        blackjack.dealer.cards.removeAll(keepCapacity: false)
        
        //viewDidLoad()
        
        
        for k in 0..<2{blackjack.player1.addCard(blackjack.catchCard(blackjack.currentDeck)!)}
        blackjack.dealer.addCard(blackjack.catchCard(blackjack.currentDeck)!)
        blackjack.dealer.addCard(blackjack.catchCard(blackjack.currentDeck)!)
        
        
        getPlayerStats()
    }
    
    
    func getPlayerStats (){
        var alreadystand = 0
        reload()
        dealersum.text = blackjack.dealer.checkSum("hidden").strSum    //
        if (blackjack.player1.stand == true) {
            alreadystand += 1
        }
        
        if (alreadystand > 0) {
            dealerLabels[0].image = blackjack.dealer.cardShow()?.cd //??
            hitButton.hidden = true
            standButton.hidden = true
            while (blackjack.dealer.checkSum().intSum < 16) {
                blackjack.dealer.addCard(blackjack.catchCard(blackjack.currentDeck)!)
            }
            
            dealersum.text = blackjack.dealer.checkSum().strSum
            playersum.text = showScore(blackjack.player1.checkSum().intSum, dealerScore: blackjack.dealer.checkSum().intSum)
            retryButton.hidden = false
        }
        chipBalance.text = "\(cntchip)"
        //var current : Int = cntchip - betInput.text.toInt()!
        //chipBalance.text = "\(current)"
        //dealerLabels[0].hidden = true
        
    }
    
    
    func showScore(playerScore: Int, dealerScore: Int) -> String {
        
        if (playerScore > 21) {
            
            return ("Bust!")
            
        }
        
        if (dealerScore > 21) {
            dealerLabels[0].hidden = false
            cntchip += 2 * betInput.text.toInt()!
            return ("Dealer bust! You Win!")
        }
        
        if (playerScore == 21 && dealerScore != 21) {
            dealerLabels[0].hidden = false
            cntchip += 4 * betInput.text.toInt()!
            return ("😄Awesome! You got a Blak Jack!")
        }
        
        if (playerScore > dealerScore) {
            dealerLabels[0].hidden = false
            cntchip += 2 * betInput.text.toInt()!
            return ("You win!")
        }
        
        if (playerScore < dealerScore) {
            dealerLabels[0].hidden = false
            return ("Unluck😔")
        }
        cntchip += betInput.text.toInt()!
        dealerLabels[0].hidden = false
        return ("Push")
        
        
    }
    
    func reload() {
       
        for x in 0..<blackjack.player1.cards.count {
            playerLabels[x].image = blackjack.player1.cards[x].cd
            playersum.text = blackjack.player1.checkSum().strSum
            
        }
        for y in 0..<blackjack.dealer.cards.count {
            dealerLabels[y].image = blackjack.dealer.cards[y].cd
        }
        
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
