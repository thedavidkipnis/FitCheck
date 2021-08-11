//
//  FilterMenuTable.swift
//  FitCheck V.0.1
//
//  Created by David Kipnis on 8/9/21.
//  Copyright © 2021 David Kipnis. All rights reserved.
//

import UIKit

class FilterMenuTable {
    let nameLabel: UILabel
    let clearButton: UIButton
    
    var optionsArray: [UIButton] = []
    var optionsArrayNames: [String] = ["T-Shirts", "Denim", "Casual Pants", "Jackets/Hoodies", "Swimwear", "Undergarments", "Shoes", "Shorts", "Dresses", "Skirts", "Sweaters", "Accessories", "Sleepwear"]
    
//    static let sharedInstance: FilterMenuTable = {
//        let instance = FilterMenuTable()
//        return instance
//    }()
    
    init() {
        nameLabel = UILabel(frame: CGRect(x: 0, y:0, width: UIScreen.main.bounds.width, height: 35))
        nameLabel.text = "Filter Options"
        nameLabel.textColor = UIColor.white
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = UIColor.systemOrange
        
        clearButton = UIButton(frame: CGRect(x: UIScreen.main.bounds.width/2 - 75, y: UIScreen.main.bounds.height - 235, width: 150, height: 75))
        clearButton.setTitle("Clear", for: .normal)
        clearButton.titleLabel?.font = clearButton.titleLabel?.font.withSize(24)
        clearButton.setTitleColor(UIColor.white, for: .normal)
        clearButton.backgroundColor = UIColor.systemOrange
        clearButton.layer.cornerRadius = 37
        clearButton.layer.masksToBounds = true
        
        var counter: Int = 0
        var secondRow: Bool = false
        var xCoor: CGFloat = 0
        var yCoor: CGFloat = 0
        for title in optionsArrayNames {
            if secondRow {
                xCoor = UIScreen.main.bounds.width/2 + 10
                yCoor = (nameLabel.frame.height + 10) + (60 * CGFloat(counter/2))
                secondRow = false
            } else {
                xCoor = 10
                yCoor = (nameLabel.frame.height + 10) + (60 * CGFloat(counter/2))
                secondRow = true
            }
            optionsArray.append(UIButton(frame: CGRect(x: xCoor, y:yCoor, width: UIScreen.main.bounds.width/2 - 20, height: 35)))
            optionsArray[counter].setTitle(title, for: .normal)
            optionsArray[counter].setTitleColor(UIColor.white, for: .normal)
            optionsArray[counter].backgroundColor = UIColor.systemOrange
            optionsArray[counter].layer.cornerRadius = 12
            optionsArray[counter].layer.masksToBounds = true
            counter = counter + 1
        }
    }
}
