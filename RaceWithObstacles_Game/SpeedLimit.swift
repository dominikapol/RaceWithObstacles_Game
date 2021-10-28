//
//  SpeedLimit.swift
//  RaceWithObstacles_Game
//
//  Created by Dominika Poleshyck on 12.09.21.
//

import Foundation
import UIKit


class Settings: UIViewController {
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var complexity: UILabel!
    @IBOutlet weak var speedometer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = (UserDefaults.standard.value(forKey: constants.speedKey) as? Int) ?? 50
        speedometer.text = String(Int(value)) + "%"
        speedSlider.value = Float(value)
    }
    
    @IBAction func sliderSettings(_ sender: UISlider) {
        let speedValue = sender.value
        speedometer.text = String(Int(speedValue)) + "%"
    }
    
    @IBAction func buttonSave() {
        let savedSpeedValue = Int(speedSlider.value)
        UserDefaults.standard.setValue(savedSpeedValue, forKey: constants.speedKey)
        UserDefaults.standard.synchronize()
        navigationController?.popToRootViewController(animated: true)
    }
    
}

