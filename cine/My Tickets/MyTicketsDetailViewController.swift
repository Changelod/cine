//
//  mytickets.swift
//  cine
//
//  Created by Luis Chavez pozo on 20/01/25.
//

import UIKit

class MyTicketsDetailViewController: UIViewController {

    private var ticket: Ticket

    private var ticketTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = "Ticket ####"
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.layer.masksToBounds = true
        return label
    }()

    private let ticketDetailStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.distribution = .fill
        stackview.alignment = .fill
        stackview.spacing = 8
        return stackview
    }()

    private var screenNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "Sala: "
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.layer.cornerRadius = 10.0
        label.layer.masksToBounds = true
        return label
    }()

    private var movieNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "Pelicula: "
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.layer.cornerRadius = 10.0
        label.layer.masksToBounds = true
        return label
    }()

    private var seatNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "Asientos: "
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.layer.cornerRadius = 10.0
        label.layer.masksToBounds = true
        return label
    }()

    private var movieShowTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "Hora: "
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.layer.cornerRadius = 10.0
        label.layer.masksToBounds = true
        return label
    }()

    init(ticket: Ticket) {
        self.ticket = ticket
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureView(with: ticket)
    }

}

extension MyTicketsDetailViewController {

    func setupUI() {
        view.backgroundColor = .systemCyan
        setupTicketTitleLabel()
        setupTicketDetailStackView()
    }

    func setupTicketTitleLabel(){
        view.addSubview(ticketTitleLabel)
        NSLayoutConstraint.activate([
            ticketTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            ticketTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ticketTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ticketTitleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0)
        ])
    }

    func setupTicketDetailStackView() {
        view.addSubview(ticketDetailStackView)
        ticketDetailStackView.addArrangedSubview(screenNumberLabel)
        ticketDetailStackView.addArrangedSubview(movieNameLabel)
        ticketDetailStackView.addArrangedSubview(seatNumberLabel)
        ticketDetailStackView.addArrangedSubview(movieShowTimeLabel)

        NSLayoutConstraint.activate([
            ticketDetailStackView.topAnchor.constraint(equalTo: ticketTitleLabel.bottomAnchor, constant: 10),
            ticketDetailStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ticketDetailStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            ticketDetailStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }

    func configureView(with ticket: Ticket) {
        ticketTitleLabel.text = "Ticket \(ticket.ticketNumber)"
        screenNumberLabel.text = "Sala: \(ticket.screen)"
        movieNameLabel.text = "Película: \(ticket.movie)"
        seatNumberLabel.text = "Asiento: \(ticket.seatNumber)"
        movieShowTimeLabel.text = "Hora: \(ticket.showTime)"
    }
}
