//
//  ViewController.swift
//  Loading View
//
//  Created by Anil on 12/06/15.
//  Copyright (c) 2015 Variya Soft Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loadingLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView.hidden = true
    }

    @IBAction func Start(sender: AnyObject) {
        
        loadingView.hidden = false
        rotateViewLayer()
    }
    
    @IBAction func Stop(sender: AnyObject) {
        
        
        loadingView.hidden = true
        imageView.layer.removeAllAnimations()
    }
    
    func rotateViewLayer() {
        let rotateView = CABasicAnimation()
        
        rotateView.fromValue = 0.degreesToRadian
        rotateView.toValue = 360.degreesToRadian
        rotateView.duration = 1
        rotateView.repeatCount = Float.infinity
        rotateView.removedOnCompletion = false
        rotateView.fillMode = kCAFillModeForwards
        rotateView.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        imageView.layer.addAnimation(rotateView, forKey: "transform.rotation.z")
    }

}

extension Int {
    var degreesToRadian : CGFloat {
        return CGFloat(self) * CGFloat(M_PI) / 180.0
    }
}

