//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by never on 3/10/2561 BE.
//  Copyright © 2561 never. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {

    
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieDes: UITextView!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let imagePath = "https://www.majorcineplex.com"+(movie?.poster_ori)!
        let resource = ImageResource(downloadURL: URL(string: imagePath)!, cacheKey: imagePath)
        movieImage.kf.setImage(with: resource)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
