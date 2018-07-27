//
//  ParseData.swift
//  Rampage
//
//  Created by lapstore on 7/27/18.
//  Copyright © 2018 AmrSobhy. All rights reserved.
//

import Foundation

class ParseData {
    static func parseEventsArray (array: [[String:Any]]) -> [MovieDataStruct] {
        var eventsArray: [MovieDataStruct] = [MovieDataStruct]()
        for each in array {
            var movieDataStruct: MovieDataStruct = MovieDataStruct()
            if let original_title = each["original_title"] as? String {
                movieDataStruct.original_title = original_title
            }
            if let backdrop_path = each["backdrop_path"] as? String {
                movieDataStruct.backdrop_path = backdrop_path
            }
            if let id = each["id"] as? Int {
                movieDataStruct.id = id
            }
            if let original_language = each["original_language"] as? String {
                movieDataStruct.original_language = original_language
            }
            if let overview = each["overview"] as? String {
                movieDataStruct.overview = overview
            }
            if let popularity = each["popularity"] as? Double {
                print("popularity")
                movieDataStruct.popularity = popularity
            }
            if let poster_path = each["poster_path"] as? String {
                movieDataStruct.poster_path = poster_path
            }
            if let release_date = each["release_date"] as? String {
                movieDataStruct.release_date = release_date
            }
            if let vote_average = each["vote_average"] as? Float {
                movieDataStruct.vote_average = vote_average
            }
            if let vote_count = each["vote_count"] as? Int {
                movieDataStruct.vote_count = vote_count
            }
           
            
            
            eventsArray.append(movieDataStruct)
        }
        return eventsArray
    }
    
}
