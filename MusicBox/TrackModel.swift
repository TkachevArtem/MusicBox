//
//  TrackModel.swift
//  MusicBox
//
//  Created by Artem Tkachev on 4.04.24.
//

import Foundation

struct TrackModel {
    
    var trackName: String
    var artistName: String
    
    init(trackName: String, artistName: String) {
        self.trackName = trackName
        self.artistName = artistName
    }
}
