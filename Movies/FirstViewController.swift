//
//  FirstViewController.swift
//  Movies
//
//  Created by never on 3/5/2561 BE.
//  Copyright © 2561 never. All rights reserved.
//

import UIKit
import Kingfisher

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var catImage = "https://images.unsplash.com/photo-1496857239036-1fb137683000?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&s=6adcf066111fa0ee8d5f0b906580bf00"
    
    @IBOutlet weak var movieTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        
        let resource = ImageResource(downloadURL: URL(string: catImage)!, cacheKey: catImage)
        cell.movieImage.kf.setImage(with: resource)
        //cell.movieImage.image = UIImage(named: "cat")
        cell.movieTitle!.text = "randommm"
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("first")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

