//
//  NavigationBarGradientTableViewController.swift
//  Learn_Swift_Animation
//
//  Created by Limingkai on 16/12/13.
//  Copyright © 2016年 ctbri. All rights reserved.
//

import UIKit

let navigationBarHeight: CGFloat = 64;

class NavigationBarGradientTableViewController: UITableViewController {

    var color : UIColor? = nil
    
    lazy var items : [String] = {
        var temp = [String]()
        for index in 1...20 {
            temp.append("\(index)")
        }
        return temp
    }()
    
    func navigationBarAlpha(alpha:CGFloat) {
        let bgView:UIView? = navigationController?.navigationBar.value(forKey: "_backgroundView") as? UIView
        bgView?.alpha = alpha
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Navigation"
        color = navigationController?.navigationBar.barTintColor
        navigationController?.navigationBar.barTintColor = UIColor.red
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.barTintColor = color
        navigationBarAlpha(alpha: 1)
    }
 

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
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
    
    // MARK: - Scroll view delegate
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSety = scrollView.contentOffset.y
        if offSety < -navigationBarHeight {
            navigationBarAlpha(alpha: 0)
        } else {
            let alpha = (offSety + navigationBarHeight) / navigationBarHeight
            navigationBarAlpha(alpha: alpha)
        }
    }
}
