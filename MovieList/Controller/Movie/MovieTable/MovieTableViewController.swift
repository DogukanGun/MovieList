//
//  MovieTableTableViewController.swift
//  MovieList
//
//  Created by dogukan gundogan on 5/14/21.
//

import UIKit

class MovieTableViewController: UIViewController {
     
    @IBOutlet weak var tableView: UITableView!
     
    var movies:[Movie]=[]
    var movie:Movie?=nil
    var id:Int?=nil
    //0 shows MovieCell
    //1 shows ActorCell
    var type:Int=0
    let movieCellIdentifier="MovieTableViewCell"
    let actorCellIdentifier="ActorTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Movie List"
        tableView.delegate=self
        tableView.dataSource=self 
        self.getData()
    }

    func getData(){
        
        
        let movieNames:[String]=["Avengers", "Batman","Inception","Spiral","StartUp","Puppetmaster","Mahjong","Ear","Lilies"]
        //let numberOfMovieLength=movieNames.count
        let lorem =
        """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis volutpat augue sit amet porta. Nulla molestie, diam eu interdum convallis, dolor lectus scelerisque turpis, sit amet porttitor odio ipsum et nibh. Curabitur massa orci, gravida nec sagittis eget, sollicitudin eu tellus. Praesent molestie enim in volutpat accumsan. Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi sit amet erat quis nulla tempor cursus. Nulla et lacus eros. Sed nec tempor turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce tincidunt, velit quis dapibus feugiat, lacus turpis volutpat nunc, vitae mollis ipsum odio sit amet orci. Nullam a magna elit.
        
            In accumsan ut nulla in ullamcorper. Nam arcu est, efficitur at volutpat vitae, gravida et tortor. Vestibulum mi nunc, sagittis vitae tempor sit amet, viverra id augue. Curabitur id enim finibus mauris laoreet dictum. Suspendisse interdum lacus id dolor faucibus molestie. Aenean quis accumsan sem. Fusce quis felis dapibus, vehicula ante in, maximus neque. Donec diam massa, lobortis sit amet iaculis at, elementum eu purus. Vivamus egestas lacus dui. Aliquam dapibus ligula nulla, at aliquet turpis pellentesque id. Vestibulum metus eros, dapibus a nisi ultricies, aliquet finibus est. Pellentesque scelerisque augue sed iaculis interdum. Donec consequat auctor aliquam.
        """
        let service=Services.services
        let omdb=service.getApi(name: "Omdb")
        guard omdb != nil else {
            return
        }
        for name in movieNames{
            let movie=omdb?.get(name:name)
            if let movie=movie{
                movie.description=lorem 
                movies.append(movie)
            }else{
                print("Not Found")
            }
        }
        
        /*for _ in 0...numberOfMovieLength{
            let indexNumber:Int=Int.random(in: 0..<movieNames.count)
            
            if let movieImage = UIImage(named: movieNames[indexNumber]){
                let movie=Movie(image:movieImage, title: movieNames[indexNumber],description: lorem)
                for i in actorNames{
                    let actor=Actor(name:i,gender:gender[Int.random(in:0..<gender.count)],country:countries[Int.random(in:0..<countries.count)],imageName:i)
                    movie.addActor(actor: actor)
                }
                movies.append(movie)
            }
            
        }*/
        
        /*let service=Services.services
        guard let omdbApi=service.getApi(name: "OmdbApi") else{
            return
        }
        for i in movieNames{
            print(omdbApi.get(name: i))
        }
         */
    }

   
}
//codabel
//sticky button
//listeleri tek ekran yap
//cocoa pods cosmos

extension MovieTableViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(type==0){
            return movies.count
        }else{
            return movie?.actors.count ?? 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if type==0 {
            guard let tableViewCell=tableView.dequeueReusableCell(withIdentifier: self.movieCellIdentifier, for: indexPath) as? MovieTableViewCell else {
                return UITableViewCell()
            }
        
            let currentMovie = movies[indexPath.row]
            print("At index \(indexPath.row) text is \(currentMovie.title)")
            tableViewCell.refresh(movie: currentMovie,id: indexPath.row)
            return tableViewCell
        }else{
            guard let tableViewCell=tableView.dequeueReusableCell(withIdentifier: self.actorCellIdentifier, for: indexPath) as? ActorTableTableViewCell else {
                return UITableViewCell()
            }
            let currentActor = movie?.actors[indexPath.row]
            print("At index \(indexPath.row) text is \(String(describing: currentActor!.name))")
            tableViewCell.refresh(actorName:currentActor!.name,image:currentActor!.image)
            return tableViewCell
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="ActorInformation" {
            let vc=segue.destination as! ActorInformationViewController
            guard let cell = sender as? ActorTableTableViewCell else {
                return
            }
            vc.actor=movie?.getActor(actorName: cell.label.text!)
        }else if segue.identifier=="MovieDetailView"{
            let vc=segue.destination as! ActorInformationViewController
            guard let cell = sender as? ActorTableTableViewCell else {
                return
            }
            vc.actor=movie?.getActor(actorName: cell.label.text!)
        }else if segue.identifier=="MovieTable"{
            let vc=segue.destination as! MovieDetailViewController
            guard let cell = sender as? MovieTableViewCell else {
                return
            }
            vc.movie=movies[cell.id!]
        }
        
        
    }
}
