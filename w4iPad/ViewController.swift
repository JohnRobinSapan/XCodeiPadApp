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

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIDevice.current.userInterfaceIdiom == .pad {
        
        let urlAddress = URL(string: "https://www.google.ca")
        let url = URLRequest(url: urlAddress!)
        
        wbPage.load(url)
        wbPage.navigationDelegate = self
            
        } else {
            wbPage.isHidden = true
            activity.isHidden = true
        }
        
    }
    
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.isHidden = false
        activity.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.isHidden = true
        activity.stopAnimating()
    }
    
    @IBAction func saveData(sender : UIButton) {
        let alertbox = UIAlertController(title: "Warning", message: "Are you sure?", preferredStyle: .alert)
        
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (alert) in
            self.doUpdate()
            self.dismiss(animated: true, completion: nil)
        }
        alertbox.addAction(noAction)
        alertbox.addAction(yesAction)
        present(alertbox, animated: true)
    }
    
    func doUpdate() {
        let name = txName.text
        let email = txEmail.text
        
        let mydata = MyData()
        mydata.initWithData(name: name!, email: email!)
        
        lbName.text = mydata.name
        lbEmail.text = mydata.email
    }

}

