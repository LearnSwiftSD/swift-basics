//
//  ViewController.swift
//  LearnSwiftExtensions
//
//  Created by John Van Roekel on 5/28/17.
//  Copyright © 2017 John Van Roekel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        label.underlineText()

//        label.isHidden = true

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)

//        label.fadeIn(delay: 1, duration: 3) {
//            self.label.flash(delay: 0, duration: 3, count: 10)
//        }
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

