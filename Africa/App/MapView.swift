//
//  MapView.swift
//  Africa
//
//  Created by Mariana Steblii on 10/04/2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - PROPERTIES
    
    // we need to use @state because map uses binding to track any changes  such moving or zooming
    @State private var region: MKCoordinateRegion = {
        // coordinates of the map
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        // zoom level of the map
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        // actual map region with the combination of the coordinates of the map and zoom level
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: - BODY
    
    var body: some View {
        // MARK: - NO1 BASIC MAP
        // Map(coordinateRegion: $region)
        
        // MARK: - NO2 ADVANCED MAP
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            // (A) PIN: OLD STYLE (always static)
            // MapPin(coordinate: item.location, tint: .accentColor)
            
            // (B) MARKER: NEW STYLE (always static)
            // MapMarker(coordinate: item.location, tint: .accentColor)
            
            // (C) CUSTOM BASIC ANNOTATION (it could be interactive)
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            } //: ANNOTATION
            
            // (D) CUSTPM ADVANCED ANNOTATION (it could be interactive)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            } //: ANNOTATION
        }) //: MAP
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack{
                        Text("Latitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    } //: HSTACK
                    
                    Divider()
                    
                    HStack{
                        Text("Longitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    } //: HSTACK
                } //: VSTACK
            } //: HSTACK
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
            , alignment: .top
        )
    }
}

    // MARK: - PREVIEW

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
