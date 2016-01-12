//
//  ViewController.swift
//  UITableViewCell Animation
//
//  Created by Rahul Garg on 12/01/16.
//  Copyright © 2016 Rahul Garg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let screenBounds:CGRect = UIScreen.mainScreen().bounds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


//MARK: UITableView Delegate and DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell1")! as UITableViewCell
        cell.textLabel?.text = "Row : \(indexPath.row)"
        
        return cell
    }
    
    //used for animation
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        cell.frame = CGRectMake(screenBounds.width, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height)
        
        UIView.animateWithDuration(1.0,
            delay: 0,
            usingSpringWithDamping: 0.4,
            initialSpringVelocity: 0.6,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: {
                cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height)
            }, completion: {
                finished in
                
            }
        )
    }
}
