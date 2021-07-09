//
//  ActorModel.swift
//  MovieList
//
//  Created by dogukan gundogan on 5/22/21.
//

import Foundation
import UIKit

class Actor:Codable{
    var image:UIImage
    var name:String
    var gender:String
    var country:String
    
    enum CodingKeys: String, CodingKey {
           case name, image, gender, country
    }

    func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)

            try container.encode(name, forKey: .name)
            try container.encode(gender, forKey: .gender)
            try container.encode(country, forKey: .country) 
            try container.encode(image.pngData(), forKey: .image)
        }
    required init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)

            name = try values.decode(String.self, forKey: .name)
            gender = try values.decode(String.self, forKey: .gender)
            country = try values.decode(String.self, forKey: .country)

            let data = try values.decode(Data.self, forKey: .image)
            guard let image = UIImage(data: data) else {
                throw DecodingError.dataCorruptedError(forKey: .image, in: values, debugDescription: "Invalid image data")
            }
            self.image = image
    }
    init(name:String,gender:String,country:String,imageName:String) {
        self.name=name
        self.gender=gender
        self.country=country
        if let imageOfActor=UIImage(named: imageName){
            self.image=imageOfActor
        }else{
            self.image=UIImage(systemName: "star")!
        }
        
    }
}
