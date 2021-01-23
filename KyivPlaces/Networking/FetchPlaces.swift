//
//  FetchPlaces.swift
//  KyivPlaces
//
//  Created by MacBook on 19.01.2021.
//

import Foundation


struct FetchPlaces{
    
  private let url = URL(string: "https://3lolo.github.io/lat_lng.json")
    //URL(string: "https://2fjd9l3x1l.api.quickmocker.com/kyiv/places")
    
    func fetchPlaces(completionHandler: @escaping ((Places)->Void)) {
        guard let url = url else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
             print(error)
            }
            if response != nil{
                print(response)
            }
           
            if let data = data{
                let decoder = JSONDecoder()
                let json = try? decoder.decode(Place.self, from: data)
                if let json = json {
                    json.places?.forEach({ (place) in
                        completionHandler(place)
                    })
                }
            }
            
        }
        dataTask.resume()
    }
    func showMessageMissingInternet(){
        
    }
}
