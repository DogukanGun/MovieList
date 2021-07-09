//
//  SearchViewController.swift
//  MovieList
//
//  Created by dogukan gundogan on 5/27/21.
//

import UIKit

class SearchViewController: UIViewController,UISearchResultsUpdating, UISearchBarDelegate {
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController()
    let movieCellIdentifier="MovieTableViewCell"
    let movieCellIdentifierWithStar="MovieTableCellWithStarTableViewCell"
    let actorCellIdentifier="ActorTableViewCell"
    var movies:[Movie]=[]
    var timer:Timer?
    var type:Int=0
    var actors:[Actor]{
        var tempActors:[Actor]=[]
        for movie in movies{
            if let actorArr=movie.actorsArr{
                for actor in actorArr{
                    tempActors.append(actor)
                }
            }
        }
        return tempActors
    }
    var searchItem:Search?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: self.movieCellIdentifier, bundle: nil), forCellReuseIdentifier:self.movieCellIdentifierWithStar )
        tableView.register(UINib.init(nibName: self.actorCellIdentifier, bundle: nil), forCellReuseIdentifier:self.actorCellIdentifier )
        initSearchButton()
        tableView.delegate=self
        tableView.dataSource=self
        searchController.searchBar.delegate=self
        
        // Do any additional setup after loading the view.
    }
    func initSearchButton(){
        searchController.searchBar.enablesReturnKeyAutomatically=true
        searchController.obscuresBackgroundDuringPresentation=false
        searchController.searchBar.returnKeyType=UIReturnKeyType.done
        searchController.searchResultsUpdater=self
        searchController.searchBar.delegate=self
        definesPresentationContext=true
        searchController.searchBar.scopeButtonTitles=["All","Movie","Actor"]
        navigationItem.searchController=searchController
    }
    func search(string text:String,in type:String="All"){
        let service=Services.services
        let omdb=service.getApi(name: "Omdb")
        guard omdb != nil else {
            return
        }
        if type=="Movie" || type=="All"{
            omdb?.get(name:text){
                movie in
                self.movies.append(movie)
                self.tableView.reloadData()
            }
            guard let movies = omdb?.movies else {
                return
            }
            self.movies=movies
            self.type=0
        }
        
        if type=="Actor"{
            self.type=2
            self.tableView.reloadData()
        }
        if type=="All" {
            self.type=1
        }
        
        
    }
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        guard let text=searchController.searchBar.text else {
            return
        }
        if text != ""{
            let scopeButton=searchController.searchBar.scopeButtonTitles![searchController.searchBar.selectedScopeButtonIndex]
            self.search(string: text, in: scopeButton)
        }
    
    }
    func updateSearchResults(for searchController: UISearchController) {
        guard let text=searchController.searchBar.text else {
            return
        }
        if text != ""{
            print("Search")
            let scopeButton=searchController.searchBar.scopeButtonTitles![searchController.searchBar.selectedScopeButtonIndex]
            if let _ = timer {
                timer?.invalidate()
                timer=nil
            }
            self.searchItem=Search(text: text, searchButton: scopeButton)
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(fire), userInfo: nil, repeats: false)
        }else{
            timer?.invalidate()
            movies.removeAll()
            tableView.reloadData()
        }
    }
        
        
    
    @objc func fire()
    {
        print("Patladi")
        guard let searchItem = self.searchItem else {
            return
        }
        search(string:searchItem.text,in:searchItem.searchButton)
        
    }

}

extension SearchViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchController.isActive){
            if section==0 && type != 2{
                return movies.count
            }else{
                return self.actors.count
            } 
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section==1 || type==2{
            guard let tableViewCell=tableView.dequeueReusableCell(withIdentifier: self.actorCellIdentifier, for: indexPath) as? ActorTableViewCell else {
                return UITableViewCell()
            }
            let currentActor = self.actors[indexPath.row]
            tableViewCell.refresh(actor: currentActor)
            return tableViewCell
        }
        if indexPath.section==0 && type != 2{
            guard let tableViewCell=tableView.dequeueReusableCell(withIdentifier: self.movieCellIdentifier, for: indexPath) as? MovieTableViewCell else {
                return UITableViewCell()
            }
            print("Actor index \(indexPath.row)")
            let currentMovie = movies[indexPath.row]
            tableViewCell.refresh(movie: currentMovie)
            return tableViewCell
        }
        return UITableViewCell()
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section==1 {
            return "Actors"
        }else{
            return "Movies"
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if type==1 {
            return 2
        }
        return 1
    }
    
    
}

extension SearchViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="MovieDetailbySearch"{
            let vc=segue.destination as! MovieDetailViewController
            guard let cell = sender as? MovieTableViewCell else {
                return
            }
            guard let index = tableView.indexPath(for: cell) else {
                return
            }
            vc.movie=movies[index.row]
        }
    }
}
  
