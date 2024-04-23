//
//  SearchInteractor.swift
//  MusicBox
//
//  Created by Artem Tkachev on 22.04.24.
//

import UIKit

protocol SearchBusinessLogic {
    func makeRequest(request: Search.Model.Request.RequestType)
}

class SearchInteractor: SearchBusinessLogic {
    
    var presenter: SearchPresentationLogic?
    var service: SearchService?
    
    func makeRequest(request: Search.Model.Request.RequestType) {
        if service == nil {
            service = SearchService()
        }
        
        switch request {
        case .some:
            print("interactor .some")
        case .getTracks:
            print("interactor .getTracks")
            presenter?.presentData(response: Search.Model.Response.ResponseType.presentTracks)
        }
    }
    
}
