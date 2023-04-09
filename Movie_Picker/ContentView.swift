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
    
    //creating a list of type Movie
    @State private var movieList = [Movie]()
    
    @State private var isShowingAlert = false
    
    var body: some View {
        VStack {
        

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
            
          
            //Picker for the ratings
            Picker("Rating", selection: $selectedRating)
            {
                ForEach(ratings, id: \.self){ rating in
                    Text(String(rating))
                }
            }
            

            
            //the submut button
            Button(action:{
                self.movieSentence = submitMovie()
                
                
                //create a new movie object
                var newMovie = Movie(name: self.selectedName, genre: self.selectedGenre, rating: self.selectedRating)
                
                //append movie object the movie list
                self.movieList.append(newMovie)
                
                //set isShowingAlert to true
                self.isShowingAlert = true
                
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
