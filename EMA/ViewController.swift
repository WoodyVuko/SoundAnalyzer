//
//  ViewController.swift
//  EMA
//
//  Created by Carsten Voß on 12.10.15.
//  Copyright © 2015 Beuth-Hochschule. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    @IBOutlet weak var previewView: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib. LOVE YA
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.intialSetup()
    }
    
    func intialSetup()
    {
        let captureSession = AVCaptureSession()
        
        var captureDevice : AVCaptureDevice?
        
        let devices = AVCaptureDevice.devices()
        for device in devices
        {
            if (device.hasMediaType(AVMediaTypeVideo))
            {
                if(device.position == AVCaptureDevicePosition.Back)
                {
                    captureDevice = device as? AVCaptureDevice
                }
            }
        }
        
        if (captureDevice != nil)
        {
            let input : AVCaptureDeviceInput?
            do {
                input = try AVCaptureDeviceInput(device: captureDevice)
            }
            catch let error as NSError {
                input = nil
                NSLog("error creating input device:", error.localizedDescription)
                return
            }
            
            if (captureSession.canAddInput(input))
            {
                captureSession.addInput(input)
            }
        }
        
        let videoOutput = AVCaptureVideoDataOutput()
        videoOutput.setSampleBufferDelegate(self,
            queue: dispatch_queue_create("sample buffer delegate", DISPATCH_QUEUE_SERIAL))
        
        if (captureSession.canAddOutput(videoOutput))
        {
            captureSession.addOutput(videoOutput)
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.previewView.layer.addSublayer(previewLayer)
        previewLayer?.frame = self.previewView.bounds
        captureSession.startRunning()
    }
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, fromConnection connection: AVCaptureConnection!)
    {
        
    }

}

