//
//  Position.swift
//  RaceWithObstacles_Game
//
//  Created by Dominika Poleshyck on 7.09.21.
//

import Foundation
import UIKit

enum Position: CaseIterable {
    case right
    case left
    case center
    var constantMultiplier: CGFloat{
        return 0.35
    }
    
    var ofSet: CGFloat {
        switch self {
        case .right:
            return UIScreen.main.bounds.width * constantMultiplier
        case .left:
            return -UIScreen.main.bounds.width * constantMultiplier
        case .center:
            return 0
        }
    }
}
