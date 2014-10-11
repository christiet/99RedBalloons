//
//  ViewController.swift
//  99RedBalloons
//
//  Created by Tony Christie on 10/10/2014.
//  Copyright (c) 2014 Spire. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var balloonsLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var balloons:[Balloon] = []
    // var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.createBalloons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBalloonBarButtonItemPressed(sender: AnyObject) {
//        let balloon = balloons[currentIndex]
//        self.balloonsLabel.text = "\(balloon.number) balloons"
//        self.backgroundImageView.image = balloon.image
//        currentIndex++
        loadRandomBalloon()
    }

    func loadRandomBalloon() {
        var randomIndex = Int(arc4random_uniform(UInt32(balloons.count)))
        
        UIView.transitionWithView(self.view, duration: 0.5, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.backgroundImageView.image = self.balloons[randomIndex].image
            self.balloonsLabel.text = self.balloons[randomIndex].message
            }, completion: {
                (finished: Bool) -> () in
        })
    }
    
    func createBalloons() {
        for var balloonCount = 0; balloonCount <= 99; ++balloonCount {
            
            var balloon = Balloon()
            let randomNumber = Int(arc4random_uniform(UInt32(4)))
            
            if balloonCount == 0 {
                balloon.message = "1 balloon"
            } else {
                balloon.message = "\(balloonCount) balloons"
            }
            
            switch randomNumber {
            case 1:
                balloon.image = UIImage(named: "RedBalloon1.jpg")
            case 2:
                balloon.image = UIImage(named: "RedBalloon2.jpg")
            case 3:
                balloon.image = UIImage(named: "RedBalloon3.jpg")
            default:
                balloon.image = UIImage(named: "RedBalloon4.jpg")
            }
            self.balloons.append(balloon)
        }
    }
}
