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
    
    let movieURL = "https://www.majorcineplex.com/apis/get_movie_avaiable"
    
    var moviesList = [Movie]()
    
    @IBOutlet weak var movieTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("first")
        loadJson()
        movieTable.delegate = self
        movieTable.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        
        let imagePath = "https://www.majorcineplex.com"+moviesList[indexPath.row].poster_ori
        let resource = ImageResource(downloadURL: URL(string: imagePath)!, cacheKey: imagePath)
        cell.movieImage.kf.setImage(with: resource)
        cell.movieTitle!.text = moviesList[indexPath.row].title_en
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "movieDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MovieDetailViewController {
            destination.movie = moviesList[(movieTable.indexPathForSelectedRow?.row)!]
        }
    }
    
    struct ResponseData: Decodable {
        var movies: [Movie]
    }
    
    func loadJson(){
        guard let url = URL(string: movieURL) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            guard let data = data else {return}
            
            do{
                let jsonData = try JSONDecoder().decode(ResponseData.self, from: data)
                print("loaded")
                self.moviesList = jsonData.movies
                print(self.moviesList.count)
                
                DispatchQueue.main.async {
                    self.movieTable.reloadData()
                }
                
            } catch {
                print("error")
            }
            
            
            }.resume()
    }
    
}

