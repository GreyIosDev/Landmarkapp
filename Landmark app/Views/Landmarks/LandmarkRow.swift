//
//  LandmarkRow.swift
//  Landmark app
//
//  Created by Grey  on 16.04.2023.
//

import SwiftUI
// HERE WE CREATED THE ROW VIEW

struct LandmarkRow: View {
    var landmark: Landmark//Here we made the landmark from the Landmark struct folder a property of this LandmarkRow.
    //Note:When you want your code to inherit from a another file this is how you initialise it.
    // you declare the structs you want your present file to get info from before the body of the view.
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(landmark.name)
            Spacer()
            
            if landmark.isFavorite{// Here we are simply adding a functionality to the row to give the user the ability to be able to Favourite the best landmark by adding a star sign to it.
                // Also note that in SwiftUI you use if statements to conditionally include views.
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        
        
    }
}
// LATER ON WE WENT AHEAD AND CUSTOMIZE THE ROW VIEW

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View {
        LandmarkRow(landmark: landmarks[1])
            .previewLayout(.fixed(width: 300, height: 70))// This is a modifier of the preview used to set a size that approximates a row in a list.
        Group { // Group is a container that is used for grouping view content. Xcode renders contents of the Group (Child) as separate previews in the canvas.
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
// Note: The code that you write in a preview provider only changes what Xcode displays in the Canvas.
