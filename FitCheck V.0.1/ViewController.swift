//
//  ViewController.swift
//  FitCheck V.0.1
//
//  Created by David Kipnis and Hannah Buzard on 4/7/21.
//  Copyright © 2021 David Kipnis and Hannah Buzard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isOn: Bool = false
    
    @IBAction func animateButton(sender: UIButton) {

        sender.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)

        UIView.animate(withDuration: 0.5,
                                   delay: 0,
                                   usingSpringWithDamping: CGFloat(0.20),
                                   initialSpringVelocity: CGFloat(6.0),
                                   options: UIView.AnimationOptions.allowUserInteraction,
                                   animations: {
                                    sender.transform = CGAffineTransform.identity
            },
                                   completion: { Void in()  }
        )
    }
    
    @IBAction func buttonPress(_ sender: UIButton) {
        isOn.toggle()
        sender.tintColor = UIColor.systemYellow
        mainButton.tintColor = UIColor.white
        closetButton.tintColor = UIColor.white
        likesButton.tintColor = UIColor.white
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "social") as! SocialsPage
        self.view.window?.rootViewController = nextViewController
        self.present(nextViewController, animated: true, completion: {
            nextViewController.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
        })}
    
    @IBAction func mainButtonPress(_ sender: UIButton) {
        isOn.toggle()
        print("Trig")
        sender.tintColor = UIColor.systemYellow
        socialsButton.tintColor = UIColor.white
        closetButton.tintColor = UIColor.white
        likesButton.tintColor = UIColor.white
        //TODO: add nav func
    }
    
    @IBAction func ClosetClick(_ sender: UIButton) {
        isOn.toggle()
        print("Trig")
        sender.tintColor = UIColor.systemYellow
        mainButton.tintColor = UIColor.white
        socialsButton.tintColor = UIColor.white
        likesButton.tintColor = UIColor.white
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "closet") as! Closet
        self.view.window?.rootViewController = nextViewController
        self.present(nextViewController, animated: true, completion: {
            nextViewController.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
        })

    }
    
    @IBAction func LikesClick(_ sender: UIButton) {
        isOn.toggle()
        sender.tintColor = UIColor.systemYellow
        mainButton.tintColor = UIColor.white
        closetButton.tintColor = UIColor.white
        socialsButton.tintColor = UIColor.white
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "likes") as! LikesPage
        self.view.window?.rootViewController = nextViewController
        self.present(nextViewController, animated: true, completion: {
            nextViewController.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
        })}
    
    
    @IBOutlet weak var socialsButton: UIButton!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var closetButton: UIButton!
    @IBOutlet weak var likesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

