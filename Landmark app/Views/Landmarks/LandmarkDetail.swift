//
//  LandmarkDetail.swift
//  Landmark app
//
//  Created by Grey  on 16.04.2023.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {// This is the view that enables the user to scroll through the descriptive content.
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)// When you specify only the height parameter view automatically sizes to the width of its content. So therefore the MapView expands to fill the available space.
            
            CircleImage(image: landmark.image)
                .offset(y: -130)// This enabled us to be able to layer the image on top of the map
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {// Here we made the stack go from the center to the left or leading edges.Note that leading(Left) means the starting point of the view and trailing (Right) means the ending point of the view.
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavouriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()// This a view that expands to fill available space within its container view. Its main function is to create flexible space between other views in a layout..
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()// This is what creates the line dividing the Turtle Rock and the next text. used to separate other content.
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()//Padding is like putting a pillow around something so that it has more space and doesn't get too close to other things. It's like when you sit on a chair with a cushion on it, the cushion helps you feel comfortable and not too close to the edge of the chair. In the same way, padding in SwiftUI helps make things on the screen look nicer and easier to use by giving them more space.
            
            
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
