//
//  Landmark.swift
//  Landmark app
//
//  Created by Grey  on 16.04.2023.
//

import Foundation
import SwiftUI
import CoreLocation


struct Landmark: Hashable, Codable, Identifiable {// Codable makes it easier to move data between the struture and a data file.
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
       enum Category: String, CaseIterable, Codable {
           case lakes = "Lakes"
           case rivers = "Rivers"
           case mountains = "Mountains"
       }
    
    private var imageName: String // we use "private" to make sure that only certain parts of our code can see and use a particular thing, like a button or a label. This helps keep our code organized and makes sure that everything works the way it's supposed to.  Just like how you might have a special toy that you only share with your best friend, in SwiftUI we use "private" to keep certain things special and just for our code to use.
        var image: Image {
        Image(imageName)
    }
    
    
    private var coordinates: Coordinates// Note that Coordinates is another type of data type that is used to represent Lat and Long
    var locationCoordinate: CLLocationCoordinate2D{// This is a coordinate property that's useful for interacting with the MapKit framework and we did this by importing the CoreLocation framework above.
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable{
        var latitude: Double
        var longitude: Double
    }
}
