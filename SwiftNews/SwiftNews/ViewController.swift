//
//  ViewController.swift
//  SwiftNews
//
//  Created by Kenta Hara on 2/15/15.
//  Copyright (c) 2015 Kenta Hara. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

  let newsUrlString = "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://www.switch-science.com/catalog/list/1/rss&num=8"
  var entries = NSArray()
  
  @IBAction func refresh(sender: AnyObject) {
    var url = NSURL(string: newsUrlString)!
    var task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, res, error) -> Void in
      var dict = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary

      if var responseData = dict["responseData"] as? NSDictionary {
        if var feed = responseData["feed"] as? NSDictionary {
          if var entries = feed["entries"] as? NSArray {
            self.entries = entries
          }
        }
      }
      
      dispatch_async(dispatch_get_main_queue(), {
        self.tableView.reloadData();
      })
    })
    task.resume()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad();
    self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "news")
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.entries.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier("news") as UITableViewCell
    cell.textLabel!.text = entries[indexPath.row]["title"] as? NSString
    return cell
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    performSegueWithIdentifier("detail", sender: entries[indexPath.row])
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "detail" {
      var dc = segue.destinationViewController as DetailController
      dc.entry = sender as NSDictionary
    }
  }
}

