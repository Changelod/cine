//
//  TicketPurchaseViewController.swift
//  cine
//
//  Created by Angelo on 17/02/25.
//

import UIKit

class TicketPurchaseViewController: UIViewController {
    
    private var ticket: Ticket
    
    private var purchaseTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30)
        label.text = "Gracias por tu compra"
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.layer.masksToBounds = true
        return label
    }()

    private let ticketDetailStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.distribution = .equalSpacing
        stackview.alignment = .fill
        stackview.spacing = 8
        return stackview
    }()
    
    private let ticketNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "Número de ticket: "
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        label.layer.cornerRadius = 10.0
        label.layer.masksToBounds = true
        return label
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
    
    private lazy var doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Volver a Mis Tickets", for: .normal)
        button.addTarget(self, action: #selector(handleDoneButton), for: .touchUpInside)
        return button
    }()
    
    init(ticket : Ticket) {
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
    
    func configureView(with ticket : Ticket) {
//        ticketTitleLabel.text = "Confirmar entrada"
        ticketNumberLabel.text = "Número de ticket: \(ticket.ticketNumber)"
        screenNumberLabel.text = "Sala: \(ticket.screen)"
        movieNameLabel.text = "Película: \(ticket.movie)"
        seatNumberLabel.text = "Asiento: \(ticket.seatNumber)"
        movieShowTimeLabel.text = "Hora: \(ticket.showTime)"
    }
    

    
    @objc private func handleDoneButton() {
        let myTicketsVC = MyTicketsViewController() // Usa el inicializador adecuado
        navigationController?.pushViewController(myTicketsVC, animated: true)
    }
    
}

extension TicketPurchaseViewController {

    func setupUI() {
        view.backgroundColor = .systemCyan
        setupTicketTitleLabel()
        setupTicketDetailStackView()
    }

    func setupTicketTitleLabel(){
        view.addSubview(purchaseTitleLabel)
        NSLayoutConstraint.activate([
            purchaseTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            purchaseTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            purchaseTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            purchaseTitleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0)
        ])
    }

    func setupTicketDetailStackView() {
        view.addSubview(ticketDetailStackView)
        ticketDetailStackView.addArrangedSubview(ticketNumberLabel)
        ticketDetailStackView.addArrangedSubview(screenNumberLabel)
        ticketDetailStackView.addArrangedSubview(movieNameLabel)
        ticketDetailStackView.addArrangedSubview(seatNumberLabel)
        ticketDetailStackView.addArrangedSubview(movieShowTimeLabel)
        ticketDetailStackView.addArrangedSubview(doneButton)

        NSLayoutConstraint.activate([
            ticketDetailStackView.topAnchor.constraint(equalTo: purchaseTitleLabel.bottomAnchor, constant: 10),
            ticketDetailStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            ticketDetailStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            ticketDetailStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
    
}


