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
    
    func setButtonBackGround(view: UIButton, on: UIImage, off: UIImage, onOffStatus: Bool ) {
         switch onOffStatus {
              case true:
    // Chnage backgroundImage to hart image
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

