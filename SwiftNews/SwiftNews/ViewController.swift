//
//  ViewController.swift
//  SwiftNews
//
//  Created by Kenta Hara on 2/15/15.
//  Copyright (c) 2015 Kenta Hara. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

  let newsUrlString = "http://makerbox.net/"
  
  @IBAction func refresh(sender: AnyObject) {
    var url = NSURL(string: newsUrlString)!
    var task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, res, error) -> Void in
      println("done, length \(data.length)")
    })
    task.resume()
    println("start task")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad();
    self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "news")
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier("news") as UITableViewCell
    cell.textLabel!.text = "a news"
    return cell
  }


}

