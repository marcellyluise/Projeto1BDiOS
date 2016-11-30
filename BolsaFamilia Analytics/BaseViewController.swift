
//
//  BaseViewController.swift
//  BolsaFamilia Analytics
//
//  Created by Marcelly Luise Souza Godinho on 29/11/16.
//  Copyright © 2016 UnB. All rights reserved.
//

import UIKit

open class BaseViewController: UIViewController {
    
    let activityIndicator = UIActivityIndicatorView.init(activityIndicatorStyle: .gray)
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.alpha = 1.0
        activityIndicator.hidesWhenStopped = true
    }

    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    open func startActivityIndicator() {
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
    }
    
    open func stopActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }

}
