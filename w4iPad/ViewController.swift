//
//  ViewController.swift
//  w4iPad
//
//  Created by John on 2020-01-28.
//  Copyright © 2020 John. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate {
    
    @IBOutlet var wbPage : WKWebView!
     @IBOutlet var activity : UIActivityIndicatorView!
    @IBOutlet var txName : UITextField!
    @IBOutlet var txEmail : UITextField!
    
    @IBOutlet var lbName : UILabel!
    @IBOutlet var lbEmail : UILabel!
    
    
    @IBAction func submit(sender : UIButton) {
        lbName.text = txName.text
        lbEmail.text = txEmail.text
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlAddress = URL(string: "https://www.google.ca")
        let url = URLRequest(url: urlAddress!)
        
        wbPage.load(url)
        wbPage.navigationDelegate = self
    }
    
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.isHidden = false
        activity.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.isHidden = true
        activity.stopAnimating()
    }


}

