//
//  MovieTableViewCell.swift
//  MovieList
//
//  Created by dogukan gundogan on 5/14/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
   
    var id:Int?=nil
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
    
    func refresh(movie:Movie,id:Int){
        self.ImageView.image=movie.poster
        self.label.text=movie.title
        self.id=id
    }

}
