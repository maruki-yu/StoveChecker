//
//  ViewController.swift
//  StoveChekcer
//
//  Created by 木村信行 on 2024/07/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureButtons()
        loadButtonStates()
    }
    
    @IBAction func topButtonTapped(_ sender: UIButton) {
        toggleButtonState(button: sender)
    }
    @IBAction func leftButtonTapped(_ sender: UIButton) {
        toggleButtonState(button: sender)
    }
    @IBAction func rightButtonTapped(_ sender: UIButton) {
        toggleButtonState(button: sender)
    }
    
    func toggleButtonState(button: UIButton) {
        if button.backgroundColor == UIColor.gray {
            button.backgroundColor = UIColor.red
        } else {
            button.backgroundColor = UIColor.gray
        }
        saveButtonStates()
    }
    
    func saveButtonStates() {
        let defaults = UserDefaults.standard
        defaults.set(topButton.backgroundColor == UIColor.red, forKey: "topButtonState")
        defaults.set(leftButton.backgroundColor == UIColor.red, forKey: "leftButtonState")
        defaults.set(rightButton.backgroundColor == UIColor.red, forKey: "rightButtonState")
    }
    
    func loadButtonStates() {
        let defaults = UserDefaults.standard
        let topState = defaults.bool(forKey: "topButtonState")
        let leftState = defaults.bool(forKey: "leftButtonState")
        let rightState = defaults.bool(forKey: "rightButtonState")
        
        topButton.backgroundColor = topState ? UIColor.red : UIColor.gray
        leftButton.backgroundColor = leftState ? UIColor.red : UIColor.gray
        rightButton.backgroundColor = rightState ? UIColor.red : UIColor.gray
    }
    
    func configureButtons() {
        let buttons = [topButton, leftButton, rightButton]
        for button in buttons {
            button?.layer.cornerRadius = 10  // 適切な角丸半径を設定
            button?.layer.masksToBounds = true
            button?.layer.borderWidth = 1
            button?.layer.borderColor = UIColor.black.cgColor  // 境界線の色を設定
            button?.backgroundColor = UIColor.gray  // 初期背景色を設定
        }
    }
}

