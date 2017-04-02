//
//  ColdplayCell.swift
//  YouRockApp
//
//  Created by Paul Defilippi on 3/26/17.
//  Copyright © 2017 Paul Defilippi. All rights reserved.
//

import UIKit

class ColdplayCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func updateUI(youRock: YouRock) {
        videoTitle.text = youRock.videoTitle
        
        let url = URL(string: youRock.imageURL)!
        
        DispatchQueue.main.async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image =
                    UIImage(data: data)
                }
            } catch {
                error as NSError
                print("PAUL:\(error)")
            }
        }
        
        
    }


}
