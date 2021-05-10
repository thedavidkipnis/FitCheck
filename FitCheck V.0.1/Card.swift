//
//  Card.swift
//  FitCheck V.0.1
//
//  Created by Hannah Buzard on 5/9/21.
//  Copyright © 2021 David Kipnis. All rights reserved.
//

import Foundation

class Card : NSObject {
    var fileName: String
    var labelName: String
    
    init (fileName: String, labelName: String)  {
           self.fileName = fileName
           self.labelName = labelName
    }
}
