//
//  ViewController.swift
//  PeteJunior
//
//  Created by Goran Vukovic on 07.12.15.
//  Copyright © 2015 Goran Vukovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ARAudioRecognizerDelegate {

    private var xyz: ARAudioRecognizer = ARAudioRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        xyz.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func audioRecognized(recognizer: ARAudioRecognizer!) {
        print("Fre: ", xyz.frequency)
    }
    func audioLevelUpdated(recognizer: ARAudioRecognizer!, level lowPassResults: Float) {
        print("DB: ", lowPassResults)
    }

}

