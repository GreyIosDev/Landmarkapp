//
//  ModelData.swift
//  Landmark app
//
//  Created by Grey  on 16.04.2023.
//

import Foundation
import Combine

final class ModelData: ObservableObject{
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    @Published var profile = Profile.default
    
    var features: [Landmark] {
          landmarks.filter { $0.isFeatured }
      }
    var categories: [String: [Landmark]] {
           Dictionary(
               grouping: landmarks,
               by: { $0.category.rawValue }
           )
       }
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

// This is an EXPLANATION OF WHAT IS HAPPENING ABOVE.

//This code is written in a programming language called Swift, and it is used to load some information about landmarks from a file in the app. A landmark is a special place or monument that people like to visit and see.
//
//The first line of the code is creating a variable called "landmarks", which is an array (or list) of landmarks. The "load" function is then called to load the data about the landmarks from a file called "landmarkData.json".
//
//The "load" function takes a parameter called "filename", which is a string that tells the function which file to load the data from. The "<T: Decodable>" part of the code is telling Swift that the function can load any type of data that can be decoded, which means the data can be converted from a special format (in this case, JSON) into something that the app can understand.
//
//The next few lines of code are used to locate and open the file containing the landmark data. If the file can't be found, the app will crash and show an error message.
//
//If the file is found, the function will read the contents of the file and store it in a variable called "data". The function will then use a special decoder called "JSONDecoder" to convert the data from the JSON format into something that the app can use.
//
//Finally, the function will return the decoded data in the form of an array of landmarks, which will be stored in the "landmarks" variable.
//
//In summary, this code is used to load information about landmarks from a file and convert it into something that the app can use.

//So, this code is like a recipe that tells the app how to find and read some information about special places called landmarks.
//
//It starts by creating a list of landmarks, and then it uses a special function called "load" to get the information about the landmarks from a file. This function is like a helper who goes and gets the information for us.
//
//The "load" function looks for the file that has the information about the landmarks. If it finds the file, it reads the information from it and turns it into a form that the app can use. This is like reading a book and then telling someone else what the book says.
//
//Once the "load" function has turned the information into a form that the app can use, it sends it back to the main part of the code, and the app can use it to show people where the special landmarks are.
