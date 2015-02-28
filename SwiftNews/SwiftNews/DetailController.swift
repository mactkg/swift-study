//
//  DetailController.swift
//  SwiftNews
//
//  Created by Kenta Hara on 2/15/15.
//  Copyright (c) 2015 Kenta Hara. All rights reserved.
//

import Foundation
import UIKit

class DetailController: UIViewController {
  
  @IBOutlet weak var webView: UIWebView!
  
  var entry = NSDictionary()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    var web = NSURL(string: self.entry["link"] as String)!
    var req = NSURLRequest(URL: web)
    webView.loadRequest(req);
  }
}