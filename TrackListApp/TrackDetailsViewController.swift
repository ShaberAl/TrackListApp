//
//  TrackDetailsViewController.swift
//  TrackListApp
//
//  Created by MacOS on 14.04.2022.
//

import UIKit

class TrackDetailsViewController: UIViewController {
    @IBOutlet weak var imageCover: UIImageView!
    @IBOutlet weak var trackTitleLabel: UILabel!
    
    var track: Track!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCover.image = UIImage(named: track.title)
        trackTitleLabel.text = track.title
    }
}
