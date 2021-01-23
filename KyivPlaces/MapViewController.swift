//
//  MapViewController.swift
//  KyivPlaces
//
//  Created by MacBook on 20.01.2021.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var tableView: UITableView!
    
    let fetchPlaces = FetchPlaces()
    var placesArray: [Places] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchPlaces.fetchPlaces { (place) in
            
            self.placesArray.append(place)
            
            DispatchQueue.main.async {
                self.makeMarkers()
                self.tableView.reloadData()
            }
        }
        let camera = GMSCameraPosition(latitude: 50.458999, longitude: 30.491454, zoom: 12.0)
        mapView.camera = camera
       

    }
    
    
    func makeMarkers(){
       
        placesArray.forEach { (place) in
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)
            marker.title = place.name
            marker.map = mapView
           
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        
        cell.textLabel?.text = " \(indexPath.row + 1)  \(placesArray[indexPath.row].name)"
        
        return cell
        
    }
}
