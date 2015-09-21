//
//  ContainerViewController.swift
//  CodePathRottenTomatoes
//
//  Created by Timothy Lee on 9/20/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

class ContainerViewControllerDVD: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // customize the navigation bar
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.Black
        nav?.tintColor = UIColor.yellowColor()
        self.navigationItem.title = "Top DVDs"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // set content source to BoxOffice URL
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let tabViewController = segue.destinationViewController as! ViewController
        tabViewController.sourceURL = "https://gist.githubusercontent.com/timothy1ee/e41513a57049e21bc6cf/raw/b490e79be2d21818f28614ec933d5d8f467f0a66/gistfile1.json"
        
    }
    

}
