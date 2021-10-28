//
//  ViewController.swift
//  RaceWithObstacles_Game
//
//  Created by Dominika Poleshyck on 6.09.21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var car: UIImageView!
    @IBOutlet weak var tree: UIImageView!
    @IBOutlet weak var carCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var treeCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var treeTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var roadStripe: UIView!
    
    let carApearanceTimeInterval: TimeInterval = 5
    let record = UserDefaults.standard.integer(forKey: constants.scoreKey)
    let alertRecord = UIAlertController(title: "Congradulations!", message: "You have set a new record!", preferredStyle: .alert)
    let alertRecordAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    var positionOfCar: Position = .center {
        didSet {
            UIView.animate(withDuration: constants.defaultAnimationDuration) {
                self.carCenterConstraint.constant = self.positionOfCar.ofSet
                self.view.layoutSubviews()
            }
        }
    }
    
    var treePosition: Position = .center {
        didSet {
            self.treeCenterConstraint.constant = treePosition.ofSet
            self.treeTopConstraint.constant = 0
            self.view.layoutSubviews()
            let treeComplexity = (UserDefaults.standard.value(forKey: constants.speedKey) as? Int) ?? 50
            let treeSpeed: TimeInterval = TimeInterval(Double(constants.maximumSpeed) - (Double(treeComplexity) * 0.048))
            UIView.animate(withDuration: treeSpeed) {
                self.treeTopConstraint.constant = self.roadStripe.frame.height - self.tree.frame.height
                self.view.layoutSubviews()
            } completion: { _ in
                if self.positionOfCar == self.treePosition {
                    self.navigationController?.popToRootViewController(animated: true)
                    self.alertRecord.addAction(self.alertRecordAction)
                    self.present(self.alertRecord, animated: true, completion: nil)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moveTreeToRandomPlace()
    }
    
    @IBAction func leftButtonPressed() {
        switch positionOfCar {
        case .right:
            positionOfCar = .center
        case .center:
            positionOfCar = .left
        case .left:
            break
        }
    }
    
    @IBAction func rightButtonPressed() {
        switch positionOfCar {
        case .left:
            positionOfCar = .center
        case .center:
            positionOfCar = .right
        case .right:
            break
        }
    }
    
    func moveTreeToRandomPlace() {
        Timer.scheduledTimer(withTimeInterval: carApearanceTimeInterval, repeats: true) { _ in
            self.treePosition = Position.allCases.randomElement()
            self.updateRecord()
        }
    }
    
    func updateRecord() {
        constants.countOfTreePosition += 1
        if record == 0 || record < constants.countOfTreePosition  {
            UserDefaults.standard.setValue(constants.countOfTreePosition, forKey: constants.scoreKey)
            UserDefaults.standard.synchronize()
            alertRecord.addAction(alertRecordAction)
            present(alertRecord, animated: true, completion: nil)
        }
    }
}
