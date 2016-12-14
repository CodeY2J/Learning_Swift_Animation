//
//  ShakeAnimationViewController.swift
//  Learn_Swift_Animation
//
//  Created by Limingkai on 16/12/14.
//  Copyright © 2016年 ctbri. All rights reserved.
//

import UIKit

class ShakeAnimationViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions
    @IBAction func shakeButtonPressed(_ sender: Any) {
        animation()
    }
    
    
    @IBAction func shake1ButtonPressed(_ sender: Any) {
        animation1()
    }
    
    
    func animation() {
        let centerX = self.textField.center.x
        UIView.animateKeyframes(withDuration: 0.75, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.15, animations: {
                self.textField.center.x = centerX - 20
            })
            UIView.addKeyframe(withRelativeStartTime: 0.15, relativeDuration: 0.15, animations: {
               self.textField.center.x = centerX + 20
            })
            UIView.addKeyframe(withRelativeStartTime: 0.30, relativeDuration: 0.15, animations: {
               self.textField.center.x = centerX - 20
            })
            UIView.addKeyframe(withRelativeStartTime: 0.45, relativeDuration: 0.15, animations: {
                self.textField.center.x = centerX + 20
            })
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.15, animations: {
                self.textField.center.x = centerX
            })
        }, completion: nil)
    }
  
    func animation1() {
        let animation = CAKeyframeAnimation(keyPath: "position.x")
        animation.values = [0,20,-20,20,0]
        animation.keyTimes = [NSNumber(value: 1),NSNumber(value: 1.0 / 6.0),NSNumber(value: 3.0 / 6.0),NSNumber(value: 5.0 / 6.0),NSNumber(value: 1.0)]
        animation.duration = 0.4
        animation.isAdditive = true
        self.textField.layer .add(animation, forKey: "shake")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
