// Playground - noun: a place where people can play

import UIKit

class MyController: UITableViewController {
  override func viewDidLoad() {
    super.viewDidLoad();
    self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5;
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
    cell.textLabel!.text = "Swift"
    return cell
  }
}

var controller = MyController()
controller.view