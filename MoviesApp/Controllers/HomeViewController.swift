//
//  ViewController.swift
//  MoviesApp
//
//  Created by Arnab Datta on 15/10/22.
//

import UIKit

class HomeViewController: UIViewController {
    var dataListing: [Result] = []
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "Popular Movies"
        setupTableView()
        self.fetchdata()
        // Do any additional setup after loading the view.
    }
    
    func setupTableView() {
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        tableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
    }
    
    func fetchdata() {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=38a73d59546aa378980a88b645f487fc&language=en-US&page=1")
        var request : URLRequest = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=38a73d59546aa378980a88b645f487fc&language=en-US&page=1")!)){(data, request, error) in
            
            do {
                let result = try JSONDecoder().decode(MovieResult.self, from: data!)
                DispatchQueue.main.async {
                    self.dataListing = result.results
                    self.tableView.reloadData()
                }
            }catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }


}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataListing.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieListingTableViewCell
        cell.updateData(data: dataListing[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let vc = MovieDetailViewController()
        vc.setup(data: dataListing[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

