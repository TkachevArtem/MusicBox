//
//  SearchViewController.swift
//  MusicBox
//
//  Created by Artem Tkachev on 3.04.24.
//

import UIKit
import Alamofire

class SearchViewController: UITableViewController {
    
    var tracksArray = [TrackModel(trackName: "1", artistName: "A"), TrackModel(trackName: "2", artistName: "B"), TrackModel(trackName: "3", artistName: "C")]
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemOrange
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = searchController
//        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
}

extension SearchViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracksArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        let track = tracksArray[indexPath.row]
        cell.textLabel?.numberOfLines = 2
        cell.textLabel?.text = "\(track.trackName)\n\(track.artistName)"
        cell.imageView?.image = UIImage(systemName: "music.note")
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let url = "https://itunes.apple.com/search?term=\(searchText)"
        
        AF.request(url).response { (dataResponse) in
            
            if let error = dataResponse.error {
                print("Data response error: \(error.localizedDescription)")
                return
            }
            
            guard let data = dataResponse.data else { return }
            let dataString = String(data: data, encoding: .utf8)
            print(dataString)
        }
        
    }
}
