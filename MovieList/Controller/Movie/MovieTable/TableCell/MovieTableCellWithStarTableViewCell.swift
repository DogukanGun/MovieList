//
//  MovieTableCellWithStarTableViewCell.swift
//  MovieList
//
//  Created by dogukan gundogan on 5/22/21.
//

import UIKit
import Cosmos

class MovieTableCellWithStarTableViewCell: UITableViewCell {

    
    var movie:Movie?
    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib() 
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func refresh(movie:Movie){
        if let url = URL(string:movie.Poster ?? ""),let rating = movie.imdbRating{
            self.ImageView.af.setImage(withURL: url) 
            if let doubleRating=Double(rating){
                self.cosmosView.rating = doubleRating
            }
        }
        self.label.text=movie.Title
        self.movie=movie
    }

    
    
}
