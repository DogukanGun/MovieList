//
//  OmdbApi.swift
//  MovieList
//
//  Created by dogukan gundogan on 5/20/21.
//

 
import Foundation
import UIKit
import Alamofire
class OmdbApi:Service { 
    var url: String
    var relatedController:MovieTableViewController?
    let key:String="cafa29b"
    var name: String 
    var movies:[Movie]=[]{
        didSet{
            self.relatedController!.fetchData(movies: self.movies)
        }
    }
    func delete(object: Movie) {
        
    }
    
    func get(name: String,completion:@escaping ((Movie)->Void)){
        let request=self.url+self.key+"&t="+name 
        self.search(url: request){
            movie in
            completion(movie)
        }
       
    }
    private func search(url:String,completion:@escaping ((Movie)->Void)){
        guard let url = URL(string: url) else{
            return 
        } 
            AF.request(url)
                .response {
                    response in
                    do{
                        if let data = response.data{
                            let json=try JSONDecoder().decode(Movie.self, from: data)
                            if json.Title != nil{
                                json.description=Movie().description
                                if let actors = json.Actors {
                                    for nameOfActor in actors.components(separatedBy: ","){
                                        if json.actorsArr == nil  {
                                            json.actorsArr=[]
                                        }
                                        json.actorsArr?.append(Actor(name: nameOfActor, gender: "Male", country: "England", imageName: "star"))
                                     }
                                }
                                completion(json)
                                 
                            }
                        }
                    }catch{
                        print("JSON error: \(error)")
                        
                    }
                }
             
    }
    func get(id:Int,completion:@escaping ((Movie)->Void)){
        let request=self.url+self.key+"&i="+String(id)
        self.search(url: request){
            movie in
            completion(movie)
        }
    }
    func post(object: Movie) {
         
    }
    
    func register() {
         
    }
    init(url:String,name:String) {
        self.url=url
        self.name=name
    }
    
}

 
