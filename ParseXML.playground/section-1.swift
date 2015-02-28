// Playground - noun: a place where people can play

import Foundation
import UIKit
import XCPlayground

//var urlString = "http://rss.dailynews.yahoo.co.jp/fc/rss.xml"
var urlString = "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://www.switch-science.com/catalog/list/1/rss&num=8"
var url = NSURL(string: urlString)!

var task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, res, err) -> Void in
  var dict = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary

  var responseData = dict["responseData"] as NSDictionary
  var feed = responseData["feed"] as NSDictionary
  var entries = feed["entries"] as NSArray
  
  for entry in entries {
    println(entry["title"] as String)
  }
})
task.resume()

XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)