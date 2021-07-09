//
//  ActorTableTableViewCell.swift
//  MovieList
//
//  Created by dogukan gundogan on 5/22/21.
//

import UIKit

class ActorTableTableViewCell: UITableViewCell {

     
    var actor:Actor?
    @IBOutlet weak var actorImage: UIImageView!
    @IBOutlet weak var label: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func refresh(actor:Actor){
        self.actor=actor
        self.label.text=actor.name
        self.actorImage.image=UIImage(systemName: "star")
    }
}
