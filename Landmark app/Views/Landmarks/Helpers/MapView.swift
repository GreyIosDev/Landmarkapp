//
//  MapView.swift
//  Landmark app
//
//  Created by Grey  on 16.04.2023.
//

import SwiftUI
import MapKit

struct MapView: View {// @State private is a special way of storing information inside a view. It's like having a secret box that only the view can access and use to keep track of some information.
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion(// A rectangular geographic region that centers around a specific latitude and longitude
            center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    var body: some View {
        Map(coordinateRegion: $region)// A view that displays an embedded map interface. We also use the $ sign to represent the  prefix to the state variable.
            .onAppear{// this triggers a calculation of the rgion based on the current coordinate.
                setRegion(coordinate)
            }
    }
    private func setRegion(_ coordinate:CLLocationCoordinate2D){// This a method that updates the region based on a coordinate value.
        region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868)
        )
    }
    
}
