//
//  ViewController.swift
//  Black Jack Upgrade
//
//  Created by Yue Zhao on 2/27/15.
//  Copyright (c) 2015 Yue Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var oneDeck: UIButton!
    @IBOutlet weak var twoDeck: UIButton!
    
    @IBOutlet weak var threeDeck: UIButton!
    
    
    var numberOfDeckSize: Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func mulPlayer(sender: UIButton) {
        self.performSegueWithIdentifier("toMultiple", sender: self)
    }
    @IBAction func oneDeck(sender: UIButton) {
        numberOfDeckSize = 1
    }
    
    @IBAction func slgPlayer(sender: UIButton) {
        self.performSegueWithIdentifier("toSingle", sender: self)
    }
    @IBAction func twoDeck(sender: UIButton) {
        numberOfDeckSize = 2
    }

    @IBAction func threeDeck(sender: UIButton) {
        numberOfDeckSize = 3
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toSingle") {
            let svc = segue.destinationViewController as ViewControllerSinglePlayer
            svc.numberOfDeckSize = numberOfDeckSize
        }else if (segue.identifier == "toMultiple") {
            let svc = segue.destinationViewController as ViewControllerMultiplePlayers
            svc.numberOfDeckSize = numberOfDeckSize
        }
    }

}

