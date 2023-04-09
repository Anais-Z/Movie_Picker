//
//  MovieView.swift
//  Movie_Picker
//
//  Created by Anais Zulfequar on 2023-04-08.
//

import SwiftUI

struct MovieView: View {
    var movies = [Movie]()
    
    var body: some View {
        Text("Movie List ")
        
        //Iterate through the movie list
        List(movies, id:\.id){ movie in
            VStack(alignment: .leading){
                Text("Movie : \(movie.name)")
                    .foregroundColor(.blue)
  
                Text("Genre : \(movie.genre)")
                    .foregroundColor(.red)

                Text("Rating : \(movie.rating) stars")
                    .foregroundColor(.yellow)
            }
            
        }
        
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
