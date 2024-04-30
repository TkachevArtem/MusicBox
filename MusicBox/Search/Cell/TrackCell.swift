//
//  TrackCell.swift
//  MusicBox
//
//  Created by Artem Tkachev on 29.04.24.
//

import Foundation
import UIKit

protocol TrackCellViewModel {
    var iconURLString: String? { get }
    var artistName: String { get }
    var trackName: String { get }
    var collectionName: String { get }
}

class TrackCell: UITableViewCell {
    
    static let reuseID = "TrackCell"
    
    @IBOutlet weak var trackImageView: UIImageView!
    
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(viewModel: TrackCellViewModel) {
        trackNameLabel.text = viewModel.trackName
        artistNameLabel.text = viewModel.artistName
        collectionNameLabel.text = viewModel.collectionName
    }
}
