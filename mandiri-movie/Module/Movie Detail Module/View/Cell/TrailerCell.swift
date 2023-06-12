//
//  TrailerCell.swift
//  mandiri-movie
//
//  Created by Isaac on 6/12/23.
//

import UIKit

class TrailerCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var trailerWebview: UIWebView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadYoutube(videoID: String) {
        guard
            let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")
        else { return }
        trailerWebview.loadRequest( URLRequest(url: youtubeURL) )
        }
}
