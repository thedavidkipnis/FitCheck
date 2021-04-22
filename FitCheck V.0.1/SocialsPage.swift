//
//  SocialsPage.swift
//  FitCheck V.0.1
//
//  Created by Hannah Buzard on 4/13/21.
//  Copyright © 2021 David Kipnis. All rights reserved.
//


import UIKit
 
class SocialsPage: UIViewController {
    override func viewDidLoad() {
        print("socials page Loaded")
    }
    
    @IBAction func HomeClick(_ sender: Any) {
        print("Home Button Pressed")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "home") as! ViewController
        self.view.window?.rootViewController = nextViewController
        self.present(nextViewController, animated: true, completion: {
            nextViewController.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
        })    }
    
    
    @IBAction func LikesClick(_ sender: Any) {
        print("Likes Button Pressed")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "likes") as! LikesPage
        self.view.window?.rootViewController = nextViewController
        self.present(nextViewController, animated: true, completion: {
            nextViewController.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
        })    }
    
    
    @IBAction func ClosetClick(_ sender: Any) {
        print("Closet Button Pressed")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "closet") as! Closet
        self.view.window?.rootViewController = nextViewController
        self.present(nextViewController, animated: true, completion: {
            nextViewController.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
        })    }
}
