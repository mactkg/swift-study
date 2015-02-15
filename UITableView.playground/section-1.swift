// Playground - noun: a place where people can play

import UIKit

class MyController: UITableViewController {
  let language = ["Ruby", "Python", "Swift", "Perl", "Objective-C", "C", "Java", "Processing"]
  let years = [1995, 1991, 2014, 1987, 1983, 1972, 1995, 2001]
  
  override func viewDidLoad() {
    super.viewDidLoad();
    self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return language.count;
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    var cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "detailCell")
    cell.textLabel!.text = language[indexPath.row]
    cell.detailTextLabel!.text = "\(years[indexPath.row])"
    return cell
  }
}

var controller = MyController()
controller.view
