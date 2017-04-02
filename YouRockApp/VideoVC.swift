//
//  VideoVC.swift
//  YouRockApp
//
//  Created by Paul Defilippi on 3/24/17.
//  Copyright © 2017 Paul Defilippi. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    private var _youRock: YouRock!
    
    var youRock: YouRock {
        get {
            return _youRock
        } set {
            _youRock = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLbl.text = youRock.videoTitle
        webView.loadHTMLString(youRock.videoURL, baseURL: nil)
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    

}
