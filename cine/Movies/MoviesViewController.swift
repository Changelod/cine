//
//  MoviesViewController.swift
//  cine
//
//  Created by Luis Chavez pozo on 21/01/25.
//

import UIKit

class MoviesViewController: UIViewController{
    
    private var movies: [Movie] = [
        Movie(
            movieName: "Existenz",
            imageName: "Existenz",
            synopsis: "A game designer on the run from assassins must play her latest virtual reality creation with a marketing trainee to determine if the game has been damaged.",
            showTimes: [
                ShowTime(
                    time: "1800",screen: "1",
                         seats: [
                            Seat(id: "A1", isAvailable: true),
                            Seat(id: "A2", isAvailable: false), // Ocupado
                            Seat(id: "A3", isAvailable: true),
                            Seat(id: "A4", isAvailable: true),
                            Seat(id: "A5", isAvailable: false),
                            
                            Seat(id: "B1", isAvailable: true),
                            Seat(id: "B2", isAvailable: true),
                            Seat(id: "B3", isAvailable: false),
                            Seat(id: "B4", isAvailable: true),
                            Seat(id: "B5", isAvailable: true),
                            
                            Seat(id: "C1", isAvailable: false),
                            Seat(id: "C2", isAvailable: true),
                            Seat(id: "C3", isAvailable: true),
                            Seat(id: "C4", isAvailable: false),
                            Seat(id: "C5", isAvailable: true),
                            
                            Seat(id: "D1", isAvailable: true),
                            Seat(id: "D2", isAvailable: true),
                            Seat(id: "D3", isAvailable: true),
                            Seat(id: "D4", isAvailable: false),
                            Seat(id: "D5", isAvailable: true)
                            ]
                        ),
                    ShowTime(time: "2000",
                             screen: "3",
                             seats: [
                                Seat(id: "A1", isAvailable: true),
                                Seat(id: "A2", isAvailable: false), // Ocupado
                                Seat(id: "A3", isAvailable: true),
                                Seat(id: "A4", isAvailable: true),
                                Seat(id: "A5", isAvailable: false),
                                
                                Seat(id: "B1", isAvailable: true),
                                Seat(id: "B2", isAvailable: true),
                                Seat(id: "B3", isAvailable: false),
                                Seat(id: "B4", isAvailable: true),
                                Seat(id: "B5", isAvailable: true),
                                
                                Seat(id: "C1", isAvailable: false),
                                Seat(id: "C2", isAvailable: true),
                                Seat(id: "C3", isAvailable: true),
                                Seat(id: "C4", isAvailable: false),
                                Seat(id: "C5", isAvailable: true),
                                
                                Seat(id: "D1", isAvailable: true),
                                Seat(id: "D2", isAvailable: true),
                                Seat(id: "D3", isAvailable: true),
                                Seat(id: "D4", isAvailable: false),
                                Seat(id: "D5", isAvailable: true)
                                ]
                            ),
                    ShowTime(time: "1830",
                             screen: "4",
                             seats: [
                                Seat(id: "A1", isAvailable: true),
                                Seat(id: "A2", isAvailable: false), // Ocupado
                                Seat(id: "A3", isAvailable: true),
                                Seat(id: "A4", isAvailable: true),
                                Seat(id: "A5", isAvailable: false),
                                
                                Seat(id: "B1", isAvailable: true),
                                Seat(id: "B2", isAvailable: true),
                                Seat(id: "B3", isAvailable: false),
                                Seat(id: "B4", isAvailable: true),
                                Seat(id: "B5", isAvailable: true),
                                
                                Seat(id: "C1", isAvailable: false),
                                Seat(id: "C2", isAvailable: true),
                                Seat(id: "C3", isAvailable: true),
                                Seat(id: "C4", isAvailable: false),
                                Seat(id: "C5", isAvailable: true),
                                
                                Seat(id: "D1", isAvailable: true),
                                Seat(id: "D2", isAvailable: true),
                                Seat(id: "D3", isAvailable: true),
                                Seat(id: "D4", isAvailable: false),
                                Seat(id: "D5", isAvailable: true)
                                ]
                            ),
                    ShowTime(time: "1400",
                             screen: "6",
                             seats: [
                                Seat(id: "A1", isAvailable: true),
                                Seat(id: "A2", isAvailable: false), // Ocupado
                                Seat(id: "A3", isAvailable: true),
                                Seat(id: "A4", isAvailable: true),
                                Seat(id: "A5", isAvailable: false),
                                
                                Seat(id: "B1", isAvailable: true),
                                Seat(id: "B2", isAvailable: true),
                                Seat(id: "B3", isAvailable: false),
                                Seat(id: "B4", isAvailable: true),
                                Seat(id: "B5", isAvailable: true),
                                
                                Seat(id: "C1", isAvailable: false),
                                Seat(id: "C2", isAvailable: true),
                                Seat(id: "C3", isAvailable: true),
                                Seat(id: "C4", isAvailable: false),
                                Seat(id: "C5", isAvailable: true),
                                
                                Seat(id: "D1", isAvailable: true),
                                Seat(id: "D2", isAvailable: true),
                                Seat(id: "D3", isAvailable: true),
                                Seat(id: "D4", isAvailable: false),
                                Seat(id: "D5", isAvailable: true)
                                ]
                            ),
                    ShowTime(time: "1600",
                             screen: "7",
                             seats: [
                                Seat(id: "A1", isAvailable: true),
                                Seat(id: "A2", isAvailable: false), // Ocupado
                                Seat(id: "A3", isAvailable: true),
                                Seat(id: "A4", isAvailable: true),
                                Seat(id: "A5", isAvailable: false),
                                
                                Seat(id: "B1", isAvailable: true),
                                Seat(id: "B2", isAvailable: true),
                                Seat(id: "B3", isAvailable: false),
                                Seat(id: "B4", isAvailable: true),
                                Seat(id: "B5", isAvailable: true),
                                
                                Seat(id: "C1", isAvailable: false),
                                Seat(id: "C2", isAvailable: true),
                                Seat(id: "C3", isAvailable: true),
                                Seat(id: "C4", isAvailable: false),
                                Seat(id: "C5", isAvailable: true),
                                
                                Seat(id: "D1", isAvailable: true),
                                Seat(id: "D2", isAvailable: true),
                                Seat(id: "D3", isAvailable: true),
                                Seat(id: "D4", isAvailable: false),
                                Seat(id: "D5", isAvailable: true)
                                ]
                            ),
            ]
            
        ),
        Movie(
            movieName: "Crimes of the Future",
            imageName: "Crimesoffuture",
            synopsis: "In the near future, humans adapt to synthetic surroundings, and a performance artist publicly showcases the metamorphosis of his organs.",
            showTimes: [
                ShowTime(
                    time: "1800",
                    screen: "2",
                    seats: [
                       Seat(id: "A1", isAvailable: true),
                       Seat(id: "A2", isAvailable: false), // Ocupado
                       Seat(id: "A3", isAvailable: true),
                       Seat(id: "A4", isAvailable: true),
                       Seat(id: "A5", isAvailable: false),
                       
                       Seat(id: "B1", isAvailable: true),
                       Seat(id: "B2", isAvailable: true),
                       Seat(id: "B3", isAvailable: false),
                       Seat(id: "B4", isAvailable: true),
                       Seat(id: "B5", isAvailable: true),
                       
                       Seat(id: "C1", isAvailable: false),
                       Seat(id: "C2", isAvailable: true),
                       Seat(id: "C3", isAvailable: true),
                       Seat(id: "C4", isAvailable: false),
                       Seat(id: "C5", isAvailable: true),
                       
                       Seat(id: "D1", isAvailable: true),
                       Seat(id: "D2", isAvailable: true),
                       Seat(id: "D3", isAvailable: true),
                       Seat(id: "D4", isAvailable: false),
                       Seat(id: "D5", isAvailable: true)
                       ]
                ),
                ShowTime(
                    time: "2000",
                    screen: "4",
                    seats: [
                       Seat(id: "A1", isAvailable: true),
                       Seat(id: "A2", isAvailable: false), // Ocupado
                       Seat(id: "A3", isAvailable: true),
                       Seat(id: "A4", isAvailable: true),
                       Seat(id: "A5", isAvailable: false),
                       
                       Seat(id: "B1", isAvailable: true),
                       Seat(id: "B2", isAvailable: true),
                       Seat(id: "B3", isAvailable: false),
                       Seat(id: "B4", isAvailable: true),
                       Seat(id: "B5", isAvailable: true),
                       
                       Seat(id: "C1", isAvailable: false),
                       Seat(id: "C2", isAvailable: true),
                       Seat(id: "C3", isAvailable: true),
                       Seat(id: "C4", isAvailable: false),
                       Seat(id: "C5", isAvailable: true),
                       
                       Seat(id: "D1", isAvailable: true),
                       Seat(id: "D2", isAvailable: true),
                       Seat(id: "D3", isAvailable: true),
                       Seat(id: "D4", isAvailable: false),
                       Seat(id: "D5", isAvailable: true)
                       ]
                        ),
                ShowTime(
                    time: "1830",
                    screen: "6",
                    seats: [
                       Seat(id: "A1", isAvailable: true),
                       Seat(id: "A2", isAvailable: false), // Ocupado
                       Seat(id: "A3", isAvailable: true),
                       Seat(id: "A4", isAvailable: true),
                       Seat(id: "A5", isAvailable: false),
                       
                       Seat(id: "B1", isAvailable: true),
                       Seat(id: "B2", isAvailable: true),
                       Seat(id: "B3", isAvailable: false),
                       Seat(id: "B4", isAvailable: true),
                       Seat(id: "B5", isAvailable: true),
                       
                       Seat(id: "C1", isAvailable: false),
                       Seat(id: "C2", isAvailable: true),
                       Seat(id: "C3", isAvailable: true),
                       Seat(id: "C4", isAvailable: false),
                       Seat(id: "C5", isAvailable: true),
                       
                       Seat(id: "D1", isAvailable: true),
                       Seat(id: "D2", isAvailable: true),
                       Seat(id: "D3", isAvailable: true),
                       Seat(id: "D4", isAvailable: false),
                       Seat(id: "D5", isAvailable: true)
                       ]
                    ),
                ShowTime(
                    time: "1400",
                    screen: "8",
                    seats: [
                       Seat(id: "A1", isAvailable: true),
                       Seat(id: "A2", isAvailable: false), // Ocupado
                       Seat(id: "A3", isAvailable: true),
                       Seat(id: "A4", isAvailable: true),
                       Seat(id: "A5", isAvailable: false),
                       
                       Seat(id: "B1", isAvailable: true),
                       Seat(id: "B2", isAvailable: true),
                       Seat(id: "B3", isAvailable: false),
                       Seat(id: "B4", isAvailable: true),
                       Seat(id: "B5", isAvailable: true),
                       
                       Seat(id: "C1", isAvailable: false),
                       Seat(id: "C2", isAvailable: true),
                       Seat(id: "C3", isAvailable: true),
                       Seat(id: "C4", isAvailable: false),
                       Seat(id: "C5", isAvailable: true),
                       
                       Seat(id: "D1", isAvailable: true),
                       Seat(id: "D2", isAvailable: true),
                       Seat(id: "D3", isAvailable: true),
                       Seat(id: "D4", isAvailable: false),
                       Seat(id: "D5", isAvailable: true)
                       ]
                    ),
                ShowTime(
                    time: "1600",
                    screen: "9",
                    seats: [
                       Seat(id: "A1", isAvailable: true),
                       Seat(id: "A2", isAvailable: false), // Ocupado
                       Seat(id: "A3", isAvailable: true),
                       Seat(id: "A4", isAvailable: true),
                       Seat(id: "A5", isAvailable: false),
                       
                       Seat(id: "B1", isAvailable: true),
                       Seat(id: "B2", isAvailable: true),
                       Seat(id: "B3", isAvailable: false),
                       Seat(id: "B4", isAvailable: true),
                       Seat(id: "B5", isAvailable: true),
                       
                       Seat(id: "C1", isAvailable: false),
                       Seat(id: "C2", isAvailable: true),
                       Seat(id: "C3", isAvailable: true),
                       Seat(id: "C4", isAvailable: false),
                       Seat(id: "C5", isAvailable: true),
                       
                       Seat(id: "D1", isAvailable: true),
                       Seat(id: "D2", isAvailable: true),
                       Seat(id: "D3", isAvailable: true),
                       Seat(id: "D4", isAvailable: false),
                       Seat(id: "D5", isAvailable: true)
                       ]
                    ),
                
            ]
        )
    ]
    
    private var movieListingTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = "Cartelera"
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
//        label.layer.borderColor = UIColor.black.cgColor
//        label.layer.borderWidth = 1.0
//        label.layer.cornerRadius = 5.0
        label.layer.masksToBounds = true
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 140
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension MoviesViewController {
    func setupUI(){
        view.backgroundColor = .systemGreen
        setupMovieTitleLabel()
        setupTableView()
    }
    
    func setupMovieTitleLabel(){
        view.addSubview(movieListingTitleLabel)
        NSLayoutConstraint.activate([
            movieListingTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            movieListingTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            movieListingTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            movieListingTitleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0)
        ])
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MoviesCellView.self, forCellReuseIdentifier: "MovieCell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: movieListingTitleLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
    
}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MoviesCellView else {
            return UITableViewCell()
        }
        let movie = movies[indexPath.row]
        cell.configure(with: movie)
        cell.delegate = self
        return cell
    }
}

extension MoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = movies[indexPath.row]
        let vc = ShowTimeViewController(movie: selectedMovie)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MoviesViewController: MoviesCellViewDelegate {
    func didTapShowTime(for movie: Movie) {
        let vc = ShowTimeViewController(movie: movie)
        navigationController?.pushViewController(vc, animated: true)
    }
}

class Movie {
    let movieName : String
    let imageName: String
    let synopsis: String
    let showTimes: [ShowTime]
    
    init(movieName: String, imageName: String, synopsis: String, showTimes: [ShowTime]) {
        self.movieName = movieName
        self.imageName = imageName
        self.synopsis = synopsis
        self.showTimes = showTimes
    }
}


