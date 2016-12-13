//
//  WaveButtonViewController.swift
//  Learn_Swift_Animation
//
//  Created by Limingkai on 16/12/13.
//  Copyright © 2016年 ctbri. All rights reserved.
//

import UIKit

class WaveButtonViewController: UIViewController {

    @IBOutlet weak var button1: AnimationButton!
    @IBOutlet weak var button2: AnimationButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
        button1.fill = true
        button1.wave()
        
        button2.wave()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
