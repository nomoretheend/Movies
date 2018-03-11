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
        movieDes.text = movie?.synopsis_en
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onClickLoveMovie(_ sender: UIButton) {
        let fmovie = FMovie(context: PersistenceService.context)
        fmovie.id = Int64(movie!.id)
        fmovie.title_en = movie?.title_en
        fmovie.synopsis_en = movie?.synopsis_en
        fmovie.poster_ori = movie?.poster_ori
        PersistenceService.saveContext()
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
