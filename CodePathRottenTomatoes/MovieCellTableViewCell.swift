//
//  MovieCellTableViewCell.swift
//  CodePathRottenTomatoes
//
//  Created by Timothy Lee on 9/17/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

class MovieCellTableViewCell: UITableViewCell {

    @IBOutlet weak var movieListView: UIView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var moviePosterImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
