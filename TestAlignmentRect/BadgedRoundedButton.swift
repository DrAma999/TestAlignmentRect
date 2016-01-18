//
//  BadgedRoundedButton.swift
//  BPER
//
//  Created by Andrea Finollo on 11/01/16.
//

import UIKit

class BadgedRoundedButton: UIView {
    
    @IBInspectable var badgeText: String = "" {
        didSet {
            badge.text = badgeText
        }
    }
    let containerView = UIView()
    
    let roundedImageView = UIImageView()
    
    let badge = UILabel()
    

    
    override func alignmentRectInsets() -> UIEdgeInsets {
        let badgeSize = badge.bounds.size
        return UIEdgeInsets(top: 0, left: badgeSize.width / 2 , bottom: badgeSize.height / 2, right:  0)
    }
//    override func alignmentRectForFrame(frame: CGRect) -> CGRect {
//        //
//        print("Called")
//        return CGRectZero
//    }
//    
//    override func frameForAlignmentRect(alignmentRect: CGRect) -> CGRect {
//        //
//        print("Called")
//        return CGRectZero
//    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    func commonInit() {
        [containerView, badge].forEach { (view) -> () in
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        containerView.backgroundColor = UIColor.yellowColor()
        badge.backgroundColor = UIColor.greenColor().colorWithAlphaComponent(0.5)
        backgroundColor = UIColor.redColor()
        setUpConstraint()
        containerView.addSubview(roundedImageView)
        roundedImageView.image = UIImage(named: "Tot")
        roundedImageView.translatesAutoresizingMaskIntoConstraints = false
        stretchToSuperview(roundedImageView)
        
        
    }
    
    func setUpConstraint() {
        var horContraints = [NSLayoutConstraint]()
        horContraints.append(NSLayoutConstraint(item: containerView, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1, constant: 0))
        horContraints.append(NSLayoutConstraint(item: containerView, attribute: .Trailing, relatedBy: .Equal, toItem: badge, attribute: .CenterX, multiplier: 1, constant: 0))
        horContraints.append(NSLayoutConstraint(item: badge, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1, constant: 0))
        
        var verContraints = [NSLayoutConstraint]()
        verContraints.append(NSLayoutConstraint(item: containerView, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1, constant: 0))
        verContraints.append(NSLayoutConstraint(item: containerView, attribute: .Top, relatedBy: .Equal, toItem: badge, attribute: .CenterY, multiplier: 1, constant: 0))
        verContraints.append(NSLayoutConstraint(item: badge, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: 0))
       
        addConstraints(verContraints + horContraints)
        
        containerView.addConstraint(NSLayoutConstraint(item: containerView, attribute: .Height, relatedBy: .Equal, toItem: containerView, attribute: .Width, multiplier: 1, constant: 0))
        
    }
    
    func stretchToSuperview(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        ["V","H"].forEach { (quote) -> () in
            let format = String(format:"\(quote):|[view]|")
            view.superview!.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: [], metrics: nil, views: ["view" : view]))
        }
    }
}


