//
//  MovieDetailViewController.swift
//  MovieList
//
//  Created by dogukan gundogan on 5/20/21.
//

import UIKit
import Cosmos
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
        self.title="Movie"
        if let url = URL(string:movie?.Poster ?? ""){
            self.image.af.setImage(withURL: url)
        }
        movieTitle.text=movie?.Title
        desc.text=movie?.description
        let movieImdbRate=Double(movie!.imdbRating ?? "0")
        if let movieImdbRate = movieImdbRate{
            cosmosView.rating=movieImdbRate
        }else{
            cosmosView.rating=0
        }
        
        cosmosView.settings.fillMode = .precise
        cosmosView.didFinishTouchingCosmos={ rating in
            self.movie!.imdbRating=String(rating)
        }
        scrollView.automaticallyAdjustsScrollIndicatorInsets = false
        self.scrollView.contentInset = UIEdgeInsets(top: 0,left: 0,bottom: self.actorsButton.bounds.height*2,right: 0);
    }
     @IBOutlet weak var actorsButton: UIButton!
    @IBOutlet weak var cosmosView: CosmosView!
    var movie:Movie?
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        let vc=segue.destination as! ActorTableViewController
//        guard let movie = self.movie else {
//            return
//        }
//        vc.movie=movie
        
        let vc=segue.destination as! MovieTableViewController
        guard let movie = self.movie else {
            return
        }
        vc.movie=movie 
        vc.type=2
    }

}
 
