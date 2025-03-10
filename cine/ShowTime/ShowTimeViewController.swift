//
//  ShowTimeViewController.swift
//  cine
//
//  Created by Angelo on 6/02/25.
//

import UIKit

class ShowTimeViewController: UIViewController{
    
    private var movie: Movie

    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var movieNameTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.layer.masksToBounds = true
        return label
    }()
    
    private var movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var movieSynopsisLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.layer.masksToBounds = true
        return label
    }()
    
    private var movieScheduleTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = "Horarios"
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
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
        configureView(with: movie)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ShowTimeCellView.self, forCellReuseIdentifier: "ShowTimeCell")
        
    }
    
    func configureView(with movie: Movie) {
        movieNameTitleLabel.text = movie.movieName
        movieImage.image = UIImage(named: movie.imageName)
        movieSynopsisLabel.text = movie.synopsis
    }
}

extension ShowTimeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.showTimes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowTimeCell", for: indexPath) as! ShowTimeCellView
        let showTime = movie.showTimes[indexPath.row]
        cell.configure(with: showTime)
        return cell
    }
}

extension ShowTimeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedShowtime = movie.showTimes[indexPath.row]
        let seatsVC = SeatsViewController(movie: movie, showtime: selectedShowtime)
        navigationController?.pushViewController(seatsVC, animated: true)
    }
}

extension ShowTimeViewController {
    
    private func setupUI(){
        view.backgroundColor = .systemMint
        setupMovieNameTitleLabel()
        setupMovieImage()
        setupMovieSynopsisLabel()
        setupMovieScheduleTitleLabel()
        setupTableView()
    }
    
    private func setupMovieNameTitleLabel(){
        view.addSubview(movieNameTitleLabel)
        NSLayoutConstraint.activate([
            movieNameTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieNameTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            movieNameTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        ])
    }
    
    private func setupMovieImage() {
        view.addSubview(movieImage)
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: movieNameTitleLabel.bottomAnchor, constant: 5),
            movieImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
//            movieImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            movieImage.widthAnchor.constraint(equalToConstant: 150),
            movieImage.heightAnchor.constraint(equalToConstant: 100)
            
        ])
    }
    
    private func setupMovieSynopsisLabel(){
        view.addSubview(movieSynopsisLabel)
        NSLayoutConstraint.activate([
            movieSynopsisLabel.topAnchor.constraint(equalTo: movieNameTitleLabel.bottomAnchor, constant: 10),
            movieSynopsisLabel.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 5),
            movieSynopsisLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
    
    private func setupMovieScheduleTitleLabel(){
        view.addSubview(movieScheduleTitleLabel)
        NSLayoutConstraint.activate([
            movieScheduleTitleLabel.topAnchor.constraint(equalTo: movieSynopsisLabel.bottomAnchor,  constant: 10),
            movieScheduleTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            movieScheduleTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        ])
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: movieScheduleTitleLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

class ShowTime {
    let time : String
    let screen : String
    var seats: [Seat]
    
    init(time: String, screen: String, seats: [Seat]) {
        self.time = time
        self.screen = screen
        self.seats = seats
    }
    
}




