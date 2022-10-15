//
//  MovieDetailViewController.swift
//  MoviesApp
//
//  Created by Arnab Datta on 15/10/22.
//

import UIKit

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var RatingLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func setup(data: Result) {
        self.releaseDate.text = data.releaseDate
        self.RatingLabel.text = String(format: "%f", data.voteAverage)
        self.popularityLabel.text = String(format: "%f", data.popularity)
        self.overViewLabel.text = data.overview
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
