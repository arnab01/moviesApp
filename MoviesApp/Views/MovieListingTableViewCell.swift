//
//  movieListingTableViewCell.swift
//  MoviesApp
//
//  Created by Arnab Datta on 15/10/22.
//

import UIKit

class MovieListingTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleView: UILabel!
    @IBOutlet weak var subtitleView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateData(data: Result) {
        titleView.text = data.title
        subtitleView.text = data.overview
        URLSession.shared.dataTask(with: URLRequest(url: URL(string:"https://image.tmbd.org/t/p/w342/\(data.posterPath)")!)){(data, request, error) in
            
            do {
                var data = try data
                DispatchQueue.main.async {
                    self.movieImageView.image = UIImage(data: data!)
                }
            }catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}
