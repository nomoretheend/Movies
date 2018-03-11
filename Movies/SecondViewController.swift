//
//  SecondViewController.swift
//  Movies
//
//  Created by never on 3/5/2561 BE.
//  Copyright © 2561 never. All rights reserved.
//

import UIKit
import Kingfisher
import CoreData

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var moviesList = [Movie]()
    
    @IBOutlet weak var favmovieTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("second")
        favmovieTable.delegate = self
        favmovieTable.dataSource = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        getLovedMovie()
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
            destination.movie = moviesList[(favmovieTable.indexPathForSelectedRow?.row)!]
        }
    }
    
    func getLovedMovie(){
        let fetchRequest: NSFetchRequest<FMovie> = FMovie.fetchRequest()
        
        do {
            let movies =  try PersistenceService.context.fetch(fetchRequest)
            
            moviesList.removeAll()
            
            for m in movies {
                moviesList.append(Movie(id: Int(m.id), title_en: m.title_en!, synopsis_en: m.synopsis_en!, poster_ori: m.poster_ori!))
            }
            
            DispatchQueue.main.async {
                self.favmovieTable.reloadData()
            }
            
        } catch {
        
        }
        
    }

}

