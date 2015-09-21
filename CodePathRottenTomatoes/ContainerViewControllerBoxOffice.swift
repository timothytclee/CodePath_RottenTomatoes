//
//  ContainerViewControllerBoxOffice.swift
//  CodePathRottenTomatoes
//
//  Created by Timothy Lee on 9/20/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

class ContainerViewControllerBoxOffice: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // customize the navigation bar
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.Default
        nav?.tintColor = UIColor.blueColor()
        self.navigationItem.title = "Box Office"
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // set content source to BoxOffice URL
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let tabViewController = segue.destinationViewController as! ViewController
        tabViewController.sourceURL = "https://gist.githubusercontent.com/timothy1ee/d1778ca5b944ed974db0/raw/489d812c7ceeec0ac15ab77bf7c47849f2d1eb2b/gistfile1.json"
        
    }
    
    
}
