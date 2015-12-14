//
//  ViewController.swift
//  PeteJunior
//
//  Created by Goran Vukovic on 07.12.15.
//  Copyright © 2015 Goran Vukovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ARAudioRecognizerDelegate {

    @IBOutlet weak var label_dB: UILabel!
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


    func audioLevelUpdated(recognizer: ARAudioRecognizer!, averagePower: Float, peakPower: Float) {
        print("Average: ", averagePower)
        print("Peak: ", peakPower)
        
        let x: Float = ((40 + averagePower)/40)*100
        label_dB.text = String(averagePower)
    }
    func audioRecognized(recognizer: ARAudioRecognizer!) {
        
    }
//    
//    func audioLevelUpdated(recognizer: ARAudioRecognizer!, level lowPassResults: Float) {
//        //print("DB: ", lowPassResults)
//        //let x: Float = (40 + lowPassResults)/40
//        //label_dB.text = String(lowPassResults)
//
//        //print(x)
//
//    }

}

