//
//  ViewController.swift
//  Rubber Duck
//
//  Created by Edward Yu on 25/09/2015.
//  Copyright © 2015 The Rubber Ducklings. All rights reserved.
//

import UIKit
import AVFoundation

//class ViewController: UIViewController {
class ViewController: UIViewController, SpeechKitDelegate, SKRecognizerDelegate {
    
    let messages = ["Check your semicolons.", "Did you mismatch your brackets?", "Were you trying to cause a new #gotofail bug by not putting curly braces around your statements?",
        "Are you sure that the cyclic dependency between objects is a good idea?", "What's the endianness of the machine you're trying to code on?",
        "Have you imported your library?", "Did you mismatch your format specifiers with printf?", "Are you casting correctly?", "Did you mix up your mutable and immutable objects?",
        "Are you sure you declared your variables?", "What are you doing with the null object?", "There's a huge difference between checking for equality and assignment, you know.",
        "Have you declared your functions?", "Did you step out of bounds of your array?", "What are you doing with memory that's not allocated to you?",
        "Did you sanitize your input?", "Why are you using an exponential-time algorithm on this large dataset?", "Are you using the frameworks correctly?",
        "Are you sure that random function gives you a number that's random enough for your purposes?",
        "Did you mix up your days and months? Don't worry, there's at least a country of people who have the same problem.", "Program in a different language.",
        "Try writing out your algorithm in pseudocode.", "Take a break. You've spent way too much time trying to debug.",
        "Go talk to a human, you may be an object of the Programmer class, but that's still a subclass of Human.",
        "Drink a cup of coffee or tea.", "Have you Googled your problem?", "Take a look at Stack Overflow.", "Go update your IDE.", "RTFM.", "Restart your computer.",
        "Customize your IDE, and your OS too while you're at it.", "Who do you think you are, trying to reinvent the wheel and that library?",
        "You should spend some time doing extended clicking around Wikipedia.", "Take a break and eat a duck. It'll help you debug your code.", "You should reinstall your OS.",
        "Go program on Scratch.", "What were you thinking, that programming at 4 in the morning would produce bug-free code?", "Try casting 'Reparo' on the code.",
        "Check your sanity, why on earth are you asking an inanimate object for help?", "Try importing antigravity.",
        "Open a terminal window and type 'sudo rm -rf /'. I'm not responsible for any lost files though.",
        "Just give up. It's impossible to fix thousands of lines of spaghetti code anyways.", "Maybe a segmentation fault is just the best fate of your shoddy program.",
        "Say 'aluminium' instead of 'aluminum'. Sir Ive might help you in gratitude.", "Try slacking off. After all, you have the legitimate excuse of 'my code's compiling'."]

    
    let speechSynthesizer = AVSpeechSynthesizer()
    
//    var voiceRecognizer = SKRecognizer(type: SKSearchRecognizerType, detection: UInt(SKShortEndOfSpeechDetection), language: "en-US", delegate: self as! SKRecognizerDelegate)
    var voiceRecognizer : SKRecognizer?

    var appDelegate : AppDelegate!
    
    @IBOutlet weak var duckButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        activityIndicator.stopAnimating()
        print(SpeechKitApplicationKey)
        appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.setupSpeechKitConnection()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tappedOnDuck(sender: UIButton) {
        sender.selected = !sender.selected
        
        if sender.selected {
            voiceRecognizer = SKRecognizer(type: SKDictationRecognizerType, detection: UInt(SKShortEndOfSpeechDetection), language: "en-US", delegate: self as SKRecognizerDelegate)

        } else {
            if let recognizer = voiceRecognizer {
                recognizer.stopRecording()
                recognizer.cancel()
            }
            
        }
    }
    

    
    func recognizerDidBeginRecording(recognizer: SKRecognizer!) {
        activityIndicator.startAnimating()
        print("Listening")
    }
    
    func recognizerDidFinishRecording(recognizer: SKRecognizer!) {
        activityIndicator.stopAnimating()
        print("Done Listening")
    }
    
    func recognizer(recognizer: SKRecognizer!, didFinishWithError error: NSError!, suggestion: String!) {
        print("Recognizer finished with error!")
        duckButton.selected = !duckButton.selected
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle:.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func recognizer(recognizer: SKRecognizer!, didFinishWithResults results: SKRecognition!) {
        print("Recognized with following results:")
        let numberOfResults : CLong = results.results.count
        
        if numberOfResults > 0 {
            let textResult = results.firstResult()
            print(textResult)
            self.displayAndSpeakResponse(input: textResult)

            }
        duckButton.selected = !duckButton.selected
        
        if let recognizer = voiceRecognizer {
            recognizer.cancel()
        }
        
    }
    
    
    func displayAndSpeakResponse(input input: String) -> Void {
        let message = messages[random() % messages.count]
        
        let speechUtterance =  AVSpeechUtterance(string: message)
        
        
        let alertController = UIAlertController(title: "Rubber Duck says...", message: "\(message)\nin response to\n\"\(input)\"", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
            (UIAlertAction) -> Void in
            if self.speechSynthesizer.speaking {
                self.speechSynthesizer.stopSpeakingAtBoundary(AVSpeechBoundary.Word)
            }
            })
        
        self.presentViewController(alertController, animated: true) {
            () -> Void in
            self.speechSynthesizer.speakUtterance(speechUtterance)
        }
    }

}

