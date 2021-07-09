//
//  MovieTableViewCell.swift
//  MovieList
//
//  Created by dogukan gundogan on 5/14/21.
//

import UIKit
import AlamofireImage
import Alamofire
class MovieTableViewCell: UITableViewCell {
   
    var movie:Movie?
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
        self.movie=movie
        if let url = URL(string:movie.Poster ?? ""){
            self.ImageView.af.setImage(withURL: url)
        }
        
        self.label.text=movie.Title
        
    }

}
