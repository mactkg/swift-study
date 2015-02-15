import UIKit
import Foundation

var urlString = "http://www.apple.com"
var url = NSURL(string: urlString)!
var req = NSURLRequest(URL: url)

var data = NSURLConnection.sendSynchronousRequest(req, returningResponse: nil, error: nil)
var htmlString = NSString(data: data!, encoding: NSUTF8StringEncoding)!

// this line cause a bug
// var img = UIImage(data: data!)!