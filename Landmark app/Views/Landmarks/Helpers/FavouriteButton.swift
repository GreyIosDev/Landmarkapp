//
//  FavoriteButton.swift
//  Landmark app
//
//  Created by Grey  on 16.04.2023.
//


import SwiftUI

struct FavouriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
            Button {
                isSet.toggle()
            } label: {
                Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                    .labelStyle(.iconOnly)
                    .foregroundColor(isSet ? .yellow : .gray)
            }
        }
    }

struct FavouriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteButton(isSet: .constant(true))    }
}
