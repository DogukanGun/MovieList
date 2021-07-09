//
//  MovieTableTableViewController.swift
//  MovieList
//
//  Created by dogukan gundogan on 5/14/21.
//

import UIKit
 
class MovieTableViewController: UIViewController {
     
    @IBOutlet weak var tableView: UITableView!
    let movieNames:[String]=["Avengers","Batman","Friends","Prestige","Egg"]
    var movies:[Movie]=[]{
        didSet{
            tableView.reloadData()
        }
    }
    var movie:Movie?=nil
    var id:Int?=nil
    
    //0 shows MovieCell
    //1 shows ActorCell
    var type:Int=0
    let movieCellIdentifier="MovieTableCellWithStarTableViewCell"
    let actorCellIdentifier="ActorTableViewCell"
//    let actorCellIdentifier="ActorTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: self.movieCellIdentifier, bundle: nil), forCellReuseIdentifier:self.movieCellIdentifier )
        tableView.register(UINib.init(nibName: self.actorCellIdentifier, bundle: nil), forCellReuseIdentifier:self.actorCellIdentifier )
        self.title="Movie List"
        tableView.delegate=self
        tableView.dataSource=self
        self.getData()
    } 
    func popUp(){
        let alert=UIAlertController.init(title: "New PopUp", message: "bu bir deneme", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Tamam", style: .cancel, handler: { (action) in
                
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func getData(){
        
        let service=Services.services
        var omdb=service.getApi(name: "Omdb")
        
        guard omdb != nil else {
            return
        } 
        for name in movieNames{
            omdb?.get(name:name){
                movie in
                self.movies.append(movie)
            }
        }
    }

    func fetchData(movies:[Movie]){
            self.movies=movies 
    }
} 

extension MovieTableViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(type==0){
            return movies.count
        }else{
            return movie?.actorsArr?.count ?? 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if type==0 { 
            guard let tableViewCell=tableView.dequeueReusableCell(withIdentifier:self.movieCellIdentifier, for: indexPath) as? MovieTableCellWithStarTableViewCell else {
                return UITableViewCell()
            }
            let currentMovie = movies[indexPath.row]
            print("At index \(indexPath.row) text is \(String(describing: currentMovie.Title))")
            tableViewCell.refresh(movie: currentMovie)
           return tableViewCell
        }else{
            guard let tableViewCell=tableView.dequeueReusableCell(withIdentifier: self.actorCellIdentifier, for: indexPath) as? ActorTableViewCell else {
                return UITableViewCell()
            }
            let currentActor = movie?.actorsArr?[indexPath.row]
            print("At index \(indexPath.row) text is \(String(describing: currentActor!.name))")
            guard let actor = currentActor else {
                return UITableViewCell()
            }
            tableViewCell.refresh(actor: actor)
            return tableViewCell
        }
        
    
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if type==0{
            let vc=UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
            let cell=tableView.cellForRow(at: indexPath) as! MovieTableCellWithStarTableViewCell
            vc.movie=cell.movie
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc=UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ActorInformationViewController") as! ActorInformationViewController
            vc.actor=movie?.actorsArr![indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    } 
}
 
