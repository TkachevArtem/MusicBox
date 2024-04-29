//
//  SearchModels.swift
//  MusicBox
//
//  Created by Artem Tkachev on 22.04.24.
//

import UIKit

enum Search {
    
    enum Model {
        struct Request {
            enum RequestType {
                case some
                case getTracks(searchTerm: String)
            }
        }
        struct Response {
            enum ResponseType {
                case some
                case presentTracks(searchResponse: SearchResponse?)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case some
                case displayTracks(searchViewModel: SearchViewModel)
            }
        }
    }
}

struct SearchViewModel {
    struct Cell {
        var iconURLString: String?
        var artistName: String
        var trackName: String
        var collectionName: String?
        var previewUrl: String? 
    }
    
    let cells: [Cell]
}
