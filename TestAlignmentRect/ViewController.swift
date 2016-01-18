//
//  ViewController.swift
//  TestAlignmentRect
//
//  Created by Andrea Finollo on 18/01/16.
//  Copyright © 2016 Andrea Finollo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var xAxis: UIView!
    @IBOutlet weak var yAxis: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the view
        let badgeRoundedView = BadgedRoundedButton(frame: CGRectZero)
        badgeRoundedView.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding a badge number
        badgeRoundedView.badgeText = "345"
        
        view.addSubview(badgeRoundedView)
        
        // Add constrint to center the view on the superview
        var horContraints = [NSLayoutConstraint]()
        horContraints.append(NSLayoutConstraint(item: badgeRoundedView, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1, constant: 0))
        
        var verContraints = [NSLayoutConstraint]()
        verContraints.append(NSLayoutConstraint(item: badgeRoundedView, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0))
        
        view.addConstraints(verContraints + horContraints)
        badgeRoundedView.addConstraint(NSLayoutConstraint(item: badgeRoundedView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: 200))
        badgeRoundedView.addConstraint(NSLayoutConstraint(item: badgeRoundedView, attribute: .Height, relatedBy: .Equal, toItem: badgeRoundedView, attribute: .Width, multiplier: 1, constant: 0))
        
        view.bringSubviewToFront(xAxis)
        view.bringSubviewToFront(yAxis)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

