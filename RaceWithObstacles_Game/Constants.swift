//
//  Constants.swift
//  RaceWithObstacles_Game
//
//  Created by Dominika Poleshyck on 8.09.21.
//

import Foundation
import UIKit

struct constants {
    static let defaultAnimationDuration: TimeInterval = 0.3
    static let speedKey = "SpeedValue"
    static let scoreKey = "ScoreValue"
    static let maximumSpeed = 5
    static let treeComplexity = (UserDefaults.standard.value(forKey: constants.speedKey) as? Int) ?? 50
    static let treeSpeed: TimeInterval = TimeInterval(Double(constants.maximumSpeed) - (Double(treeComplexity) * 0.048))
    static var countOfTreePosition = 0
}


