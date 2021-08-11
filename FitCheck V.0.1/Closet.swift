//
//  Closet.swift
//  FitCheck V.0.1
//
//  Created by Hannah Buzard on 4/13/21.
//  Copyright © 2021 David Kipnis. All rights reserved.
//

import UIKit
 
class Closet: UIViewController {
    
    @IBOutlet weak var socialsButton: UIButton!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var closetButton: UIButton!
    @IBOutlet weak var likesButton: UIButton!
    
    @IBOutlet weak var categoriesTable: UITableView!
    
    var binCategoriesNames: [String] = ["Tops", "Bottoms", "Athletics", "Hats", "Socks", "Shoes", "Undergarments", "Accessories", "Seasonal", "Work", "Formal"]
    var binCategories: [UIButton] = []
    
//    let topsBinButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
    
    //main function
    override func viewDidLoad() {
        print("closet page Loaded")
        animateButton(sender: closetButton)
        closetButton.tintColor = UIColor.systemYellow
        
        loadCategoryBinViews()
    }
    
    //function for loading all the bins
    func loadCategoryBinViews() {
        categoriesTable.separatorColor = UIColor.clear
        var counter: Int = 0
        for binName in binCategoriesNames {
            let buttonToAdd: UIButton = UIButton(frame: CGRect(x: 12 + (CGFloat(counter%2)*UIScreen.main.bounds.width/2), y: CGFloat(counter/2) * (UIScreen.main.bounds.width/2 - 48), width: UIScreen.main.bounds.width/2 - 60, height: UIScreen.main.bounds.width/2 - 60))
            buttonToAdd.backgroundColor = UIColor.systemOrange
            buttonToAdd.setTitle(binName, for: .normal)
            buttonToAdd.layer.cornerRadius = 20
            buttonToAdd.addTarget(self, action: #selector(binSelected), for: .touchUpInside)
            binCategories.append(buttonToAdd)
            categoriesTable.addSubview(buttonToAdd)
            counter = counter + 1
        }
    }
    
    @objc func binSelected(_ sender: UIButton) {
        sender.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
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
    
    @IBAction func SocialClick(_ sender: Any) {
        print("Socials Button Pressed")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "social") as! SocialsPage
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
    
    
    @IBAction func HomeClick(_ sender: Any) {
        print("Home Button Pressed")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "home") as! ViewController
        self.view.window?.rootViewController = nextViewController
        self.present(nextViewController, animated: true, completion: {
            nextViewController.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
        })    }
}

