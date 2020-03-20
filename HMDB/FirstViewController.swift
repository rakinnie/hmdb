//
//  FirstViewController.swift
//  HMDB
//
//  Created by lindyhoppr on 3/9/20.
//  Copyright © 2020 rebecca kinnie. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController {

    @IBOutlet weak var bigMap: MKMapView!
    
    let initialLocation = CLLocation(latitude: 37.25456, longitude: -122.38333)
    
    let regionRadius: CLLocationDistance = 1000

        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerMapOnLocation(location: initialLocation)
           
            guard let fileName = Bundle.main.path(forResource: "testing", ofType: "json"),
                let data =  try? Data(contentsOf: URL(fileURLWithPath: fileName))
                else {
                    return
            }
        var markerPins: [HistMarker] = []
            do {
        
                markerPins = try JSONDecoder().decode([HistMarker].self, from: data)
            } catch let error {
                print(error)
            }
       
        for marker in markerPins{
            let annotation = MKPointAnnotation()
            annotation.coordinate = marker.locationCoordinate()
            annotation.title = marker.title
            annotation.subtitle = String(marker.markerId)
            bigMap.addAnnotation(annotation)
            
        }
    }
    
    func centerMapOnLocation(location: CLLocation) {
        
        let regionRadius: CLLocationDistance = 1000
        
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        bigMap.setRegion(coordinateRegion, animated: true)
}
}

