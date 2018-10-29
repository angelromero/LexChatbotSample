//
//  ViewController.swift
//  testbot
//
//  Created by Hills, Dennis on 10/26/18.
//  Copyright © 2018 Hills, Dennis. All rights reserved.
//

import UIKit
import AWSLex
import AWSMobileClient

class ViewController: UIViewController, AWSLexVoiceButtonDelegate {
    
    @IBOutlet weak var voiceButton: AWSLexVoiceButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lexBotSetup()
        
        // Register the Lex bot button delegate so that we can trap each Lex
        // response in the voiceButton delegate methods (below) for success/error responses from Lex
        (self.voiceButton as AWSLexVoiceButton).delegate = self
    }
    
    func lexBotSetup () {
        // Lex Chatbot configuration
        let botRegion: AWSRegionType = AWSRegionType.USEast1
        let botName = "testBot" // name is shown upper left corner of Lex console
        let botAlias = "$LATEST" // see Settings tab in Lex console for your bot aliases
    
        // set up the configuration for AWS Voice Button
        let configuration = AWSServiceConfiguration(region: botRegion, credentialsProvider: AWSMobileClient.sharedInstance().getCredentialsProvider())
        
        // configure AWSLexInteractionKitConfig to use your bot
        let botConfig = AWSLexInteractionKitConfig.defaultInteractionKitConfig(withBotName: botName, botAlias: botAlias)
        
        // register the AWSLexVoiceButtonKey (defined as a UIView in the Storyboard) with the AWSLexInteractionKit client
        AWSLexInteractionKit.register(with: configuration!, interactionKitConfiguration: botConfig, forKey: AWSLexVoiceButtonKey)
    }
    
    // Delegate method for handling each successful response from Lex
    func voiceButton(_ button: AWSLexVoiceButton, on response: AWSLexVoiceButtonResponse) {
        print("text response from Lex: \(response.outputText)")
    }
    
    // Delegate method for handling each error response from Lex
    func voiceButton(_ button: AWSLexVoiceButton, onError error: Error) {
        print("error response from Lex: \(error)")
    }
}

