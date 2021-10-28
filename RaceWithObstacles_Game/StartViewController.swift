//
//  StartViewController.swift
//  RaceWithObstacles_Game
//
//  Created by Dominika Poleshyck on 16.09.21.
//

import Foundation
import UIKit

class StartViewController: UIViewController {
    @IBOutlet weak var countOfTreePositionLabel: UILabel!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        countOfTreePositionLabel.text = String(UserDefaults.standard.integer(forKey: constants.scoreKey))
    }
    @IBAction func startButton() {
//        constants.countOfTreePosition = 0
    }
}
