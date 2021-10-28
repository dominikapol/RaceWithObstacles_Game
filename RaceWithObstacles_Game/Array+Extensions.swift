//
//  Array+Extensions.swift
//  RaceWithObstacles_Game
//
//  Created by Dominika Poleshyck on 8.09.21.
//

import Foundation

extension Array {
    func randomElement() -> Element {
        let randomIndex = Int.random(in: 0..<self.count)
        return self[randomIndex]
    }
}
