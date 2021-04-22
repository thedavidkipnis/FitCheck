//
//  ViewController.swift
//  FitCheck V.0.1
//
//  Created by David Kipnis on 4/7/21.
//  Copyright © 2021 David Kipnis. All rights reserved.
//

import UIKit
 
class LikesPage: UIViewController {
    override func viewDidLoad() {
        print("likes page Loaded")
    }
    
    @IBAction func SocialClick(_ sender: Any) {
        print("Socials Button Pressed")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "social") as! SocialsPage
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    
    @IBAction func HomeClick(_ sender: Any) {
        print("Home Button Pressed")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "home") as! ViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    
    @IBAction func ClosetClick(_ sender: Any) {
        print("Closet Button Pressed")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "closet") as! Closet
        self.present(nextViewController, animated:true, completion:nil)
    }
}

