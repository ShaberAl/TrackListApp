//
//  TrackListViewController.swift
//  TrackListApp
//
//  Created by MacOS on 14.04.2022.
//

import UIKit

class TrackListViewController: UITableViewController {
    private var trackList = Track.getTrakList()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 80
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trackList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackName", for: indexPath)
        
        let track = trackList[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = track.song
        content.secondaryText = track.artist
        content.image = UIImage(named: track.title)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        
        cell.contentConfiguration = content
        
        return cell
    }
    
//    // MARK: Table view delegate
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        80
//    }
    
    // MARK: - Navigation segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let trackDetailsVC = segue.destination as? TrackDetailsViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let track = trackList[indexPath.row]
        trackDetailsVC.track = track
    }
}
