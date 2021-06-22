//
//  LastCard.swift
//  FitCheck V.0.1
//
//  Created by David Kipnis on 6/22/21.
//  Copyright © 2021 David Kipnis. All rights reserved.
//

import Foundation

class LastCard : NSObject {
    public var lastCardCount = 0
    static let sharedInstance: LastCard = {
        let instance = LastCard()
        return instance
    }()
}
