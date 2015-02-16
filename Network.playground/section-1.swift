import UIKit
import Foundation
import XCPlayground

var urlString = "http://www.apple.com"
var url = NSURL(string: urlString)!
var req = NSURLRequest(URL: url)

var task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, res, error) -> Void in
  var string = NSString(data: data, encoding: NSUTF8StringEncoding)!
})

task.resume()

XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)

// this line cause a bug
// var img = UIImage(data: data!)!
