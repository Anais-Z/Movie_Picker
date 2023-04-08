//
//  ContentView.swift
//  Movie_Picker
//
//  Created by Anais Zulfequar on 2023-04-08.
//

import SwiftUI

struct ContentView: View {
    //represents the name of the movie
    @State private var selectedName : String = ""
    //represents the movie's genre
    @State private var selectedGenre : String = "Action"
    
    let genres = ["Action", "Horror", "Comedy", "Drama", "Romance"]
    
    //represents the user's rating of the movie
    @State private var selectedRating : Int = 1
    
    let ratings = [1,2,3,4,5]
    
    @State private var movieSentence : String = ""
    
    var body: some View {
        VStack {
            Text("Movie name is \(selectedName)")
                .foregroundColor(.blue)
            
            //text field to input the name of the movie
            TextField("Movie", text: $selectedName)
            
            //Picker for the genres, the values will be placed for selectedGenre
            Picker("Genre", selection: $selectedGenre)
            {
                //Goes through the genres list and displays them using text
                ForEach(genres, id: \.self)
                {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            
            Text("Selected genre is \(selectedGenre)")
                .foregroundColor(.red)
            
            Picker("Rating", selection: $selectedRating)
            {
                ForEach(ratings, id: \.self){ rating in
                    Text(String(rating))
                }
            }
            
            
            
            Text("Rating is \(self.selectedRating) stars")
            
            //the submut button
            Button(action:{
                self.movieSentence = submitMovie()
            }){
                Text("Submit now")
                    .foregroundColor(.yellow)
                    .padding()
            }
            .background(.cyan)
            .cornerRadius(10)
         
            Text("\(self.movieSentence)")
            
        }
        .padding()
    }
    
    func submitMovie() -> String {
        return "Movie is called \(self.selectedName), its genre is \(self.selectedGenre) and I give it \(self.selectedRating) stars"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
