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
        Text("Movie View ")
        
        //Looping through the movie list
        List(movies, id:\.id){ movie in
            VStack{
                Text("Movie : \(movie.name)")
                Text("Genre : \(movie.genre)")
                Text("Rating : \(movie.rating) stars")
            }
            
        }
        
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
