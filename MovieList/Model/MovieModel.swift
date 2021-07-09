//
//  MovieModel.swift
//  MovieList
//
//  Created by dogukan gundogan on 5/14/21.
//

import Foundation
import UIKit
import Alamofire

class Movie:Codable{
    //var Poster:UIImage=UIImage(systemName: "star")!
    //alomofire hem o hem image
    //search de 2 sn bekleme
    //scroll altina bosluk
    var Poster:String?
    var Title:String?
    var Year:String?
    var imdbRating:String?
    var description:String? =
        """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis volutpat augue sit amet porta. Nulla molestie, diam eu interdum convallis, dolor lectus scelerisque turpis, sit amet porttitor odio ipsum et nibh. Curabitur massa orci, gravida nec sagittis eget, sollicitudin eu tellus. Praesent molestie enim in volutpat accumsan. Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi sit amet erat quis nulla tempor cursus. Nulla et lacus eros. Sed nec tempor turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce tincidunt, velit quis dapibus feugiat, lacus turpis volutpat nunc, vitae mollis ipsum odio sit amet orci. Nullam a magna elit.
        
            In accumsan ut nulla in ullamcorper. Nam arcu est, efficitur at volutpat vitae, gravida et tortor. Vestibulum mi nunc, sagittis vitae tempor sit amet, viverra id augue. Curabitur id enim finibus mauris laoreet dictum. Suspendisse interdum lacus id dolor faucibus molestie. Aenean quis accumsan sem. Fusce quis felis dapibus, vehicula ante in, maximus neque. Donec diam massa, lobortis sit amet iaculis at, elementum eu purus. Vivamus egestas lacus dui. Aliquam dapibus ligula nulla, at aliquet turpis pellentesque id. Vestibulum metus eros, dapibus a nisi ultricies, aliquet finibus est. Pellentesque scelerisque augue sed iaculis interdum. Donec consequat auctor aliquam.
        """
    var actorsArr:[Actor]?=[]
    var Actors:String?
    
    /*enum CodingKeys: String, CodingKey {
           case Title, Poster, Year, imdbRating, description,Actors
    }
    
    func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(description, forKey:.description )
            try container.encode(title, forKey: .Title)
            try container.encode(year, forKey: .Year)
            try container.encode(imdbRating, forKey: .imdbRating)
            try container.encode(description, forKey: .description)
            try container.encode(poster.pngData(), forKey: .Poster)
    }
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .Title)
        year = try values.decode(String.self, forKey: .Year)
        imdbRating = try values.decode(String.self, forKey: .imdbRating)
        let data = try values.decode(String.self, forKey: .Poster)
        var imageAsPoster:UIImage=UIImage(systemName: "star")!
        do {
            guard let url = URL(string:data) else { return }
            let data = try Data(contentsOf: url)
            if let image=UIImage(data: data){
                imageAsPoster = image
            }
        
        }
        catch{
            print(error)
        }
        poster=imageAsPoster
        let actorsWithComma=try values.decode(String.self,forKey:.Actors)
        for nameOfActor in actorsWithComma.components(separatedBy: ","){
            actors.append(Actor(name: nameOfActor, gender: "Male", country: "England", imageName: "star"))
        }
    }
    init(poster:UIImage,title:String,year:String,imdbRating:String,actors:[Actor]) {
        self.poster=poster
        self.title=title
        self.year=year
        self.imdbRating=imdbRating
        self.actors=actors
    }
    func addActor(actor:Actor){
        actors.append(actor)
    }
    
     */
    func getActor(actorName:String)->Actor?{
        for index in self.actorsArr!{
            if index.name==actorName {
                return index
            }
        }
        return nil
    }
} 
//
//class MovieDataSerializer: DataResponseSerializerProtocol{
//    func serialize(request: URLRequest?, response: HTTPURLResponse?, data: Data?, error: Error?) throws -> Movie {
//        return Movie()
//    }
//
//    typealias SerializedObject = Movie
//    enum MovieDataSerializerError: Error {
//            case InvalidData
//        }
//    var serializeResponse: (URLRequest?, HTTPURLResponse?, Data?, Error?) -> AFResult<[Movie]> {
//            return { request, response, data, error in
//
//                if let error = error {
//                    return .failure(error as! AFError)
//
//                }
//
//                guard let data = data else {
//                    return .failure(AFError.invalidURL(url:""))
//                }
//
//                do {
//                    let jsonDecoder = JSONDecoder()
//                    let posts = try jsonDecoder.decode([Movie].self, from: data)
//                    return .success(posts)
//                } catch {
//                    return .failure(AFError.invalidURL(url:""))
//                }
//            }
//        }
//}
 
