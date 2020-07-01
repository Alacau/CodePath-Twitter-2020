//
//  TweetCell.swift
//  Twitter
//
//  Created by Alan Cao on 6/24/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var tweetLabel: UILabel!
    @IBOutlet var favoriteButton: UIButton!
    @IBOutlet var retweetButton: UIButton!
    
    var isFavorited: Bool = false
    var tweetID: Int = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !isFavorited
        if toBeFavorited {
            TwitterAPICaller.client?.favoriteTweet(tweetID, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("DEBUG: \(error.localizedDescription)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetID, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("DEBUG: \(error.localizedDescription)")
            })
        }
    }
    
    @IBAction func retweetTweet(_ sender: Any) {
        
    }
    
    func setFavorite(_ favorited: Bool) {
        isFavorited = favorited
        if favorited {
            favoriteButton.setImage(UIImage(named: "favor-icon-red"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(named: "favor-icon"), for: .normal)
        }
    }
}
