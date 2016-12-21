//
//  ViewController.swift
//  KTCheckboxButton
//
//  Created by Kartik Patel on 12/21/16.
//  Copyright © 2016 Kartik Patel. All rights reserved.
//

import UIKit

class CheckboxExampleViewController: UIViewController, CheckboxButtonDelegate {

    @IBOutlet weak var cbButtonOne: CheckboxButton!
    @IBOutlet weak var cbButtonTwo: CheckboxButton!
    @IBOutlet weak var cbButtonThree: CheckboxButton!
    @IBOutlet weak var cbButtonFour: CheckboxButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        cbButtonOne.delegate = self
        cbButtonTwo.delegate = self
        cbButtonThree.delegate = self
        cbButtonFour.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func button(button : CheckboxButton, didSelected: Bool) -> Void {
        print("button: \(button.titleLabel?.text) - selected: \(didSelected)")
    }
}

