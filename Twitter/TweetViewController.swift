//
//  TweetViewController.swift
//  Twitter
//
//  Created by Alan Cao on 7/1/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet var tweetTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tweetTextView.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func handleCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleUploadTweet(_ sender: Any) {
        if !tweetTextView.text.isEmpty {
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("DEBUG: \(error.localizedDescription)")
                self.dismiss(animated: true, completion: nil)
            })
        }
        
    }
}
