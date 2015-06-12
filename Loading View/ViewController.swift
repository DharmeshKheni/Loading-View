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
        
        let fullRotation = CGFloat(M_PI * 2)
        
        let animation = CAKeyframeAnimation()
        animation.keyPath = "transform.rotation.z"
        animation.duration = 2
        animation.removedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.repeatCount = Float.infinity
        animation.values = [fullRotation/4, fullRotation/2, fullRotation*3/4 , fullRotation]
        
        imageView.layer.addAnimation(animation, forKey: "rotate")
    }
    
    @IBAction func Stop(sender: AnyObject) {
        
        loadingView.hidden = true
        imageView.layer.removeAllAnimations()
    }

}

