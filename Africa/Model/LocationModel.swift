//
//  LocationModel.swift
//  Africa
//
//  Created by Mariana Steblii on 14/04/2021.
//

import Foundation
import MapKit

struct NationalParkLocation: Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    // computed property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
