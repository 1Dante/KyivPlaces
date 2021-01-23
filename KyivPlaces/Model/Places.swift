//
//  Places.swift
//  KyivPlaces
//
//  Created by MacBook on 19.01.2021.
//

import Foundation

struct Place: Decodable{
    
    var places: [Places]?
    
    private enum CodingKeys: String, CodingKey{
        case places
    }
    init(from decoder: Decoder) throws {
       
        let conteiner = try decoder.container(keyedBy: CodingKeys.self)
        self.places = try conteiner.decode([Places].self, forKey: .places)
    }
    
}

struct Places: Decodable{
    
    var id: Int
    var name: String
    var latitude: Double
    var longitude: Double
    
    private enum CodingKeys: String, CodingKey{
        
        case id = "id"
        case name = "name"
        case latitude = "lat"
        case longitude = "lng"
    }
    init(from decoder: Decoder) throws {
        
        let conteiner = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try conteiner.decode(Int.self, forKey: .id)
        self.name = try conteiner.decode(String.self, forKey: .name)
        self.latitude = try conteiner.decode(Double.self, forKey: .latitude)
        self.longitude = try conteiner.decode(Double.self, forKey: .longitude)
    }
    
}
