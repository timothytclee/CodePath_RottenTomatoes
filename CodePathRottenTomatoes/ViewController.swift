//
//  ViewController.swift
//  CodePathRottenTomatoes
//
//  Created by Timothy Lee on 9/15/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit
import AFNetworking
import MBProgressHUD

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var networkingErrorView: UIView!
    @IBOutlet weak var moviesTableView: UITableView!
    
    var refreshControl: UIRefreshControl!
    var movies: [NSDictionary]?
    var sourceURL: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // add pull to refresh control
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "onRefresh", forControlEvents: UIControlEvents.ValueChanged)
        moviesTableView.insertSubview(refreshControl, atIndex: 0)
        
        // set up networking error message as hidden
        networkingErrorView.hidden = true
        
        // show loading state
        showLoadingHUD()
        
        // set default source url to BoxOffice
        var url = NSURL(string: "https://gist.githubusercontent.com/timothy1ee/d1778ca5b944ed974db0/raw/489d812c7ceeec0ac15ab77bf7c47849f2d1eb2b/gistfile1.json")!
        
        // update source url with DVD or BoxOffice
        if (sourceURL != nil) {
            url = NSURL(string: sourceURL!)!
        }
        
        // fetch data
        let request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            if let d = data {
                let json = try! NSJSONSerialization.JSONObjectWithData(d, options: []) as? NSDictionary
                print(json)
                if let json = json {
                    self.movies = json["movies"] as? [NSDictionary]
                    self.moviesTableView.reloadData()
                    // remove loading HUD once complete
                    self.hideLoadingHUD()
                }
            } else {
                if let e = error {
                    NSLog("Error: \(e)")
                    // if network error, display networking error view
                    self.networkingErrorView.hidden = false
                }
            }
        }
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let movies = movies {
            return movies.count
        } else {
                return 0
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // unhighlight row after selection
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MovieListPrototypeCell") as! MovieCellTableViewCell
        let movie = movies![indexPath.row]
        let moviePosters = movie["posters"] as! NSDictionary
        cell.movieTitleLabel.text  = movie["title"] as? String
        cell.movieDescriptionLabel.text = movie["synopsis"] as? String
        cell.moviePosterImage.setImageWithURL(NSURL(string: moviePosters["thumbnail"] as! String)!)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as! MoviesDetailsViewController
        let selectedCell = sender as! UITableViewCell
        let indexPath = moviesTableView.indexPathForCell(selectedCell)!
        vc.movieDetails = movies![indexPath.row]
        
    }
    
    
    // functions for showing and hiding HUD
    
    func showLoadingHUD() {
        let hud = MBProgressHUD.showHUDAddedTo(self.moviesTableView, animated: true)
        hud.labelText = "Loading..."
    }
    
    func hideLoadingHUD() {
        MBProgressHUD.hideAllHUDsForView(self.moviesTableView, animated: true)
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func onRefresh() {
        delay(2, closure: {
            self.refreshControl.endRefreshing()
        })
    }
    
}
