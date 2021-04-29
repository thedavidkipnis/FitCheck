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
    
    //animating nav bar button clicks
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
    
    //clicking the socials page button
    @IBAction func SocialClick(_ sender: UIButton) {
        isOn.toggle()
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "social") as! SocialsPage
        self.view.window?.rootViewController = nextViewController
        self.present(nextViewController, animated: true, completion: {
            nextViewController.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
        })}
    
    //clicking the home page button
    @IBAction func mainButtonPress(_ sender: UIButton) {
        isOn.toggle()
    }
    
    //clicking the closet page button
    @IBAction func ClosetClick(_ sender: UIButton) {
        isOn.toggle()
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "closet") as! Closet
        self.view.window?.rootViewController = nextViewController
        self.present(nextViewController, animated: true, completion: {
            nextViewController.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
        })
    }
    
    //clicking the likes page button
    @IBAction func LikesClick(_ sender: UIButton) {
        isOn.toggle()
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "likes") as! LikesPage
        self.view.window?.rootViewController = nextViewController
        self.present(nextViewController, animated: true, completion: {
            nextViewController.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
        })}
    
    //outlets for the card and the two like icons on the card for swiping
    @IBOutlet weak var Card: UIImageView!
    @IBOutlet weak var likeIcon: UIImageView!
    @IBOutlet weak var dislikeIcon: UIImageView!
    @IBOutlet weak var navBar: UIView!
    
    //card Swiping
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        var regenFlag = false
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
            
        if xFromCenter > 0 {
            likeIcon.alpha = xFromCenter / 100
            dislikeIcon.alpha = 0
        } else {
            dislikeIcon.alpha = xFromCenter / -100
            likeIcon.alpha = 0
        }
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y - 50)
        
        //when user stops holding the card, check if it passed boundaries
        if sender.state == UIGestureRecognizer.State.ended {
            if card.center.x < 75 {
            //move card off screen to the left
                UIView.animate(withDuration: 0.2, animations: {
                    card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.transform = card.transform.rotated(by: -.pi/10)
                    card.alpha = 0
                })
                regenFlag = true
            } else if card.center.x > (view.frame.width - 75) {
            //move card off screen to the right
                UIView.animate(withDuration: 0.2, animations: {
                    card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.transform = card.transform.rotated(by: .pi/10)
                    card.alpha = 0
                })
                regenFlag = true
            }
            
            if regenFlag == false {
            UIView.animate(withDuration: 0.2, animations: {
                card.center = CGPoint(x: self.navBar.center.x, y: self.view.center.y - 50)
                self.likeIcon.alpha = 0
                self.dislikeIcon.alpha = 0
            })
            } else {
//                card.alpha = 0
//                UIView.animate(withDuration: 0, animations: {
//                    card.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
//                })
//                UIView.animate(withDuration: 1.0, animations: {
//                    card.alpha = 1
//                })
//                self.likeIcon.alpha = 0
//                self.dislikeIcon.alpha = 0
            }
        }
    }
    
    @IBOutlet weak var socialsButton: UIButton!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var closetButton: UIButton!
    @IBOutlet weak var likesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        animateButton(sender: mainButton)
        mainButton.tintColor = UIColor.systemYellow
        
        //generating and adding image to first card
        let image = UIImage(named: "test_image")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: 314, height: 540)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        self.Card.addSubview(imageView)
        Card.bringSubviewToFront(likeIcon)
        Card.bringSubviewToFront(dislikeIcon)
    }
}

