//
//  Movie.swift
//  Movie_Picker
//
//  Created by Anais Zulfequar on 2023-04-08.
//

import Foundation

//creating a struct
struct Movie: Identifiable, Hashable{
    var id = UUID()
    var name : String = ""
    var genre : String = ""
    var rating : Int = 0
    
    init(){
        //default constructor
    }
    
    init(name: String, genre: String, rating : Int){
        self.name = name
        self.genre = genre
        self.rating = rating
    }
}
