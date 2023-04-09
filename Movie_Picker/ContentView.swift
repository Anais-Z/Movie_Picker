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
        NavigationView{
            VStack {
    
                //text field to input the name of the movie
                TextField("Enter Movie", text: $selectedName)
                    .multilineTextAlignment(.center)
                
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
                
                
                
                Group{
                    HStack{
                        
                        Text("Rating:")
                            .foregroundColor(.red)
                        
                        //Picker for the ratings
                        Picker("Rating", selection: $selectedRating)
                        {
                            ForEach(ratings, id: \.self){ rating in
                                Text(String(rating))
                            }
                        }
                    }
                }
                
                
                
                //the submut button
                Button(action:{
                    
                    //checks if the movie's name is an empty string
                    if(self.selectedName == ""){
                        
                        self.isShowingAlert = true
                        self.movieSentence = "Please enter the movie's name"
                    }else{
                        
                        self.movieSentence = submitMovie()
                        
                        
                        //create a new movie object
                        let newMovie = Movie(name: self.selectedName, genre: self.selectedGenre, rating: self.selectedRating)
                        
                        //append movie object the movie list
                        self.movieList.append(newMovie)
                        
                        //set isShowingAlert to true
                        self.isShowingAlert = true
                    }
                    
                    
                    
                }){
                    Text("Submit Now")
                        .foregroundColor(.white)
                        .padding()
                }
                .background(.black)
                .cornerRadius(10)
                .alert("\(self.movieSentence)", isPresented: $isShowingAlert) {
                    Button("OK", role: .cancel) { }
                }
                
               
                //navigate to Movie View
                    NavigationLink(destination: MovieView(movies: movieList)){
                        Text("See Movie List")
                            .foregroundColor(.blue)
                            .cornerRadius(10)
                    }
                
            }
            .padding()
        }
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
