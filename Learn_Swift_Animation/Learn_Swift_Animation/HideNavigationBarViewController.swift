//
//  HideNavigationBarViewController.swift
//  Learn_Swift_Animation
//
//  Created by Limingkai on 16/12/13.
//  Copyright © 2016年 ctbri. All rights reserved.
//

import UIKit

class HideNavigationBarViewController: UITableViewController {

    lazy var items : [String] = {
       var temp = [String]()
        for index in 1...20 {
            temp.append("\(index)")
        }
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Navigation"
        navigationController?.hidesBarsOnSwipe = true
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
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



