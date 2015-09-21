//
//  MoviesDetailsViewController.swift
//  CodePathRottenTomatoes
//
//  Created by Timothy Lee on 9/17/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

class MoviesDetailsViewController: UIViewController {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisTextView: UITextView!
    
    var movieDetails: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = movieDetails["title"] as? String
        synopsisTextView.text = movieDetails["synopsis"] as? String
        synopsisTextView.textColor = UIColor.whiteColor()

        let movieDetailsPosters = movieDetails["posters"] as! NSDictionary
        var url = movieDetailsPosters["original"] as! String!

        // load low res thumbnail version first
        posterImage.setImageWithURL(NSURL(string: url)!)
        
        let range = url.rangeOfString(".*cloudfront.net/", options: .RegularExpressionSearch)
        if let range = range {
            url = url.stringByReplacingCharactersInRange(range, withString: "https://content6.flixster.com/")
        }
        
        // load high res image
//        posterImage.setImageWithURL(NSURL(string: url)!)
        
        let request = NSURLRequest(URL: NSURL(string: url)!)
        posterImage.setImageWithURLRequest(request, placeholderImage: nil, success: { (request, response, image) -> Void in
                self.posterImage.image = image
                self.posterImage.alpha = 0
            UIView.animateWithDuration(0.8, animations: { () -> Void in
                self.posterImage.alpha = 1.0
            })

            }, failure: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
