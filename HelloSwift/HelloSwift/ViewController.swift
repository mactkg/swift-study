//
//  ViewController.swift
//  HelloSwift
//
//  Created by Kenta Hara on 2/15/15.
//  Copyright (c) 2015 Kenta Hara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var textField: UITextField!
  
  @IBAction func sayHello(sender: AnyObject) {
    textField.text = "Hello"
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

