//
//  ViewController.swift
//  SwiftNews
//
//  Created by Kenta Hara on 2/15/15.
//  Copyright (c) 2015 Kenta Hara. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

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

