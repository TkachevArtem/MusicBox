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
                case getTracks(searchTerm: String)
            }
        }
        struct Response {
            enum ResponseType {
                case presentTracks(searchResponse: SearchResponse?)
                case presentFooterView
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayTracks(searchViewModel: SearchViewModel)
                case displayFooterView
            }
        }
    }
}

struct SearchViewModel {
    struct Cell: TrackCellViewModel {
        var iconURLString: String?
        var artistName: String
        var trackName: String
        var collectionName: String
        var previewUrl: String? 
    }
    
    let cells: [Cell]
}
