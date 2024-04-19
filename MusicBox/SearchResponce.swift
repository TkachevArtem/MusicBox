//
//  SearchResponce.swift
//  MusicBox
//
//  Created by Artem Tkachev on 19.04.24.
//

import Foundation

struct SearchResponce: Decodable {
    
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    var artistName: String
    var collectionName: String!
    var artworkUrl100: String!
}
