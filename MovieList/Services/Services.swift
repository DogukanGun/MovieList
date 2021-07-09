//
//  Services.swift
//  MovieList
//
//  Created by dogukan gundogan on 5/20/21.
//

import Foundation
import UIKit
protocol Service { 
    var name:String {get set} 
    var url:String {get set}
    var relatedController:MovieTableViewController? {get set}
    var movies:[Movie] {get set}
    func register() 
    func delete(object:Movie)
    func get(name:String,completion:@escaping ((Movie)->Void))
    func get(id:Int,completion:@escaping ((Movie)->Void))
    func post(object:Movie)
}


class Services{
    static let services=Services()
    private init(){}
    var apiList:[Service]=[]
    func apiServiceAdd(api:Service)
    {
        apiList.append(api)
    }
    func getApi(name:String)->Service?
    {
        for i in apiList{
            if(i.name==name){
                return i
            }
        }
        return nil
    }
}
