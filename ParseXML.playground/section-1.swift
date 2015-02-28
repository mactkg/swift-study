// Playground - noun: a place where people can play

import Cocoa
import Foundation

class MyParserDelegate: NSObject, NSXMLParserDelegate {
  var isTitle = false
  
  func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]!) {
    if(elementName == "title") {
      isTitle = true;
    }
  }
  
  func parser(parser: NSXMLParser!, foundCharacters string: String!) {
    if(isTitle) {
      print(string)
    }
  }
  
  func parser(parser: NSXMLParser!, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!) {
    if(elementName == "title") {
      isTitle = false;
      println()
    }
  }
}

//var urlString = "http://rss.dailynews.yahoo.co.jp/fc/rss.xml"
var urlString = "http://www.switch-science.com/catalog/list/1/rss"
var url = NSURL(string: urlString)

var parser = NSXMLParser(contentsOfURL: url)!
var delegate = MyParserDelegate()
parser.delegate = delegate

parser.parse();

