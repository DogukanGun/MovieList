//
//  MovieTableCellWithStarTableViewCell.swift
//  MovieList
//
//  Created by dogukan gundogan on 5/22/21.
//

import UIKit

class MovieTableCellWithStarTableViewCell: UITableViewCell {

    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib() 
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
