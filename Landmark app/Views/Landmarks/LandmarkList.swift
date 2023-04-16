//
//  LandmarkList.swift
//  Landmark app
//
//  Created by Grey  on 16.04.2023.
//

import SwiftUI
// IN THIS FOLDER WE ARE CREATING THE LIST OF LANDMARKS. AND WE ARE GOING TO MAKE IT DYNAMIC.

// Here we also gave the app the function of just showing the specific places the user added to their favourite by adding @State value. This is a set of values that can change over time and that can affect the views behaviour, content or layout.

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false //  @State is kind of like a helper that helps us keep track of changes to a value in our app, and update the app whenever that value changes.
    
    var filteredLandmarks: [Landmark]{
        modelData.landmarks.filter{
            landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    var body: some View {
        NavigationStack { // Using the List View in xcode makes our data to be rendered in a list style that's appropriate for IOS.
            List{
                Toggle(isOn: $showFavoritesOnly) {// We added a toggle to show the favourites of the landmark selected by the user. and this is how we implement it.
                    Text("Favorites only")
                }
                
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)// This creates one Landmark Row for each element in the landmarks array
                    }
                }
            }
            .navigationTitle("Landmarks")// We set the title of the navigation stack.
        }// We use the List the same way we use the Group I believe it is a Closure tho.
        
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList() // This makes the preview only show a single versionof the list.
    }
}
