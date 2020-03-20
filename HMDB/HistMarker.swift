//
//  marker.swift
//  HMDB
//
//  Created by lindyhoppr on 3/9/20.
//  Copyright © 2020 rebecca kinnie. All rights reserved.
//

import Foundation
import MapKit



struct HistMarker: Codable {
    let markerId: Int
    let title: String
    //let subtitle: String
    //let additionalSubtitle: String
    let erectedBy: String
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    let cityTown: String
    let countyParish: String
    let stateProv: String
    let location: String
    let missing: String
    let link: String
    func locationCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)}
    
    
   private enum CodingKeys: String, CodingKey {
        case markerId = "MarkerID"
        case title = "Title"
        //case subtitle = "Subtitle"
        //case additionalSubtitle = "Add'l Subtitle"
        case erectedBy = "Erected By"
        case latitude = "Latitude (minus=S)"
        case longitude = "Longitude (minus=W)"
        case cityTown = "City or Town"
        case countyParish = "County or Parish"
        case stateProv = "State or Prov."
        case location = "Location"
        case missing = "Missing"
        case link = "Link"
    }
    
    

  //  let data = testing.json.data(using: .utf8)
    
    
    
  
    }
    
class HistoricalMarker: NSObject, MKAnnotation {
    let markerID: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(markerID: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.markerID = markerID
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
