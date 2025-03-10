//
//  MoviesCellView.swift
//  cine
//
//  Created by Luis Chavez pozo on 22/01/25.
//

import UIKit

protocol MoviesCellViewDelegate: AnyObject {
    func didTapShowTime(for movie: Movie)
}


class MoviesCellView: UITableViewCell {
    
    
    weak var delegate: MoviesCellViewDelegate?
    private var movie: Movie?
    
    
    private lazy var movieImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let movieLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var showTimeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Horarios", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.sizeToFit()
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(handleDidTap), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with movie: Movie) {
        self.movie = movie
        movieLabel.text = "\(movie.movieName)"
        movieImage.image = UIImage(named: movie.imageName)
    }
    
    @objc func handleDidTap() {
        guard let movie = movie else { return }
        delegate?.didTapShowTime(for: movie)
    }
}

extension MoviesCellView {
    func setupUI() {
        setupMovieImage()
        setupMovieLabel()
        setupShowTimeButton()
    }
    
    func setupMovieImage() {
        addSubview(movieImage)
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            //            movieImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            //            movieImage.widthAnchor.constraint(equalToConstant: 100),
            movieImage.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func setupMovieLabel() {
        addSubview(movieLabel)
        NSLayoutConstraint.activate([
            movieLabel.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 20),
            movieLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            movieLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
        ])
    }
    
    func setupShowTimeButton() {
        addSubview(showTimeButton)
        NSLayoutConstraint.activate([
            showTimeButton.topAnchor.constraint(equalTo: movieLabel.bottomAnchor, constant: 10),
            showTimeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 120),
            showTimeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -120),
            showTimeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
            
        ])
        
        
    }
}
