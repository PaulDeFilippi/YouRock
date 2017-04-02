//
//  MainVC.swift
//  YouRockApp
//
//  Created by Paul Defilippi on 3/24/17.
//  Copyright © 2017 Paul Defilippi. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var rocks = [YouRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Hardcoded - Usually comes from an API or CSV file etc. - Part of creating a tableview correctly
        let y1 = YouRock(imageURL: "http://coldplay.com/wp-content/uploads/2015/11/AHFOD1000.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/vGZMvV9KBp8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "A Head Full of Dreams")
        
        let y2 = YouRock(imageURL: "https://i.ytimg.com/vi/z5pVHaLwy-U/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/xn_1hFdE-5g\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Everglow")
        
        let y3 = YouRock(imageURL: "http://www.josepvinaixa.com/blog/wp-content/uploads/2014/11/Coldplay-All-Your-Friends-2014-Promotional.png", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/E5a51OonZDE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "All Your Friends")
        
        let y4 = YouRock(imageURL: "https://i.ytimg.com/vi/p7gF_am03qU/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/J6ZWlDks0nQ\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Paradise")
        
        let y5 = YouRock(imageURL: "https://i.ytimg.com/vi/yoXLp4x8Sys/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/0-XXX3dnlVc\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Ghost Stories")
        
        rocks.append(y1)
        rocks.append(y2)
        rocks.append(y3)
        rocks.append(y4)
        rocks.append(y5)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ColdplayCell", for: indexPath) as? ColdplayCell {
            
            let rock = rocks[indexPath.row]
            
            cell.updateUI(youRock: rock)
            
            return cell
            
        } else {
            return UITableViewCell()
 
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let youRock = rocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: youRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            
            if let rock = sender as? YouRock {
                destination.youRock = rock
            }
            
        }
    }

}

