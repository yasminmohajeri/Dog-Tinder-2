//
//  swipeGesture.swift
//  Dog Tinder 2
//
//  Created by Yasmin Mohajeri (s5129439) on 13/01/2019.
//  Copyright © 2019 Yasmin Mohajeri (s5129439). All rights reserved.
//

import Foundation


overridefunc viewDidLoad() {super.viewDidLoad()//
    
    Do any additional setup after loading the view, typically from a nib.
    
    let leftSwipe = UISwipeGestureRecognizer(target: self, action:
        #selector(ViewController.handleSwipes(_:)))
    let rightSwipe = UISwipeGestureRecognizer(target: self, action:
        #selector(ViewController.handleSwipes(_:)))
    
    leftSwipe.direction = .Left
    rightSwipe.direction = .Right
    
    view.addGestureRecognizer(leftSwipe)
    view.addGestureRecognizer(rightSwipe)
    
}
func handleSwipes(sender:UISwipeGestureRecognizer) {
    
    if (sender.direction == .Left) {
        print("Swipe Left")
        let labelPosition = CGPointMake(self.swipeLabel.frame.origin.x - 50.0,
        self.swipeLabel.frame.origin.y);
         swipeLabel.frame = CGRectMake( labelPosition.x , labelPosition.y ,
        self.swipeLabel.frame.size.width, self.swipeLabel.frame.size.height)
        
    }
    if (sender.direction == .Right) {
        print("Swipe Right")
        let labelPosition = CGPointMake(self.swipeLabel.frame.origin.x + 50.0, self.swipeLabel.frame.origin.y);swipeLabel.frame = CGRectMake( labelPosition.x , labelPosition.y , self.swipeLabel.frame.size.width, self.swipeLabel.frame.size.height)
}
}

