//
//  ViewController.swift
//  S2
//
//  Created by lijunge on 15/5/30.
//  Copyright (c) 2015年 lijunge. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var items: Array<String> = ["1", "2", "3"]
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
        //self.title = "❤️"
        self.navigationItem.title = "Demo"
        
        setupTableView()
        setupLeftNavButton()
        setupRightNavButton()
    }
    
    private func setupTableView() {
        self.tableView = UITableView(frame: self.view.frame, style:UITableViewStyle.Plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //way 2 to reuse cell
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView!)
    }
    
    private func setupLeftNavButton() {
        let barButtonItem = UIBarButtonItem(title: "Sub", style: UIBarButtonItemStyle.Plain, target: self, action: "leftBarButtonItemClicked")
        self.navigationItem.leftBarButtonItem = barButtonItem
    }
    
    func leftBarButtonItemClicked() {
        if !items.isEmpty {
            items.removeLast()
        }
        tableView?.reloadData()
    }
    
    private func setupRightNavButton() {
        var barButtonItem = UIBarButtonItem(title: "Add", style: .Plain, target: self, action: "rightBarButtonItemClicked")
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    func rightBarButtonItemClicked() {
       
        items += [""]
        self.tableView?.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    //mark tableView
    var cnt = 0
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

//way 1 to reuse cell
        
//        let cellIdentifier: String = "cell"
//        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
//        
//        if cell == nil {
//            
//             cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier:cellIdentifier)
//            
//        }
//        println(cell)
//        return cell!

//way 2 to reuse cell
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.textLabel?.text = items[indexPath.row]
        return cell
        
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You have click in row \(indexPath.row)")
    }
}

