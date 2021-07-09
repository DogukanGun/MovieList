//
//  ActorTableViewCell.swift
//  MovieList
//
//  Created by dogukan gundogan on 6/13/21.
//

import UIKit

class ActorTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var actor:Actor?
    @IBOutlet weak var actorName: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
     
        func refresh(actor:Actor){
            self.actor=actor
            self.actorName.text=actor.name
        }
    
}
