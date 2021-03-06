//
//  MessagesViewController.swift
//  TerribleTower
//
//  Created by Bradley R Anderson on 7/23/16.
//  Copyright © 2016 Siddharth. All rights reserved.
//

import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController {
    
    @IBOutlet weak var startScreen: UIView!
    @IBOutlet weak var pressButtonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pressButtonLabel.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dissmises the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
        
       // var components = URLComponents()
       // components.queryItems = iceCream.queryItems
        
        let layout = MSMessageTemplateLayout()
       // layout.image = iceCream.renderSticker(opaque: true)
        layout.caption = "FOO"
        
        //message.url =
        //print(message.url)
        
        //message.layout = layout

        //print("-----------------------")
    }
    
    
    
    
    @IBAction func startButtonPressed(_ sender: AnyObject) {
            self.requestPresentationStyle(.expanded)
    }
    

    
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        let vc = self.childViewControllers[0]
        (vc as! GameViewController).startGame()
        
        if (presentationStyle == .compact) {
            (vc as! GameViewController).pauseGame()
            UIView.animate(withDuration: 0.33, animations: {
                self.startScreen.alpha = 1
                vc.view.alpha = 0
            })
        }
        else {
            UIView.animate(withDuration: 0.33, animations: {
                self.startScreen.alpha = 0
                vc.view.alpha = 1
            })
        }
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
        DispatchQueue.main.after(when: .now() + 0.5) {
            let vc = self.childViewControllers[0]
            (vc as! GameViewController).startGame()
        }
    }

    @IBOutlet weak var startButton: UIButton!
}
