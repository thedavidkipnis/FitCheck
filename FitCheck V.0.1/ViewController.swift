//
//  ViewController.swift
//  FitCheck V.0.1
//
//  Created by David Kipnis on 4/7/21.
//  Copyright © 2021 David Kipnis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isOn: Bool = false
    
    @IBAction func buttonPress(_ sender: UIButton) {
        isOn.toggle()
        print("Button Pressed")
//        setButtonBackGround(view: sender, on:  UIImage(imageLiteralResourceName: "heart.fill"), off:  UIImage(imageLiteralResourceName: "person.2"), onOffStatus: isOn)
    }
    
    
    @IBAction func SocialClick(_ sender: Any) {
        print("Socials Button Pressed")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "social") as! SocialsPage
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    
    @IBAction func LikesClick(_ sender: Any) {
        print("Likes Button Pressed")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "likes") as! LikesPage
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    
    @IBAction func ClosetClick(_ sender: Any) {
        print("Closet Button Pressed")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "closet") as! Closet
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    
    func setButtonBackGround(view: UIButton, on: UIImage, off: UIImage, onOffStatus: Bool ) {
         switch onOffStatus {
              case true:
    // Change backgroundImage to heart image
                   view.setImage(on, for: .normal)
    // Test
              print("Button Pressed")
              default:
                   view.setImage(off, for: .normal)
                   print("Button Unpressed")
    }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

