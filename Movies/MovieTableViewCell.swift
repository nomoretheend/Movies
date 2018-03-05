//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by never on 3/5/2561 BE.
//  Copyright © 2561 never. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
