//
//  CountdownViewController.swift
//  Ampulheta
//
//  Created by Ronan Rodrigo Nunes on 16/07/2015.
//  Copyright © 2015 Ronan Rodrigo Nunes. All rights reserved.
//

import Cocoa

class CountdownViewController: NSViewController {

    @IBOutlet weak var triggerBttn: NSButton!
    @IBOutlet weak var secondsTxtFld: NSTextField!
    var counting = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startCountdown(sender: AnyObject) {
        counting = !counting
        setTimer()
    }
    
    func setTimer(){
        updateView()
        if counting {
            NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: false)
        }
    }
    
    func updateTime(){
        if secondsTxtFld.integerValue != 0 && counting {
            secondsTxtFld.integerValue--
            setTimer()
        } else {
            counting = false
            updateView()
        }
    }
    
    func updateView(){
        secondsTxtFld.stringValue = String(secondsTxtFld.integerValue)
        secondsTxtFld.enabled = !counting
        triggerBttn.title = counting ? "🔴" :  "🔵"
    }
}
