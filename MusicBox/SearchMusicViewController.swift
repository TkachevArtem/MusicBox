//
//  SearchViewController.swift
//  MusicBox
//
//  Created by Artem Tkachev on 3.04.24.
//

import UIKit
import Alamofire

class SearchMusicViewController: UITableViewController {
    
    let networkService = NetworkService()
    private var timer: Timer?
    
    var tracksArray = [Track]()
    
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

extension SearchMusicViewController {
    
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

extension SearchMusicViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.networkService.fetchData(searchText: searchText) { [weak self] (searchResults) in
                self?.tracksArray = searchResults?.results ?? []
                self?.tableView.reloadData()
            }
        })
    }
}
