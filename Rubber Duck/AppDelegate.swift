//
//  AppDelegate.swift
//  Rubber Duck
//
//  Created by Edward Yu on 25/09/2015.
//  Copyright © 2015 The Rubber Ducklings. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

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

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    


}

