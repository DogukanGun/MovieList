//
//  MovieDetailViewController.swift
//  MovieList
//
//  Created by dogukan gundogan on 5/20/21.
//

import UIKit

class MovieDetailViewController: UIViewController {
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image=movie?.image
        movieTitle.text=movie?.title
        desc.text=movie?.description 
        
    }
    var movie:Movie?=nil
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var desc: UILabel!
     
    

}


extension MovieDetailViewController:UIScrollViewDelegate{
    
}
